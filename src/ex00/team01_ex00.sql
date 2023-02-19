with last_rates as (
    select
        id,
        name,
        rate_to_usd,
        updated
    from
        currency
    where
        updated in (
            select
                max(updated)
            from
                currency
            group by
                id
        )
)
select
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    b.type,
    sum(b.money) as volume, 
    coalesce(lr.name, 'not defined') as currency_name,
    coalesce(lr.rate_to_usd, 1) as last_rate_to_usd,
    sum(b.money) * coalesce(lr.rate_to_usd,1) as total_volume_in_usd
from
    balance b
    left join public .user u on u.id = b.user_id
    left join last_rates lr on lr .id = b.currency_id
group by
    u.id,
    b.type,
    lr.name,
    lr.rate_to_usd
order by 
    1 desc,
    2,3;
    -- u.name desc,
    -- u.lastname asc,
    -- b.type asc;