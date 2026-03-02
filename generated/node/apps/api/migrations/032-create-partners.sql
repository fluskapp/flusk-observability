-- Create partners
CREATE TABLE IF NOT EXISTS partners (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  website TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending',
  api_key TEXT NOT NULL UNIQUE,
  tier TEXT NOT NULL DEFAULT 'free',
  organization_id TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_partners_organization_id ON partners (organization_id);
