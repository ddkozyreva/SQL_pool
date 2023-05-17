-- Session #1
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
WHERE
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
WHERE
    name = 'Pizza Hut';

commit;

select
    rating
from
    pizzeria
where
    name = 'Pizza Hut';