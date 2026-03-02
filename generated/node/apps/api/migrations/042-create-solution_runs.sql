-- Create solution_runs
CREATE TABLE IF NOT EXISTS solution_runs (
  id TEXT PRIMARY KEY,
  solution_id TEXT NOT NULL,
  organization_id TEXT NOT NULL,
  input TEXT NOT NULL,
  output TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'running',
  cost REAL NOT NULL,
  duration_ms INTEGER NOT NULL,
  model_used TEXT NOT NULL,
  tokens_in INTEGER NOT NULL,
  tokens_out INTEGER NOT NULL,
  error TEXT NOT NULL,
  trace_id TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_solution_runs_solution_id ON solution_runs (solution_id);
CREATE INDEX IF NOT EXISTS idx_solution_runs_organization_id ON solution_runs (organization_id);
