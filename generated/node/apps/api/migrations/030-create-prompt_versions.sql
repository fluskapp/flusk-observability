-- Create prompt_versions
CREATE TABLE IF NOT EXISTS prompt_versions (
  id TEXT PRIMARY KEY,
  template_id TEXT NOT NULL,
  version INTEGER NOT NULL,
  prompt_text TEXT NOT NULL,
  model TEXT NOT NULL,
  call_count INTEGER NOT NULL DEFAULT 0,
  avg_cost_usd REAL NOT NULL,
  avg_duration_ms REAL NOT NULL,
  avg_quality_score REAL NOT NULL,
  is_active INTEGER NOT NULL DEFAULT 1,
  traffic_percent INTEGER NOT NULL DEFAULT 100,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

