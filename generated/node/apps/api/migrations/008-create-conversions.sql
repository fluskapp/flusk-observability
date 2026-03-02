-- Create conversions
CREATE TABLE IF NOT EXISTS conversions (
  id TEXT PRIMARY KEY,
  conversion_type TEXT NOT NULL,
  source_model TEXT NOT NULL,
  target_model TEXT NOT NULL,
  prompt_hash TEXT NOT NULL,
  prompt_category TEXT NOT NULL,
  estimated_savings_usd REAL NOT NULL,
  confidence REAL NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending',
  applied_at TEXT NOT NULL,
  metadata TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

