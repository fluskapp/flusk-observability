-- Create performance_patterns
CREATE TABLE IF NOT EXISTS performance_patterns (
  id TEXT PRIMARY KEY,
  pattern_type TEXT NOT NULL,
  function_name TEXT NOT NULL,
  file_path TEXT NOT NULL,
  line_number INTEGER NOT NULL,
  self_time REAL NOT NULL,
  total_time REAL NOT NULL,
  call_count INTEGER NOT NULL,
  heap_delta INTEGER NOT NULL,
  severity TEXT NOT NULL,
  profile_session_id TEXT NOT NULL,
  recommendation TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

