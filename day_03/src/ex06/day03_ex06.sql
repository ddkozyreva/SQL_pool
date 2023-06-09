SELECT
    m1.pizza_name,
    piz1.name pizzeria_name_1,
    piz2.name pizzeria_name_2,
    m1.price
FROM
    menu m1
    JOIN menu m2 ON m1.pizza_name = m2.pizza_name
    JOIN pizzeria piz1 ON piz1.id = m1.pizzeria_id
    JOIN pizzeria piz2 ON piz2.id = m2.pizzeria_id
WHERE
    m1.price = m2.price
    AND m1.pizzeria_id > m2.pizzeria_id
ORDER BY
    pizza_name;