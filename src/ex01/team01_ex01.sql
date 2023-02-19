-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

create or replace function get_rate(b_id int, b_date timestamp without time zone) returns numeric as $$
declare
    min_date_rate numeric;
    max_date_rate numeric;
begin
    select 
        rate_to_usd
    from
        currency c 
        join balance b on b_id = b.currency_id 
        and
        c.id = b_id
    where 
        c.updated < b_date
    order by c.updated desc
    limit 1
    into min_date_rate;
    select 
        rate_to_usd
    from
        currency c 
        join balance b on b_id = b.currency_id 
        and
        c.id = b_id
    where 
        c.updated >= b_date
    order by c.updated desc
    limit 1
    into max_date_rate;
    return coalesce(min_date_rate, max_date_rate);
end; 
$$ language plpgsql;

select distinct
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    c .name as currency_name,
    get_rate(b.currency_id, b.updated) * b.money as currency_in_usd
    -- b.currency_id,
    -- c.rate_to_usd,
    -- b.updated as b_date,
    -- c.updated as old_update
from
    balance b
    left join public .user u on u.id = b.user_id
    join currency c on b.currency_id = c .id 
    and c .id is not null
order by
    1 desc, 2 asc, 3 asc;