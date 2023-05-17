SELECT
    m.pizza_name,
    m.price,
    piz.name AS pizzeria_name,
    pv.visit_date
FROM
    person p
    JOIN person_visits pv ON pv.person_id = p.id
    JOIN pizzeria piz ON piz.id = pv.pizzeria_id
    JOIN menu m ON m.pizzeria_id = piz.id
WHERE
    p.name = 'Kate'
    AND m.price >= 800
    AND m.price <= 1000
ORDER BY
    pizza_name,
    price,
    pizzeria_name;