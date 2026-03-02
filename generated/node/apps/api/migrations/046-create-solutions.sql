-- Create solutions
CREATE TABLE IF NOT EXISTS solutions (
  id TEXT PRIMARY KEY,
  organization_id TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft',
  config TEXT NOT NULL,
  version TEXT NOT NULL DEFAULT '0.1.0',
  published_at TEXT NOT NULL,
  metrics TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_solutions_organization_id ON solutions (organization_id);
