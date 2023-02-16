-- Session #1
begin;

show transaction isolation level;

select
    rating
from
    pizzeria
where
    name = 'Pizza Hut';

select
    rating
from
    pizzeria
where
    name = 'Pizza Hut';

commit;

select
    rating
from
    pizzeria
where
    name = 'Pizza Hut';

-- Session #2
begin;

show transaction isolation level;

update
    pizzeria
set
    rating = 3.6
WHERE
    name = 'Pizza Hut';

commit;

select
    rating
from
    pizzeria
where
    name = 'Pizza Hut';