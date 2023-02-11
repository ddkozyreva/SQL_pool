WITH RECURSIVE possible_routes AS (
    SELECT
        routes.destination,
        routes.departure || '->' || routes.destination AS tour,
        routes.cost,
        routes.destination = 'B' AS b_flag,
        routes.destination = 'C' AS c_flag,
        routes.destination = 'D' AS d_flag
    FROM
        routes
    WHERE
        routes.departure = 'A'
    UNION
    ALL
    SELECT
        routes.destination,
        possible_routes.tour || '->' || routes.destination AS tour,
        possible_routes.cost + routes.cost,
        -- possible_routes - в итоге это предпоследний пункт
        -- if b_flag true then b_flag = true else b_flag = (routes.destination = 'B')
        possible_routes.destination = 'B' AS b_flag,
        possible_routes.destination = 'C' AS c_flag,
        possible_routes.destination = 'D' AS d_flag
    FROM
        possible_routes
        INNER JOIN routes ON routes.departure = possible_routes.destination
    WHERE
        possible_routes.cost < 100
)
SELECT
    --конечный пункт
    destination,
    possible_routes.tour,
    possible_routes.cost,
    b_flag,
    c_flag,
    d_flag
FROM
    possible_routes
WHERE
    -- b_flag = true
    -- AND 
    -- c_flag = true
    -- AND d_flag = true
    -- AND 
    possible_routes.destination = 'A'
ORDER BY
    possible_routes.cost;