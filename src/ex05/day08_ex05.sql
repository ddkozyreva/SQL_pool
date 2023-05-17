-- Session #1
begin;

select
    sum(rating)
from
    pizzeria;

select
    sum(rating)
from
    pizzeria;

commit;

select
    sum(rating)
from
    pizzeria;

-- Session #2
begin;

update
    pizzeria
set
    rating = 1
WHERE
    name = 'Pizza Hut';

commit;

select
    sum(rating)
from
    pizzeria;