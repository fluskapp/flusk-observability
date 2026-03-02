-- Create provider_healths
CREATE TABLE IF NOT EXISTS provider_healths (
  id TEXT PRIMARY KEY,
  provider TEXT NOT NULL,
  model TEXT NOT NULL,
  success_count INTEGER NOT NULL DEFAULT 0,
  failure_count INTEGER NOT NULL DEFAULT 0,
  avg_latency_ms REAL NOT NULL DEFAULT 0,
  last_failure_at TEXT NOT NULL,
  rate_limited_until TEXT NOT NULL,
  enabled INTEGER NOT NULL DEFAULT 1,
  window_start TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_provider_healths_provider ON provider_healths (provider);
CREATE INDEX IF NOT EXISTS idx_provider_healths_model ON provider_healths (model);
