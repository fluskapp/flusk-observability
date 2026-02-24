# AGENTS.md — Rules for AI Agents

## The One Rule

**You can ONLY create or edit files in the `schema/` directory.**

That's it. Nothing else. No TypeScript. No Python. No scripts. No configs beyond what's here.

## What You Can Do

- Create new YAML files in schema/entities/, schema/functions/, schema/commands/, schema/routes/, schema/providers/
- Edit existing YAML files in those directories
- Edit this README or AGENTS.md

## What You CANNOT Do

- Create .ts, .py, .js, or any code files
- Create files outside schema/
- Modify .github/workflows/
- Run build commands (CI does this)

## YAML Rules

### Entities
- Follow the entity schema: name, description, storage, fields, capabilities
- Field types: string, number, boolean, enum, json, date
- Capabilities: crud, time-range, aggregation

### Functions
- Must define: name, description, inputs, output, steps
- Steps can only use: call, filter, forEach, map, validate, transform, condition, assign, return
- `call` must reference a function that exists in schema/functions/ OR a CRUD function from an entity (create*, find*, list*, update*, delete*)
- Entity CRUD functions are auto-generated from entity capabilities

### Commands
- Must reference functions via `call` or `steps[].call`
- Args and options must have types that match entity fields or primitives

### Routes
- Must reference an entity
- Operations must reference functions via `call`

### Providers
- Must define config fields and methods with templates
- Templates use {{mustache}} syntax

## Validation

CI validates all YAMLs on every push. If validation fails, the push is rejected.
Cross-references are checked: every `call` must point to a real function.
