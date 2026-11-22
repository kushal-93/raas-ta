-- +goose Up
CREATE TABLE job_runs (
    id UUID PRIMARY KEY,
    config_id UUID NOT NULL REFERENCES job_config(id),
    status TEXT NOT NULL,
    start_time TIMESTAMPTZ,
    end_time TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    error_message TEXT
);

-- +goose Down
DROP TABLE job_runs;