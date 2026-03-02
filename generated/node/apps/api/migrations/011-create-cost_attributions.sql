-- Create cost_attributions
CREATE TABLE IF NOT EXISTS cost_attributions (
  id TEXT PRIMARY KEY,
  llm_call_id TEXT NOT NULL,
  tag_key TEXT NOT NULL,
  tag_value TEXT NOT NULL,
  cost_usd INTEGER NOT NULL,
  input_tokens INTEGER NOT NULL,
  output_tokens INTEGER NOT NULL,
  model TEXT NOT NULL,
  provider TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_cost_attributions_llm_call_id ON cost_attributions (llm_call_id);
CREATE INDEX IF NOT EXISTS idx_cost_attributions_tag_key ON cost_attributions (tag_key);
CREATE INDEX IF NOT EXISTS idx_cost_attributions_tag_value ON cost_attributions (tag_value);
