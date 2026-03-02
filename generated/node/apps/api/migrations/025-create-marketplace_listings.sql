-- Create marketplace_listings
CREATE TABLE IF NOT EXISTS marketplace_listings (
  id TEXT PRIMARY KEY,
  partner_id TEXT NOT NULL,
  integration_id TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  category TEXT NOT NULL,
  pricing TEXT NOT NULL,
  featured INTEGER NOT NULL DEFAULT 0,
  rating REAL NOT NULL DEFAULT 0,
  install_count INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_marketplace_listings_partner_id ON marketplace_listings (partner_id);
CREATE INDEX IF NOT EXISTS idx_marketplace_listings_integration_id ON marketplace_listings (integration_id);
