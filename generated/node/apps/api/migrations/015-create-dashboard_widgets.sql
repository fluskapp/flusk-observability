-- Create dashboard_widgets
CREATE TABLE IF NOT EXISTS dashboard_widgets (
  id TEXT PRIMARY KEY,
  dashboard_id TEXT NOT NULL,
  widget_type TEXT NOT NULL,
  title TEXT NOT NULL,
  query TEXT NOT NULL,
  position TEXT NOT NULL,
  config TEXT NOT NULL,
  refresh_override INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_dashboard_widgets_dashboard_id ON dashboard_widgets (dashboard_id);
