-- Create llm_calls
CREATE TABLE IF NOT EXISTS llm_calls (
  id TEXT PRIMARY KEY,
  trace_id TEXT NOT NULL,
  span_id TEXT NOT NULL,
  model TEXT NOT NULL,
  provider TEXT NOT NULL,
  prompt_hash TEXT NOT NULL,
  prompt_tokens INTEGER NOT NULL,
  completion_tokens INTEGER NOT NULL,
  total_tokens INTEGER NOT NULL,
  cost_usd REAL NOT NULL,
  duration_ms INTEGER NOT NULL,
  agent_name TEXT NOT NULL,
  prompt_category TEXT NOT NULL,
  cached INTEGER NOT NULL DEFAULT 0,
  error TEXT NOT NULL,
  metadata TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

