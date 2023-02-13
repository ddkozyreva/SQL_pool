CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

--@block
SET
    enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT
    pizza_name,
    pizzeria_id
FROM
    menu
WHERE
    pizzeria_id = '1';