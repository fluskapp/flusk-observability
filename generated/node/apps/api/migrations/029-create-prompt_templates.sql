-- Create prompt_templates
CREATE TABLE IF NOT EXISTS prompt_templates (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL,
  category TEXT NOT NULL,
  current_version_id TEXT NOT NULL,
  total_versions INTEGER NOT NULL DEFAULT 0,
  ab_testing_enabled INTEGER NOT NULL DEFAULT 0,
  metadata TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

