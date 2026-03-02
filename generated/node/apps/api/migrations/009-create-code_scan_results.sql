-- Create code_scan_results
CREATE TABLE IF NOT EXISTS code_scan_results (
  id TEXT PRIMARY KEY,
  project_path TEXT NOT NULL,
  scan_type TEXT NOT NULL,
  total_llm_calls INTEGER NOT NULL,
  total_providers INTEGER NOT NULL,
  total_models INTEGER NOT NULL,
  call_sites TEXT NOT NULL,
  recommendations TEXT NOT NULL,
  risk_score REAL NOT NULL,
  scan_duration INTEGER NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

