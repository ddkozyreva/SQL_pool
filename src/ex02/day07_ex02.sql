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
    ORDER BY
        count DESC
    FETCH FIRST
        3 ROWS ONLY
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
    ORDER BY
        count DESC
    FETCH FIRST
        3 ROWS ONLY
) (
    SELECT
        *
    FROM
        orders
)
UNION
ALL (
    SELECT
        *
    FROM
        visits
);