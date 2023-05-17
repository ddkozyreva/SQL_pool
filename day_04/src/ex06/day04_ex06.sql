CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT
    piz.name AS pizzeria_name
FROM
    (
        SELECT
            id
        FROM
            person
        WHERE
            name = 'Dmitriy'
    ) AS p
    JOIN (
        SELECT
            person_id,
            pizzeria_id
        FROM
            person_visits
        WHERE
            visit_date = '2022-01-08'
    ) AS pv ON pv.person_id = p.id
    JOIN pizzeria piz ON piz.id = pv.pizzeria_id
    JOIN (
        SELECT
            pizzeria_id
        FROM
            menu
        WHERE
            price < 800
    ) AS m ON m.pizzeria_id = pv.pizzeria_id;