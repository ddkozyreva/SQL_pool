SELECT
    p.name,
    count(*) AS count_of_visits
FROM
    person_visits pv
    INNER JOIN person p ON p.id = pv.person_id
GROUP BY
    p.name
ORDER BY
    count_of_visits DESC,
    p.name ASC
FETCH FIRST
    4 ROWS ONLY;