SELECT
    m.pizza_name,
    piz.name AS pizzeria_name
FROM
    (
        SELECT
            id,
            name
        FROM
            person
        WHERE
            name IN ('Denis', 'Anna')
    ) AS p
    JOIN person_order po ON po.person_id = p.id
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria piz ON piz.id = m.pizzeria_id
ORDER BY
    pizza_name,
    pizzeria_name;