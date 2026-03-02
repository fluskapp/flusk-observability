-- Create solution_versions
CREATE TABLE IF NOT EXISTS solution_versions (
  id TEXT PRIMARY KEY,
  solution_id TEXT NOT NULL,
  version TEXT NOT NULL,
  config TEXT NOT NULL,
  changelog TEXT NOT NULL,
  published_by TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_solution_versions_solution_id ON solution_versions (solution_id);
