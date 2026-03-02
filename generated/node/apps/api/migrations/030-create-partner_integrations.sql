-- Create partner_integrations
CREATE TABLE IF NOT EXISTS partner_integrations (
  id TEXT PRIMARY KEY,
  partner_id TEXT NOT NULL,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  config TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending-review',
  endpoint_url TEXT NOT NULL,
  documentation TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_partner_integrations_partner_id ON partner_integrations (partner_id);
