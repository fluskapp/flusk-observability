-- Create dashboards
CREATE TABLE IF NOT EXISTS dashboards (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL,
  layout TEXT NOT NULL,
  filters TEXT NOT NULL,
  refresh_interval INTEGER NOT NULL DEFAULT 30,
  is_default INTEGER NOT NULL DEFAULT 0,
  owner TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

