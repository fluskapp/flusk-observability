-- Create insights
CREATE TABLE IF NOT EXISTS insights (
  id TEXT PRIMARY KEY,
  insight_type TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  estimated_savings_usd REAL NOT NULL,
  estimated_savings_percent REAL NOT NULL,
  priority TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'new',
  affected_model TEXT NOT NULL,
  affected_agent TEXT NOT NULL,
  analyze_session_id TEXT NOT NULL,
  evidence TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

