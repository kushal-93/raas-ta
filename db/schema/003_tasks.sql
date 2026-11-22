-- +goose Up
CREATE TABLE tasks (
    id UUID PRIMARY KEY,
    job_run_id UUID NOT NULL REFERENCES job_runs(id),
    status TEXT NOT NULL DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'RUNNING', 'COMPLETED', 'FAILED')),
    input TEXT[] NOT NULL,
    retry_count INTEGER NOT NULL DEFAULT 0 CHECK(retry_count >= 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    started_at TIMESTAMPTZ,
    completed_at TIMESTAMPTZ,
    error_message TEXT
);

-- +goose Down
DROP TABLE tasks;