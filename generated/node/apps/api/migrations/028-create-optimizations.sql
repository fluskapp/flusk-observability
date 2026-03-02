-- Create optimizations
CREATE TABLE IF NOT EXISTS optimizations (
  id TEXT PRIMARY KEY,
  optimization_type TEXT NOT NULL,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  code_before TEXT NOT NULL,
  code_after TEXT NOT NULL,
  file_path TEXT NOT NULL,
  line_number INTEGER NOT NULL,
  estimated_savings_usd REAL NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending',
  analyze_session_id TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

