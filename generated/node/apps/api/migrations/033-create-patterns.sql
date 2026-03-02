-- Create patterns
CREATE TABLE IF NOT EXISTS patterns (
  id TEXT PRIMARY KEY,
  prompt_hash TEXT NOT NULL,
  model TEXT NOT NULL,
  occurrences INTEGER NOT NULL,
  total_cost_usd REAL NOT NULL,
  avg_tokens REAL NOT NULL,
  first_seen_at TEXT NOT NULL,
  last_seen_at TEXT NOT NULL,
  sample_prompt TEXT NOT NULL,
  recommendation TEXT NOT NULL,
  agent_name TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

