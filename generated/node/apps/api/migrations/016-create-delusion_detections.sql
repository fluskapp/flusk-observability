-- Create delusion_detections
CREATE TABLE IF NOT EXISTS delusion_detections (
  id TEXT PRIMARY KEY,
  agent_label TEXT NOT NULL,
  llm_call_id TEXT NOT NULL,
  delusion_type TEXT NOT NULL,
  confidence REAL NOT NULL,
  actual_accuracy REAL NOT NULL,
  divergence_score REAL NOT NULL,
  input_sample TEXT NOT NULL,
  output_sample TEXT NOT NULL,
  explanation TEXT NOT NULL,
  verified INTEGER NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'detected',
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_delusion_detections_agent_label ON delusion_detections (agent_label);
CREATE INDEX IF NOT EXISTS idx_delusion_detections_llm_call_id ON delusion_detections (llm_call_id);
