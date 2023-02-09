WITH tmp AS (
    (
        SELECT
            id
        FROM
            menu
    )
    EXCEPT
        (
            SELECT
                menu_id
            FROM
                person_order
        )
)
SELECT
    pizza_name,
    price,
    piz.name
FROM
    menu m
    JOIN pizzeria piz ON piz.id = m.pizzeria_id
WHERE
    m.id IN (
        SELECT
            id
        FROM
            tmp
    )
ORDER BY
    pizza_name,
    price;