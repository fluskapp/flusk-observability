-- Create alert_events
CREATE TABLE IF NOT EXISTS alert_events (
  id TEXT PRIMARY KEY,
  alert_type TEXT NOT NULL,
  severity TEXT NOT NULL,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  channel_name TEXT NOT NULL,
  delivered INTEGER NOT NULL DEFAULT 0,
  acknowledged_at TEXT NOT NULL,
  metadata TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

