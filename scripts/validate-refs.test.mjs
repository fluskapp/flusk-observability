#!/usr/bin/env node
import { execSync } from 'child_process';
import { mkdirSync, writeFileSync, rmSync } from 'fs';
import { join } from 'path';
import { tmpdir } from 'os';
import assert from 'node:assert/strict';
import { test, describe } from 'node:test';

const ROOT = new URL('..', import.meta.url).pathname.replace(/\/$/, '');

describe('validate-refs', () => {
  test('passes on valid schema directory', () => {
    const result = execSync(`node ${join(ROOT, 'scripts/validate-refs.mjs')}`, {
      cwd: ROOT,
      encoding: 'utf-8',
    });
    assert.ok(result.includes('All cross-references are valid'));
  });

  test('detects broken function references', () => {
    const tmp = join(tmpdir(), `flusk-validate-${Date.now()}`);
    const schema = join(tmp, 'schema');
    mkdirSync(join(schema, 'entities'), { recursive: true });
    mkdirSync(join(schema, 'functions'), { recursive: true });
    mkdirSync(join(schema, 'routes'), { recursive: true });

    writeFileSync(join(schema, 'entities', 'user.entity.yaml'), [
      'name: User',
      'fields:',
      '  - name: id',
      '    type: uuid',
    ].join('\n'));

    writeFileSync(join(schema, 'routes', 'users.route.yaml'), [
      'name: users',
      'basePath: /api/users',
      'entity: User',
      'operations:',
      '  - method: GET',
      '    path: ""',
      '    call: nonExistentFunction',
    ].join('\n'));

    try {
      execSync(`node ${join(ROOT, 'scripts/validate-refs.mjs')}`, {
        cwd: tmp,
        encoding: 'utf-8',
        env: { ...process.env, SCHEMA_DIR: schema },
      });
      assert.fail('Should have thrown');
    } catch (err) {
      assert.ok(err.stdout.includes('Broken') || err.stderr.includes('Broken') || err.status !== 0);
    } finally {
      rmSync(tmp, { recursive: true, force: true });
    }
  });

  test('validates entity references in routes', () => {
    const tmp = join(tmpdir(), `flusk-validate-entity-${Date.now()}`);
    const schema = join(tmp, 'schema');
    mkdirSync(join(schema, 'routes'), { recursive: true });

    writeFileSync(join(schema, 'routes', 'test.route.yaml'), [
      'name: test',
      'basePath: /api/test',
      'entity: NonExistentEntity',
      'operations:',
      '  - method: GET',
      '    path: ""',
      '    call: listNonExistentEntitys',
    ].join('\n'));

    try {
      execSync(`node ${join(ROOT, 'scripts/validate-refs.mjs')}`, {
        cwd: tmp,
        encoding: 'utf-8',
        env: { ...process.env, SCHEMA_DIR: schema },
      });
      assert.fail('Should have thrown');
    } catch (err) {
      assert.ok(err.status !== 0);
    } finally {
      rmSync(tmp, { recursive: true, force: true });
    }
  });
});
