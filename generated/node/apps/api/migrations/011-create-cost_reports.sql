-- Create cost_reports
CREATE TABLE IF NOT EXISTS cost_reports (
  id TEXT PRIMARY KEY,
  report_type TEXT NOT NULL,
  period_start TEXT NOT NULL,
  period_end TEXT NOT NULL,
  total_cost_usd INTEGER NOT NULL,
  total_calls INTEGER NOT NULL,
  breakdown TEXT NOT NULL,
  top_insights TEXT NOT NULL,
  format TEXT NOT NULL DEFAULT 'json',
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

