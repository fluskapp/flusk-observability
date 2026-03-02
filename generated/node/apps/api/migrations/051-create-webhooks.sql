-- Create webhooks
CREATE TABLE IF NOT EXISTS webhooks (
  id TEXT PRIMARY KEY,
  id TEXT NOT NULL,
  name TEXT NOT NULL,
  url TEXT NOT NULL,
  method TEXT NOT NULL DEFAULT 'POST',
  headers TEXT,
  payload_template TEXT,
  retry_max_attempts INTEGER DEFAULT 3,
  retry_delay_ms INTEGER DEFAULT 1000,
  retry_backoff_multiplier INTEGER DEFAULT 2,
  timeout_ms INTEGER DEFAULT 10000,
  secret TEXT,
  enabled INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

