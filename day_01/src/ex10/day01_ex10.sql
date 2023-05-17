SELECT
    name AS person_name,
    pizza_name,
    pizzeria_name
FROM
    person
    JOIN person_order ON person_order.person_id = person.id
    JOIN menu ON menu.id = person_order.menu_id
    JOIN (
        SELECT
            id,
            name AS pizzeria_name
        FROM
            pizzeria
    ) AS pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY
    person_name,
    pizza_name,
    pizzeria_name;