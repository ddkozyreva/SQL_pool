SELECT
    name,
    rating
FROM
    pizzeria
    LEFT JOIN (
        SELECT
            person_id,
            pizzeria_id
        FROM
            person_visits
    ) AS pv ON pizzeria.id = pv.pizzeria_id
WHERE
    person_id IS NULL;