-- Create cost_tags
CREATE TABLE IF NOT EXISTS cost_tags (
  id TEXT PRIMARY KEY,
  key TEXT NOT NULL,
  value TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_cost_tags_key ON cost_tags (key);
CREATE INDEX IF NOT EXISTS idx_cost_tags_value ON cost_tags (value);
