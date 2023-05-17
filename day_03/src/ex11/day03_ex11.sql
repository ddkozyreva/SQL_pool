UPDATE
    menu
SET
    price = CAST(0.9 * price AS INT)
WHERE
    pizza_name = 'greek pizza';