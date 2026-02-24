# flusk-observability

YAML schema definitions for the entire Flusk observability platform — cost tracking, analysis, routing, profiling, alerting, tracing, dashboards, drift/delusion detection, code intelligence, and AI usage tracking.

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
  entities/       # 26 data models
  functions/      # 52 business logic functions
  commands/       # 29 CLI commands
  routes/         # 20 REST API endpoint groups
  providers/      # 5 alert providers
  clients/        # 5 external API clients
```

## Entities (26)

| Entity | Description |
|--------|-------------|
| AiUsageMetric | AI tool usage metrics per user for tracking adoption and ROI |
| AlertChannel | Alert destination configuration (PagerDuty, Slack, etc.) |
| AlertEvent | Record of a triggered alert |
| AnalyzeSession | Tracks CLI analyze command runs |
| BudgetAlert | Budget threshold alert configuration |
| CodeScanResult | Results from scanning a codebase for LLM/AI usage patterns |
| Conversion | Optimization suggestion (cache/downgrade/remove) |
| Dashboard | Configurable dashboard for visualizing observability data |
| DashboardWidget | Individual widget within a dashboard |
| DelusionDetection | Detected hallucination or confidence mismatch in LLM output |
| DriftDetection | Detected behavioral or performance drift in an agent |
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
| TraceView | Visualization configuration for a distributed trace |

## Function Domains (52)

**Cost Tracking:** calculateCallCost, detectDuplicates, aggregateCosts, getDailySpend, getMonthlySpend

**Analysis:** runAnalysis, detectPatterns, generateInsights, calculateSavings

**Routing:** routeModel, evaluateRoutingRule, recordRoutingDecision

**Profiling:** startProfile, stopProfile, detectHotspots

**Budget:** checkBudget, createBudgetAlert_event, getBudgetStatus

**OTLP Ingestion:** ingestOtlpTraces, mapSpanToLlmCall, parseLlmAttributes

**Export:** exportToGrafana, exportToDatadog

**Alerting:** dispatchAlert, filterChannelsBySeverity, sendToProvider, checkCircuit, shouldAutoPause, buildProviderRegistry

**Dashboards:** createDashboard, renderDashboardData, buildWidgetQuery

**Trace Visualization:** buildTraceView, findCriticalPath, calculateTraceStats

**Drift Detection:** detectOutputDrift, detectCostDrift, detectBehaviorDrift, calculateDriftScore, runDriftScan

**Delusion Detection:** detectHallucination, detectContradiction, detectConfidenceMismatch, runDelusionScan

**Code Intelligence:** scanCodebase, detectLlmCallSites, estimateCallCosts, generateScanReport

**AI Usage:** aggregateUsageByUser, aggregateUsageByTool, calculateUsageRank, calculateRoi

## CLI Commands (29)

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
| `dashboard-create` | Create a new dashboard |
| `dashboard-list` | List dashboards |
| `trace-view` | View a trace (waterfall in terminal) |
| `drift-scan` | Run drift detection scan |
| `drift-list` | List detected drifts |
| `delusion-scan` | Run delusion detection |
| `delusion-list` | List detected delusions |
| `scan` | Scan a codebase for AI usage (flusk scan ./src) |
| `usage-report` | AI usage report per user/team |
| `usage-rank` | Rank users by AI effectiveness |

## REST API Routes (20)

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
| dashboards | /api/dashboards | Dashboard CRUD + render |
| dashboard-widgets | /api/dashboard-widgets | Widget CRUD |
| trace-views | /api/trace-views | Trace visualization endpoints |
| drift-detections | /api/drift-detections | Drift detection results + scan |
| delusion-detections | /api/delusion-detections | Delusion detection results + scan |
| code-scans | /api/code-scans | Code scan results + reports |
| ai-usage | /api/ai-usage | AI usage metrics + rankings + ROI |

## External Clients (5)

| Client | Description |
|--------|-------------|
| OpenAI | Chat completions for explain feature |
| Anthropic | Claude API for analysis |
| Grafana Tempo | Trace export |
| Datadog | Metrics export |
| GitHub API | Code scanning (fetch repo contents) |

## Alert Providers (5)

PagerDuty, Slack, Discord, Webhook, Email

## Requirements

- **FLUSK_DEV_TOKEN** secret: GitHub PAT with repo access to `adirbenyossef/flusk-dev`
- **OPENAI_API_KEY** (optional): For explain feature
- **ANTHROPIC_API_KEY** (optional): For Claude-based analysis
- **GRAFANA_TEMPO_URL** + **GRAFANA_API_KEY** (optional): For Grafana export
- **DD_API_KEY** (optional): For Datadog export
- **GITHUB_TOKEN** (optional): For code scanning via GitHub API

## Compiler

Schemas are validated and compiled by [flusk-lang](https://github.com/fluskapp/flusk-lang).
