
create or replace function 
fnc_person_visits_and_eats_on_date(pperson varchar default 'Dmitriy',
pprice numeric default 500,
pdate date default '2022-01-08') returns 
table (pizzeria_name varchar) 
AS $$
    select distinct pz.name as pizzeria_name from person_order po
    join person_visits pv on pv.person_id = po.person_id and pv.visit_date = po.order_date
    join person p on po.person_id = p.id
    join menu m on m.id = po.menu_id
    join pizzeria pz on pz.id = pv.pizzeria_id

    where p.name = pperson and m.price < pprice and po.order_date = pdate;
$$ language sql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');