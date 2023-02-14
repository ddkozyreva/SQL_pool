SELECT
    p.name,
    pizza_name,
    price,
    CAST(
        price * ((100 - floor(pd.discount)) / 100) as int
    ) AS discount_price,
    pd.discount,
    pz.name
FROM
    person_discounts pd
    INNER JOIN pizzeria pz ON pz.id = pd.pizzeria_id
    INNER JOIN person p ON p.id = pd.person_id
    INNER JOIN menu m ON m.pizzeria_id = pz.id
ORDER BY
    p.name,
    pizza_name;

SELECT
    p.name,
    pd.discount,
    pz.name
FROM
    person_discounts pd
    INNER JOIN pizzeria pz ON pz.id = pd.pizzeria_id
    INNER JOIN person p ON p.id = pd.person_id
ORDER BY
    p.name;