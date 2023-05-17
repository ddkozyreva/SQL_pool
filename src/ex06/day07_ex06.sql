SELECT
    pz.name,
    count(po.order_date) AS count_of_orders,
    round(avg(price), 2) AS average_price,
    max(price) AS max_price,
    min(price) AS min_price
FROM
    pizzeria pz
    JOIN menu m ON m.pizzeria_id = pz.id
    JOIN person_order po ON po.menu_id = m.id
GROUP BY
    pz.name
ORDER BY
    pz.name;