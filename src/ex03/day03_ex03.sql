WITH tmp AS (
    SELECT
        p.gender,
        piz.name
    FROM
        person p
        JOIN person_visits pv ON pv.person_id = p.id
        JOIN pizzeria piz ON piz.id = pv.pizzeria_id
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
fem_often AS (
    SELECT
        name
    FROM
        tmp_fem
    EXCEPT
        ALL
    SELECT
        name
    FROM
        tmp_men
),
male_often AS (
    SELECT
        name
    FROM
        tmp_men
    EXCEPT
        ALL
    SELECT
        name
    FROM
        tmp_fem
) (
    SELECT
        name
    FROM
        fem_often
)
UNION
ALL (
    SELECT
        name
    FROM
        male_often
)
ORDER BY
    name;