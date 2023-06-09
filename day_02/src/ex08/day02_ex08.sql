SELECT
    DISTINCT p.name
FROM
    person p
    JOIN person_order po ON po.person_id = p.id
    JOIN menu m ON m.id = po.menu_id
WHERE
    m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
    AND p.gender = 'male'
    AND p.address IN ('Moscow', 'Samara')
ORDER BY
    p.name DESC;