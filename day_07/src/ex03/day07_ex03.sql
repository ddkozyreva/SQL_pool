WITH orders AS (
    SELECT
        pz.name,
        count(*),
        'order' AS action_type
    FROM
        pizzeria pz
        INNER JOIN menu m ON m.pizzeria_id = pz.id
        INNER JOIN person_order po ON po.menu_id = m.id
    GROUP BY
        pz.name
),
visits AS (
    SELECT
        pz.name,
        count(*),
        'visit' AS action_type
    FROM
        person_visits pv
        INNER JOIN pizzeria pz ON pz.id = pv.pizzeria_id
    GROUP BY
        pz.name
)
SELECT
    pz.name,
    (
        CASE
            WHEN v.count IS NULL THEN 0
            ELSE v.count
        END
    ) + (
        CASE
            WHEN o.count IS NULL THEN 0
            ELSE o.count
        END
    ) AS total_count
FROM
    pizzeria pz
    LEFT JOIN visits v ON v.name = pz.name
    LEFT JOIN orders o ON o.name = v.name
ORDER BY
    total_count DESC,
    name;