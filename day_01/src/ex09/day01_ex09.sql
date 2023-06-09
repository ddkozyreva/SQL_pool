SELECT
    name as pizzeria_name
FROM
    pizzeria
WHERE
    id NOT IN (
        SELECT
            pizzeria_id
        FROM
            person_visits
    );

SELECT
    *
FROM
    pizzeria
WHERE NOT EXISTS (
        SELECT
            pizzeria_id
        FROM
            person_visits
        WHERE pizzeria_id = pizzeria.id
    );
