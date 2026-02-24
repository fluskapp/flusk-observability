#!/usr/bin/env node
import { readFileSync, readdirSync, statSync } from 'fs';
import { join, relative } from 'path';
import yaml from 'js-yaml';

const ROOT = new URL('..', import.meta.url).pathname.replace(/\/$/, '');
const SCHEMA = join(ROOT, 'schema');

// ── Helpers ──────────────────────────────────────────────────────────────────

function walk(dir, ext = '.yaml') {
  const results = [];
  for (const f of readdirSync(dir)) {
    const p = join(dir, f);
    if (statSync(p).isDirectory()) results.push(...walk(p, ext));
    else if (f.endsWith(ext)) results.push(p);
  }
  return results;
}

function loadYaml(path) {
  const text = readFileSync(path, 'utf8');
  try {
    const doc = yaml.load(text);
    return { doc, text, lines: text.split('\n') };
  } catch (e) {
    console.warn(`⚠️  YAML parse error in ${relative(ROOT, path)}: ${e.reason || e.message}`);
    return { doc: null, text, lines: text.split('\n') };
  }
}

function findLineOf(lines, key, value) {
  const patterns = [
    `${key}: ${value}`,
    `${key}: "${value}"`,
    `${key}: '${value}'`,
  ];
  for (let i = 0; i < lines.length; i++) {
    const trimmed = lines[i].trim();
    if (patterns.some(p => trimmed === p || trimmed.startsWith(p + ' '))) return i + 1;
  }
  return null;
}

// ── Load all files ───────────────────────────────────────────────────────────

const files = walk(SCHEMA);
const inventory = {
  entities: new Set(),
  functions: new Set(),
  commands: new Set(),
  routes: new Set(),
  providers: new Set(),
  clients: new Set(),
  services: new Set(),
  middleware: new Set(),
  plugins: new Set(),
};

const parsed = [];

for (const fp of files) {
  const rel = relative(ROOT, fp);
  const { doc, text, lines } = loadYaml(fp);
  if (!doc || !doc.name) continue;

  let kind = null;
  if (rel.includes('/entities/'))   { kind = 'entity';   inventory.entities.add(doc.name); }
  if (rel.includes('/functions/'))  { kind = 'function';  inventory.functions.add(doc.name); }
  if (rel.includes('/commands/'))   { kind = 'command';   inventory.commands.add(doc.name); }
  if (rel.includes('/routes/'))     { kind = 'route';     inventory.routes.add(doc.name); }
  if (rel.includes('/providers/'))  { kind = 'provider';  inventory.providers.add(doc.name); }
  if (rel.includes('/clients/'))    { kind = 'client';    inventory.clients.add(doc.name); }
  if (rel.includes('/services/'))   { kind = 'service';   inventory.services.add(doc.name); }
  if (rel.includes('/middleware/')) { kind = 'middleware'; inventory.middleware.add(doc.name); }
  if (rel.includes('/plugins/'))    { kind = 'plugin';    inventory.plugins.add(doc.name); }

  parsed.push({ fp, rel, doc, lines, kind });
}

// ── Build auto-generated CRUD function names ─────────────────────────────────

const crudPrefixes = ['create', 'find', 'list', 'update', 'delete'];
const crudFunctions = new Set();

for (const entity of inventory.entities) {
  // e.g. entity "AlertChannel" → createAlertChannel, findAlertChannelById, listAlertChannels, ...
  crudFunctions.add(`create${entity}`);
  crudFunctions.add(`find${entity}ById`);
  crudFunctions.add(`list${entity}s`);
  crudFunctions.add(`update${entity}`);
  crudFunctions.add(`delete${entity}`);
  crudFunctions.add(`query${entity}`);
}

// Also allow findEntityByField patterns (e.g. findLlmCallByPromptHash)
function isFindByFieldPattern(name) {
  for (const entity of inventory.entities) {
    if (name.startsWith(`find${entity}By`)) return true;
  }
  return false;
}

function isValidFunction(name) {
  return inventory.functions.has(name) || crudFunctions.has(name) || isFindByFieldPattern(name);
}

