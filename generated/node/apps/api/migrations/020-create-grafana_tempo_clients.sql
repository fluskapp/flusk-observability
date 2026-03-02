-- Create grafana_tempo_clients
CREATE TABLE IF NOT EXISTS grafana_tempo_clients (
  id TEXT PRIMARY KEY,
  data TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

