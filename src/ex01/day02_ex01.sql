SELECT
    d :: date AS date
from
    generate_series(
        timestamp without time zone '2022-01-01',
        timestamp without time zone '2022-01-10',
        '1 day'
    ) as gs(d)
    LEFT JOIN (
        SELECT
            *
        FROM
            person_visits
        WHERE
            person_id = 1
            OR person_id = 2
    ) AS v ON d = v.visit_date
WHERE
    id IS NULL
ORDER BY
    date;