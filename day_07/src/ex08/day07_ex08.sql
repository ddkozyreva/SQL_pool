SELECT
    address,
    pz.name,
    count(m.id)
FROM
    person_order po
    LEFT JOIN menu m ON m.id = po.menu_id
    LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
    LEFT JOIN person p ON p.id = po.person_id
GROUP BY
    address,
    pz.name
ORDER BY
    address,
    pz.name;