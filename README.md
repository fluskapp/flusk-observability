# flusk-observability

YAML schema definitions for the entire Flusk observability platform — cost tracking, analysis, routing, profiling, alerting, tracing, and budget management.

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
  entities/       # 19 data models
  functions/      # 28 business logic functions
  commands/       # 19 CLI commands
  routes/         # 13 REST API endpoint groups
  providers/      # 5 alert providers
  clients/        # 4 external API clients
```

## Entities (19)

| Entity | Description |
|--------|-------------|
| AlertChannel | Alert destination configuration (PagerDuty, Slack, etc.) |
| AlertEvent | Record of a triggered alert |
| AnalyzeSession | Tracks CLI analyze command runs |
| BudgetAlert | Budget threshold alert configuration |
| Conversion | Optimization suggestion (cache/downgrade/remove) |
| ExplainSession | Tracks flusk explain command runs |
| Insight | AI-generated optimization insight |
| LlmCall | Individual LLM API call with cost/token tracking |
| ModelPerformance | Model quality/cost metrics per prompt category |
| Optimization | Generated code optimization suggestion |
| Pattern | Detected repetitive prompt pattern |
| PerformancePattern | Detected performance pattern from profiling |
| ProfileSession | CPU/heap profiling session data |
| PromptTemplate | Prompt template for A/B testing |
| PromptVersion | Immutable prompt version with metrics |
| RoutingDecision | Recorded model routing decision + savings |
| RoutingRule | Model routing rule per organization |
| Span | Individual span within a distributed trace |
| Trace | Distributed trace record |

## Function Domains (28)

**Cost Tracking:** calculateCallCost, detectDuplicates, aggregateCosts, getDailySpend, getMonthlySpend

**Analysis:** runAnalysis, detectPatterns, generateInsights, calculateSavings

**Routing:** routeModel, evaluateRoutingRule, recordRoutingDecision

**Profiling:** startProfile, stopProfile, detectHotspots

**Budget:** checkBudget, createBudgetAlert_event, getBudgetStatus

**OTLP Ingestion:** ingestOtlpTraces, mapSpanToLlmCall, parseLlmAttributes

**Export:** exportToGrafana, exportToDatadog

**Alerting:** dispatchAlert, filterChannelsBySeverity, sendToProvider, checkCircuit, shouldAutoPause, buildProviderRegistry

## CLI Commands (19)

| Command | Description |
|---------|-------------|
| `analyze` | Run cost analysis on a script |
| `report` | Generate cost report |
| `history` | Show LLM call history |
| `budget` | Manage budget thresholds |
| `watch` | Live monitoring mode |
| `explain` | AI-powered cost optimization insights |
| `export` | Export data (CSV, JSON, Grafana, Datadog) |
| `profile` | Start/stop CPU/heap profiling |
| `profile-report` | Show profiling results |
| `profile-compare` | Compare two profile sessions |
| `status` | Show current spend/health summary |
| `init` | Initialize flusk config |
| `purge` | Delete old data |
| `alerts-setup` | Configure alert channels |
| `alerts-test` | Test alert delivery |
| `alerts-list` | List channels or events |
| `alerts-mute` | Mute an alert channel |
| `alerts-ack` | Acknowledge an alert |
| `kill` | Emergency stop |

## REST API Routes (13)

| Route | Base Path | Description |
|-------|-----------|-------------|
| llm-calls | /api/llm-calls | CRUD + cost aggregation |
| traces | /api/traces | Trace management + OTLP ingest |
| spans | /api/spans | Span queries |
| patterns | /api/patterns | Pattern detection results |
| insights | /api/insights | Optimization insights |
| budget-alerts | /api/budget-alerts | Budget alert management |
| analyze-sessions | /api/analyze-sessions | Analysis session management |
| profile-sessions | /api/profile-sessions | Profiling session management |
| optimizations | /api/optimizations | Optimization suggestions |
| health | /api/health | Health check |
| cost-events | /api/cost-events | Live cost event streaming (SSE) |
| alert-channels | /api/alert-channels | Alert channel CRUD |
| alert-events | /api/alert-events | Alert event history |

## External Clients (4)

| Client | Description |
|--------|-------------|
| OpenAI | Chat completions for explain feature |
| Anthropic | Claude API for analysis |
| Grafana Tempo | Trace export |
| Datadog | Metrics export |

## Alert Providers (5)

PagerDuty, Slack, Discord, Webhook, Email

## Requirements

- **FLUSK_DEV_TOKEN** secret: GitHub PAT with repo access to `adirbenyossef/flusk-dev`
- **OPENAI_API_KEY** (optional): For explain feature
- **ANTHROPIC_API_KEY** (optional): For Claude-based analysis
- **GRAFANA_TEMPO_URL** + **GRAFANA_API_KEY** (optional): For Grafana export
- **DD_API_KEY** (optional): For Datadog export

## Compiler

Schemas are validated and compiled by [flusk-lang](https://github.com/fluskapp/flusk-lang).
