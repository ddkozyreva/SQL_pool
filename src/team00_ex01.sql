WITH RECURSIVE find_path AS (
    SELECT
        destination,
        '{' || departure || ',' || destination as route,
        cost,
        RIGHT(destination, 1) as history
    FROM
        routes
    WHERE
        departure = 'a'
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
        char_length(find_path.route) < 8
        AND find_path.history != routes.destination
        AND routes.destination != 'a'
),
final_routes AS (
    SELECT
        find_path.cost + routes.cost as total_cost,
        route || ',a}' as tour
    FROM
        find_path
        JOIN routes ON routes.destination = 'a'
        AND RIGHT(find_path.route, 1) = routes.departure
    WHERE
        char_length(find_path.route) = 8
    ORDER BY
        total_cost,
        tour
)
SELECT
    total_cost,
    tour
FROM
    final_routes
WHERE
    total_cost IN (
        (
            SELECT
                min(total_cost)
            FROM
                final_routes
        ),
        (
            SELECT
                max(total_cost)
            FROM
                final_routes
        )
    );