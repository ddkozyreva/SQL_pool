SELECT
    orders.order_date,
    concat(person.name, ' (age:', person.age, ')') AS person_information
FROM
    (
        SELECT
            order_date,
            person_id AS id
        FROM
            person_order
    ) AS orders NATURAL
    JOIN person
ORDER BY
    order_date,
    person_information;