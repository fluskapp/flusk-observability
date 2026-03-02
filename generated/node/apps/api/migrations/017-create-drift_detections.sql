-- Create drift_detections
CREATE TABLE IF NOT EXISTS drift_detections (
  id TEXT PRIMARY KEY,
  agent_label TEXT NOT NULL,
  detection_type TEXT NOT NULL,
  severity TEXT NOT NULL,
  baseline_hash TEXT NOT NULL,
  current_hash TEXT NOT NULL,
  drift_score REAL NOT NULL,
  sample_count INTEGER NOT NULL,
  baseline_period TEXT NOT NULL,
  current_period TEXT NOT NULL,
  details TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'active',
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_drift_detections_agent_label ON drift_detections (agent_label);
