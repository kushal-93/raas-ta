-- +goose Up
CREATE TABLE job_config (
    id UUID PRIMARY KEY,
    interval INTERVAL NOT NULL,
    status TEXT NOT NULL,
    effective_from TIMESTAMPTZ,
    source JSONB NOT NULL,
    sink JSONB NOT NULL,
    compute_formula TEXT NOT NULL,
    merge_formula TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    next_run TIMESTAMPTZ
);

-- +goose Down
DROP TABLE job_config;