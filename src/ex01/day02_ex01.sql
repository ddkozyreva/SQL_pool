SELECT
    DISTINCT visit_date AS missing_date
FROM
    person_visits pv
WHERE
    (
        pv.person_id <> 1
        AND pv.person_id <> 2
    )
    AND pv.visit_date BETWEEN '2022-01-01'
    AND '2022-01-10'
ORDER BY
    visit_date;