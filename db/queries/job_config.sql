-- name: CreateJobConfig :one
INSERT INTO job_config (
    id,
    interval,
    effective_from,
    source,
    sink,
    compute_formula,
    merge_formula,
    next_run
)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
RETURNING *;