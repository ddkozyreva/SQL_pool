-- Session #1
begin;

set
    transaction isolation level serializable;

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

set
    transaction isolation level serializable;

show transaction isolation level;

update
    pizzeria
set
    rating = 3.0
where
    name = 'Pizza Hut';

commit;

select
    rating
from
    pizzeria
where
    name = 'Pizza Hut';