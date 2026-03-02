-- Create model_performances
CREATE TABLE IF NOT EXISTS model_performances (
  id TEXT PRIMARY KEY,
  model TEXT NOT NULL,
  provider TEXT NOT NULL,
  prompt_category TEXT NOT NULL,
  call_count INTEGER NOT NULL DEFAULT 0,
  avg_cost_usd REAL NOT NULL,
  avg_duration_ms REAL NOT NULL,
  avg_tokens REAL NOT NULL,
  quality_score REAL NOT NULL,
  error_rate REAL NOT NULL DEFAULT 0,
  p50duration_ms INTEGER NOT NULL,
  p99duration_ms INTEGER NOT NULL,
  last_updated_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

