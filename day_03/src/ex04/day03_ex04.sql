WITH tmp AS (
    SELECT
        p.gender,
        piz.name
    FROM
        person p
        JOIN person_order po ON po.person_id = p.id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria piz ON piz.id = m.pizzeria_id
),
tmp_fem AS (
    SELECT
        name
    FROM
        tmp
    WHERE
        gender = 'female'
),
tmp_men AS (
    SELECT
        name
    FROM
        tmp
    WHERE
        gender = 'male'
),
fem_only AS (
    SELECT
        name
    FROM
        tmp_fem
    EXCEPT
    SELECT
        name
    FROM
        tmp_men
),
male_only AS (
    SELECT
        name
    FROM
        tmp_men
    EXCEPT
    SELECT
        name
    FROM
        tmp_fem
) (
    SELECT
        name AS pizzeria_name
    FROM
        fem_only
)
UNION
(
    SELECT
        name
    FROM
        male_only
)
ORDER BY
    pizzeria_name;