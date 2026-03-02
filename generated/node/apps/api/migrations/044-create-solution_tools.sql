-- Create solution_tools
CREATE TABLE IF NOT EXISTS solution_tools (
  id TEXT PRIMARY KEY,
  solution_id TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  type TEXT NOT NULL,
  config TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_solution_tools_solution_id ON solution_tools (solution_id);
