create function fnc_persons_female() returns 
table (id bigint, name varchar, age int, gender varchar, address varchar) 
AS $$
    select * from person;
$$ language sql;

select * from fnc_persons_female();