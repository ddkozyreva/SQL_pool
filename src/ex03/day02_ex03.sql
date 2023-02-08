WITH tmp AS (
    SELECT
        d :: date AS date
    FROM
        generate_series(
            timestamp '2022-01-01',
            timestamp '2022-01-10',
            '1 day'
        ) AS gs(d)
)
SELECT
    date
FROM
    tmp
    LEFT JOIN (
        SELECT
            *
        FROM
            person_visits
        WHERE
            person_id = 1
            OR person_id = 2
    ) AS v ON tmp.date = v.visit_date
WHERE
    id IS NULL
ORDER BY
    date;