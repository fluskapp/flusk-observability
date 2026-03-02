-- Create analyze_sessions
CREATE TABLE IF NOT EXISTS analyze_sessions (
  id TEXT PRIMARY KEY,
  script_path TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'running',
  call_count INTEGER NOT NULL DEFAULT 0,
  total_cost_usd REAL NOT NULL DEFAULT 0,
  total_tokens INTEGER NOT NULL DEFAULT 0,
  duration_ms INTEGER NOT NULL,
  patterns_found INTEGER NOT NULL DEFAULT 0,
  insights_generated INTEGER NOT NULL DEFAULT 0,
  summary TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

