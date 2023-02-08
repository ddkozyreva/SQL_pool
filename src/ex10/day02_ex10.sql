SELECT
    p1.name,
    p2.name,
    p1.address
FROM
    person p1
    LEFT JOIN person p2 ON p1.address = p2.address
WHERE
    p1.id > p2.id
ORDER BY
    p1.name,
    p2.name;