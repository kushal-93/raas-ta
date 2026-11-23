-- +goose Up
ALTER TABLE job_config
    ALTER COLUMN status SET DEFAULT 'INACTIVE';

ALTER TABLE job_config
    ADD CONSTRAINT job_config_status_check
    CHECK (status IN ('ACTIVE', 'INACTIVE'));

-- +goose Down
ALTER TABLE job_config
    DROP CONSTRAINT job_config_status_check;

ALTER TABLE job_config
    ALTER COLUMN status DROP DEFAULT;