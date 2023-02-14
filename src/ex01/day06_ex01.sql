WITH tmp AS (
    SELECT
        p.id AS person_id,
        pizzeria_id,
        COUNT(*) AS count,
        (
            CASE
                WHEN COUNT(*) = 1 THEN 10.5
                WHEN COUNT(*) = 2 THEN 22.5
                ELSE 30
            END
        ) AS discount
    FROM
        person p
        INNER JOIN person_order po ON po.person_id = p.id
        INNER JOIN menu m ON m.id = po.menu_id
    GROUP BY
        p.id,
        pizzeria_id
    ORDER BY
        person_id
),
tmp_final AS (
    SELECT
        ROW_NUMBER() OVER () AS id,
        person_id,
        pizzeria_id,
        discount
    FROM
        tmp
)
INSERT INTO
    person_discounts(id, person_id, pizzeria_id, discount)
SELECT
    *
FROM
    tmp_final;