WITH tmp AS (
    SELECT
        p.name,
        p.gender,
        m.pizza_name
    FROM
        person p
        JOIN person_order po ON po.person_id = p.id
        JOIN menu m ON m.id = po.menu_id
)
SELECT
    tmp.name
FROM
    tmp
WHERE
    tmp.pizza_name = 'pepperoni pizza'
    AND tmp.gender = 'female'
INTERSECT
(
    SELECT
        tmp.name
    FROM
        tmp
    WHERE
        tmp.pizza_name = 'cheese pizza'
        AND tmp.gender = 'female'
);