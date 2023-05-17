SELECT
    m.pizza_name,
    piz.name AS pizzeria_name,
    m.price
FROM
    menu m
    JOIN pizzeria piz ON piz.id = m.pizzeria_id
WHERE
    pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY
    pizza_name,
    pizzeria_name;