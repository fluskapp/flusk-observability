-- Create routing_decisions
CREATE TABLE IF NOT EXISTS routing_decisions (
  id TEXT PRIMARY KEY,
  routing_rule_id TEXT NOT NULL,
  prompt_category TEXT NOT NULL,
  requested_model TEXT NOT NULL,
  selected_model TEXT NOT NULL,
  was_rerouted INTEGER NOT NULL,
  savings_usd REAL NOT NULL DEFAULT 0,
  quality_delta REAL NOT NULL,
  latency_delta INTEGER NOT NULL,
  llm_call_id TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

