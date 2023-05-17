SELECT
    piz.name AS pizzeria_name
FROM
    (
        SELECT
            *
        FROM
            person
        WHERE
            name = 'Dmitriy'
    ) AS p
    JOIN (
        SELECT
            *
        FROM
            person_visits
        WHERE
            visit_date = '2022-01-08'
    ) AS pv ON pv.person_id = p.id
    JOIN pizzeria piz ON piz.id = pv.pizzeria_id
    LEFT JOIN (
        SELECT
            *
        FROM
            menu
        WHERE
            price < 800
    ) AS m ON m.pizzeria_id = pv.pizzeria_id
WHERE
    m.id IS NOT NULL
    AND piz.name IS NOT NULL;