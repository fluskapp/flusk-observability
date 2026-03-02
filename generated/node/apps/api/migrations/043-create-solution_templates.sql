-- Create solution_templates
CREATE TABLE IF NOT EXISTS solution_templates (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  category TEXT NOT NULL,
  config TEXT NOT NULL,
  is_public INTEGER NOT NULL DEFAULT 1,
  author TEXT NOT NULL,
  downloads INTEGER NOT NULL DEFAULT 0,
  rating REAL NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

