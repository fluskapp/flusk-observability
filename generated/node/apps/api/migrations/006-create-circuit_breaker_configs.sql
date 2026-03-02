-- Create circuit_breaker_configs
CREATE TABLE IF NOT EXISTS circuit_breaker_configs (
  id TEXT PRIMARY KEY,
  data TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

