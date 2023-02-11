WITH RECURSIVE find_path AS (
    SELECT
        destination,
        departure || ',' || destination as route,
        cost,
        RIGHT(destination, 1) as history
    FROM
        routes
    WHERE
        departure = 'A'
    UNION
    SELECT
        routes.destination,
        find_path.route || ',' || routes.destination AS route,
        find_path.cost + routes.cost as cost,
        RIGHT(find_path.route, 1) as history
    FROM
        routes
        JOIN find_path ON find_path.destination = routes.departure
    WHERE
        char_length(find_path.route) < 7
        AND find_path.history != routes.destination
        AND routes.destination != 'A'
)
SELECT
    find_path.cost + (routes.cost) as total_cost,
    route || ',A' as tour
FROM
    find_path
    JOIN routes ON routes.destination = 'A'
    AND RIGHT(find_path.route, 1) = routes.departure
WHERE
    char_length(find_path.route) = 7
ORDER BY
    total_cost;