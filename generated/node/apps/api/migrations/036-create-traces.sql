-- Create traces
CREATE TABLE IF NOT EXISTS traces (
  id TEXT PRIMARY KEY,
  trace_id TEXT NOT NULL UNIQUE,
  root_span_id TEXT NOT NULL,
  service_name TEXT NOT NULL,
  operation_name TEXT NOT NULL,
  duration_ms INTEGER NOT NULL,
  span_count INTEGER NOT NULL DEFAULT 0,
  total_cost_usd REAL NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'ok',
  metadata TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

