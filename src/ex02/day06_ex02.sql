SELECT
    p.name,
    pizza_name,
    price,
    round(
        price * ((100 - pd.discount) / 100),
        0
    ) AS discount_price,
    pz.name AS pizzeria_name
FROM
    person_discounts pd
    INNER JOIN pizzeria pz ON pz.id = pd.pizzeria_id
    INNER JOIN person p ON p.id = pd.person_id
    INNER JOIN menu m ON m.pizzeria_id = pz.id
ORDER BY
    p.name,
    pizza_name;