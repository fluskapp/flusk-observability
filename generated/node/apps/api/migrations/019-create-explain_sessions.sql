-- Create explain_sessions
CREATE TABLE IF NOT EXISTS explain_sessions (
  id TEXT PRIMARY KEY,
  query TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'running',
  model TEXT NOT NULL,
  response_text TEXT NOT NULL,
  calls_analyzed INTEGER NOT NULL DEFAULT 0,
  cost_of_explain REAL NOT NULL DEFAULT 0,
  duration_ms INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

