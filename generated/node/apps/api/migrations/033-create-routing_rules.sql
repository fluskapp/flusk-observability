-- Create routing_rules
CREATE TABLE IF NOT EXISTS routing_rules (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  prompt_category TEXT NOT NULL,
  min_quality_score REAL NOT NULL,
  max_cost_usd REAL NOT NULL,
  max_duration_ms INTEGER NOT NULL,
  preferred_models TEXT NOT NULL,
  excluded_models TEXT NOT NULL,
  enabled INTEGER NOT NULL DEFAULT 1,
  priority INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

