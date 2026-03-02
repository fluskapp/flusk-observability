-- Create budget_alerts
CREATE TABLE IF NOT EXISTS budget_alerts (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  budget_type TEXT NOT NULL,
  threshold_usd REAL NOT NULL,
  warning_percent INTEGER NOT NULL DEFAULT 80,
  current_spend_usd REAL NOT NULL DEFAULT 0,
  enabled INTEGER NOT NULL DEFAULT 1,
  auto_pause INTEGER NOT NULL DEFAULT 0,
  last_triggered_at TEXT NOT NULL,
  agent_filter TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

