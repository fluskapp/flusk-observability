-- Create notification_channels
CREATE TABLE IF NOT EXISTS notification_channels (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  config TEXT NOT NULL,
  enabled INTEGER NOT NULL DEFAULT 1,
  severity_filter TEXT DEFAULT 'all',
  webhook_id TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

