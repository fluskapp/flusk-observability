-- Create alert_channels
CREATE TABLE IF NOT EXISTS alert_channels (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  channel_type TEXT NOT NULL,
  config TEXT NOT NULL,
  enabled INTEGER NOT NULL DEFAULT 1,
  severity_filter TEXT NOT NULL DEFAULT 'warning',
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

