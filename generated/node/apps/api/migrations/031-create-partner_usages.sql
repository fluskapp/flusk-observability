-- Create partner_usages
CREATE TABLE IF NOT EXISTS partner_usages (
  id TEXT PRIMARY KEY,
  partner_id TEXT NOT NULL,
  integration_id TEXT NOT NULL,
  period TEXT NOT NULL,
  calls INTEGER NOT NULL DEFAULT 0,
  cost REAL NOT NULL DEFAULT 0,
  errors INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_partner_usages_partner_id ON partner_usages (partner_id);
CREATE INDEX IF NOT EXISTS idx_partner_usages_integration_id ON partner_usages (integration_id);
