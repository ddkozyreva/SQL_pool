SELECT
    COALESCE(p.name, '-') AS person_name,
    pv.visit_date AS visit_date,
    COALESCE(piz.name, '-') AS pizzeria_name
FROM
    person p FULL
    JOIN (
        SELECT
            *
        FROM
            person_visits
        WHERE
            visit_date BETWEEN '2022-01-01'
            AND '2022-01-03'
    ) AS pv ON pv.person_id = p.id FULL
    JOIN pizzeria piz ON piz.id = pv.pizzeria_id
ORDER BY
    person_name,
    visit_date,
    pizzeria_name;