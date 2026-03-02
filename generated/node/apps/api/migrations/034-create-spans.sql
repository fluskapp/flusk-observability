-- Create spans
CREATE TABLE IF NOT EXISTS spans (
  id TEXT PRIMARY KEY,
  trace_id TEXT NOT NULL,
  span_id TEXT NOT NULL UNIQUE,
  parent_span_id TEXT NOT NULL,
  operation_name TEXT NOT NULL,
  service_name TEXT NOT NULL,
  start_time TEXT NOT NULL,
  end_time TEXT NOT NULL,
  duration_ms INTEGER NOT NULL,
  kind TEXT NOT NULL DEFAULT 'internal',
  status TEXT NOT NULL DEFAULT 'unset',
  attributes TEXT NOT NULL,
  events TEXT NOT NULL,
  llm_call_id TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