// Also treat any call containing a dot (client calls like datadogClient.submitMetrics) as valid
function isValidCall(name) {
  if (name.includes('.')) return true; // client method call
  return isValidFunction(name);
}

// ── Validate ─────────────────────────────────────────────────────────────────

const errors = [];
let validCount = 0;
let totalRefs = 0;

function addError(rel, line, msg) {
  errors.push({ file: rel, line, msg });
}

function checkCall(rel, lines, callName) {
  totalRefs++;
  if (isValidCall(callName)) {
    validCount++;
  } else {
    const line = findLineOf(lines, 'call', callName);
    addError(rel, line, `broken call: "${callName}" — function not found`);
  }
}

function checkEntity(rel, lines, entityName) {
  totalRefs++;
  if (inventory.entities.has(entityName)) {
    validCount++;
  } else {
    const line = findLineOf(lines, 'entity', entityName) || findLineOf(lines, 'type', entityName);
    addError(rel, line, `broken entity ref: "${entityName}" — entity not found`);
  }
}

for (const { rel, doc, lines, kind } of parsed) {
  if (kind === 'function') {
    // Check call: in steps
    if (Array.isArray(doc.steps)) {
      for (const step of doc.steps) {
        if (step.call) checkCall(rel, lines, step.call);
      }
    }
    // Check entity refs in inputs
    if (Array.isArray(doc.inputs)) {
      for (const input of doc.inputs) {
        if (input.type && inventory.entities.has(input.type)) {
          totalRefs++; validCount++;
        }
        // Check types that look like entity refs (PascalCase, not primitive)
        if (input.type && /^[A-Z]/.test(input.type)) {
          const base = input.type.replace(/\[\]$/, '');
          if (!inventory.entities.has(base) && !['Database', 'DispatchResult', 'ProviderRegistry', 'String', 'Number', 'Boolean', 'Object'].includes(base)) {
            // Soft check — don't error on custom types that might be inline
          }
        }
      }
    }
  }

  if (kind === 'command') {
    // Check call: in action
    if (doc.action?.call) checkCall(rel, lines, doc.action.call);
    // Check calls in steps if present
    if (Array.isArray(doc.steps)) {
      for (const step of doc.steps) {
        if (step.call) checkCall(rel, lines, step.call);
      }
    }
  }

  if (kind === 'middleware') {
    // Check call: in steps
    if (Array.isArray(doc.steps)) {
      for (const step of doc.steps) {
        if (step.call) checkCall(rel, lines, step.call);
      }
    }
  }

  if (kind === 'service') {
    // Check entity ref in capture
    if (doc.capture?.entity) checkEntity(rel, lines, doc.capture.entity);
    // Check middleware refs
    if (Array.isArray(doc.middleware)) {
      for (const mw of doc.middleware) {
        totalRefs++;
        if (inventory.middleware.has(mw)) {
          validCount++;
        } else {
          addError(rel, null, `broken middleware ref: "${mw}" — middleware not found`);
        }
      }
    }
  }

  if (kind === 'route') {
    // Check entity:
    if (doc.entity) checkEntity(rel, lines, doc.entity);
    // Check call: in operations
    if (Array.isArray(doc.operations)) {
      for (const op of doc.operations) {
        if (op.call) checkCall(rel, lines, op.call);
      }
    }
  }
}

// ── Output ───────────────────────────────────────────────────────────────────

console.log('\n🔍 Cross-Reference Validation Report');
console.log('═'.repeat(50));
console.log(`📁 Files scanned: ${parsed.length}`);
console.log(`🔗 Total references: ${totalRefs}`);
console.log(`✅ Valid: ${validCount}`);
console.log(`❌ Broken: ${errors.length}`);
console.log('═'.repeat(50));

if (errors.length > 0) {
  console.log('\nBroken References:\n');
  for (const e of errors) {
    const loc = e.line ? `:${e.line}` : '';
    console.log(`  ❌ ${e.file}${loc} — ${e.msg}`);
  }
  console.log('');
  process.exit(1);
} else {
  console.log('\n✅ All cross-references are valid!\n');
}
