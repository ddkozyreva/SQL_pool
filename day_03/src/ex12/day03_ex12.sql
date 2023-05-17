WITH tmp AS (
    SELECT
        (
            SELECT
                MIN(id)
            FROM
                person
        ) AS min_person_id,
        (
            SELECT
                MAX(id)
            FROM
                person
        ) AS max_person_id,
        (
            SELECT
                MAX(id)
            FROM
                person_order
        ) AS max_old_order,
        (
            SELECT
                id
            FROM
                menu
            WHERE
                pizza_name = 'greek pizza'
        ) AS pizza_id
)
INSERT INTO
    person_order (
        SELECT
            generate_series(
                max_old_order + min_person_id,
                max_old_order + max_person_id
            ),
            generate_series(min_person_id, max_person_id),
            pizza_id,
            '2022-02-25'
        FROM
            tmp
    );