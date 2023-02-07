SELECT 
    id AS object_id, 
    pizza_name AS object_name 
FROM 
    menu
UNION
SELECT 
    id, 
    name 
FROM 
    person
ORDER BY 
    object_id ASC, 
    object_name ASC;
