# flusk-observability

YAML schema definitions for Flusk's observability features — alerting, cost tracking, drift detection, and circuit breaker.

**No code lives here.** Only YAML schemas + CI that generates code and opens PRs to [flusk-dev](https://github.com/adirbenyossef/flusk-dev).

## How It Works

```
You edit YAML → Push → CI validates → CI generates Node.js code → PR opened on flusk-dev
```

1. Write or edit YAML files in `schema/`
2. Push to this repo
3. CI runs [flusk-lang](https://github.com/fluskapp/flusk-lang) compiler to validate
4. On push to `main`, CI generates Node.js code and opens a PR on `adirbenyossef/flusk-dev`
5. flusk-dev maintainer reviews and merges

## Project Structure

```
schema/
  entities/       # Data models (AlertChannel, AlertEvent)
  functions/      # Business logic (dispatch, filter, circuit breaker)
  commands/       # CLI commands (alerts-setup, alerts-test, kill)
  routes/         # REST API endpoints
  providers/      # Alert providers (PagerDuty, Slack, Discord, webhook, email)
```

## Current Features

### Alerting
- **5 providers:** PagerDuty, Slack, Discord, generic webhook, email
- **Severity filtering:** critical, warning, info — channels only fire for matching severity
- **Commands:** `alerts-setup`, `alerts-test`, `alerts-list`, `alerts-mute`, `alerts-ack`

### Circuit Breaker
- Daily and monthly spend limits
- Auto-pause agents when limits are exceeded
- `kill` command for emergency stops

## Adding a New Feature

### New Entity

Create `schema/entities/my-thing.entity.yaml`:

```yaml
name: MyThing
description: What it is
storage: [sqlite]

fields:
  name:
    type: string
    required: true
    description: The name

capabilities:
  crud: true
```

### New Function

Create `schema/functions/do-something.function.yaml`:

```yaml
name: doSomething
description: What it does
inputs:
  - name: thing
    type: MyThing
output:
  type: boolean
steps:
  - id: result
    action: return
    value: true
```

Push, and CI handles the rest.

## Requirements

- **FLUSK_DEV_TOKEN** secret: GitHub PAT with repo access to `adirbenyossef/flusk-dev` (for the generate-pr workflow)

## Compiler

Schemas are validated and compiled by [flusk-lang](https://github.com/fluskapp/flusk-lang).
