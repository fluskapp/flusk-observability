-- Create trace_views
CREATE TABLE IF NOT EXISTS trace_views (
  id TEXT PRIMARY KEY,
  trace_id TEXT NOT NULL,
  view_type TEXT NOT NULL,
  total_duration INTEGER NOT NULL,
  total_cost REAL NOT NULL,
  span_count INTEGER NOT NULL,
  critical_path TEXT NOT NULL,
  annotations TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_trace_views_trace_id ON trace_views (trace_id);
