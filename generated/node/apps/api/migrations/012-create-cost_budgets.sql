-- Create cost_budgets
CREATE TABLE IF NOT EXISTS cost_budgets (
  id TEXT PRIMARY KEY,
  tag_key TEXT NOT NULL,
  tag_value TEXT NOT NULL,
  limit_usd INTEGER NOT NULL,
  period TEXT NOT NULL,
  alert_at INTEGER NOT NULL DEFAULT 80,
  action TEXT NOT NULL DEFAULT 'alert',
  enabled INTEGER NOT NULL DEFAULT 1,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_cost_budgets_tag_key ON cost_budgets (tag_key);
CREATE INDEX IF NOT EXISTS idx_cost_budgets_tag_value ON cost_budgets (tag_value);
