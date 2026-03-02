-- Create profile_sessions
CREATE TABLE IF NOT EXISTS profile_sessions (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  profile_type TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'running',
  pid INTEGER NOT NULL,
  duration_ms INTEGER NOT NULL,
  flame_graph_path TEXT NOT NULL,
  cpu_profile_path TEXT NOT NULL,
  heap_snapshot_path TEXT NOT NULL,
  hotspot_count INTEGER NOT NULL DEFAULT 0,
  peak_heap_mb REAL NOT NULL,
  summary TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

