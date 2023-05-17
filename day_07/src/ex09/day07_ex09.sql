WITH tmp AS(
    SELECT
        address,
        round(
            CAST(max(age) AS NUMERIC) - CAST(min(age) AS NUMERIC) / CAST(max(age) AS NUMERIC),
            2
        ) AS formula,
        round(avg(age), 2) AS average
    FROM
        person
    GROUP BY
        address
)
SELECT
    *,
    (formula > average) AS comparison
FROM
    tmp
ORDER BY
    address;