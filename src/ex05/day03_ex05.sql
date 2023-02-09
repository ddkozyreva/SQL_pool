(
    SELECT
        piz.name AS pizzeria_name
    FROM
        person p
        JOIN person_visits pv ON pv.person_id = p.id
        JOIN pizzeria piz ON piz.id = pv.pizzeria_id
    WHERE
        p.name = 'Andrey'
)
EXCEPT
    ALL (
        SELECT
            piz.name AS pizzeria_name
        FROM
            person p
            JOIN person_order po ON po.person_id = p.id
            JOIN menu m ON m.id = po.menu_id
            JOIN pizzeria piz ON piz.id = m.pizzeria_id
        WHERE
            p.name = 'Andrey'
    )