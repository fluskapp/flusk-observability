-- Create ai_usage_metrics
CREATE TABLE IF NOT EXISTS ai_usage_metrics (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  tool_name TEXT NOT NULL,
  metric_type TEXT NOT NULL,
  value REAL NOT NULL,
  period TEXT NOT NULL,
  period_type TEXT NOT NULL,
  metadata TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_ai_usage_metrics_user_id ON ai_usage_metrics (user_id);
CREATE INDEX IF NOT EXISTS idx_ai_usage_metrics_tool_name ON ai_usage_metrics (tool_name);
