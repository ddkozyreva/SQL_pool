CREATE INDEX idx_person_name ON person(upper(name));

SET
    enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT
    upper(name)
FROM
    person p
WHERE
    upper(name) = 'DMITRIY';