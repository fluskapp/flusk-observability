# @flusk/observability

YAML-first backend for the Flusk AI observability platform. All code is generated from YAML schemas via [flusk-lang](https://github.com/fluskapp/flusk-lang).

## Architecture

```
schema/           ← YAML source of truth (397 files)
  entities/       ← Data models (51 entities)
  functions/      ← Business logic (226 functions)
  routes/         ← HTTP endpoints (39 routes)
  commands/       ← CLI commands (34)
  events/         ← Async events (11)
  workers/        ← Background jobs (8)
  streams/        ← Real-time SSE/WS (5)
  clients/        ← External API clients (6)
  providers/      ← Outbound notifications (5)
  middleware/     ← Request/response hooks (6)
  plugins/        ← Fastify plugins (1)
  services/       ← Infrastructure services (1)

generated/        ← Auto-generated code (DO NOT EDIT)
  node/           ← Complete Platformatic Watt app
    apps/api/     ← Fastify API service + SQLite migrations
    src/          ← All generated TypeScript
    __tests__/    ← Unit + integration tests
  client/         ← Typed client SDK
  openapi.yaml    ← OpenAPI 3.1 spec

e2e/              ← End-to-end test flows
deploy/           ← GCP + AWS deployment configs
```

## Features

### Core Observability
- **LLM Call Tracking** — costs, tokens, latency, model breakdown
- **Traces & Spans** — full distributed tracing with OTLP ingestion
- **Pattern Detection** — duplicate prompts, cost spikes, hotspots
- **Drift Detection** — behavioral and output drift over time
- **Delusion Detection** — hallucination and contradiction scanning

### Cost Intelligence
- **Cost Attribution** — per feature, team, customer, model
- **Budgets & Alerts** — thresholds with Slack/Discord/PagerDuty/Email
- **Analytics** — cost trends, model comparison, top users, ROI
- **Live Streaming** — real-time cost, trace, and alert SSE streams

### Solution Builder
- **Build AI Solutions** — agent, workflow, pipeline, chatbot
- **Publish to Channels** — Slack, WhatsApp, Telegram, Discord
- **Templates & Marketplace** — clone from templates, browse partner integrations
- **Run Tracking** — cost, latency, success rate per solution

### Platform
- **Multi-tenancy** — organizations, users, API keys, audit logs
- **Auth** — API key authentication with scoped permissions
- **Partner API** — register integrations, marketplace listings
- **AI Explain** — Gemini/GPT-powered cost optimization insights

## Quick Start

```bash
# Generate code from YAML schemas
cd ../flusk-lang/compiler
npx tsx src/cli.ts build --target node --schema-dir ../flusk-observability/schema

# Run the backend
cd ../flusk-observability/generated/node
pnpm install
pnpm run migrate
pnpm run dev
```

## Deploy

```bash
# Docker
docker compose up

# Google Cloud Run
gcloud builds submit --config deploy/gcp/cloudbuild.yaml

# AWS ECS
# See deploy/aws/README.md
```

## Tech Stack

- **Runtime:** Node.js 22, Fastify 5, Platformatic Watt
- **Database:** SQLite (better-sqlite3) with WAL mode
- **Code Generation:** [flusk-lang](https://github.com/fluskapp/flusk-lang) YAML compiler
- **Testing:** Vitest, Fastify inject()
- **Hosting:** Cloud Run / ECS Fargate / Render

## Contributing

All code is generated from YAML. **Never edit files in `generated/`.**

1. Write or modify YAML schemas in `schema/`
2. Validate: `node scripts/validate-refs.mjs`
3. Generate: `cd ../flusk-lang/compiler && npx tsx src/cli.ts build --target node --schema-dir ../flusk-observability/schema`
4. Test: `cd generated/node && pnpm test`

## License

MIT
