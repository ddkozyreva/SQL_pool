-- Session 1
begin;

select
    rating
from
    pizzeria
where
    name = 'Pizza Hut';

update
    pizzeria
set
    rating = 4
where
    name = 'Pizza Hut';

commit;

-- Session 2
begin;

select
    rating
from
    pizzeria
where
    name = 'Pizza Hut';

update
    pizzeria
set
    rating = 3.6
where
    name = 'Pizza Hut';

commit;