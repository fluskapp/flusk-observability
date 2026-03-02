-- Create solution_channels
CREATE TABLE IF NOT EXISTS solution_channels (
  id TEXT PRIMARY KEY,
  solution_id TEXT NOT NULL,
  channel TEXT NOT NULL,
  config TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'inactive',
  message_count INTEGER NOT NULL DEFAULT 0,
  last_message_at TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_solution_channels_solution_id ON solution_channels (solution_id);
