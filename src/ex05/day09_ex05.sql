drop function fnc_persons_female();
drop function fnc_persons_male();

create function fnc_persons(pgender varchar default 'female') returns 
table (id bigint, name varchar, age int, gender varchar, address varchar) 
AS $$
    select * from person where gender = pgender;
$$ language sql;

select * from fnc_persons();
select * from fnc_persons(pgender := 'male');
