with last_rates as (
    select
        id,
        name,
        max(updated) as updated
    from
        currency
    group by
        id,
        name
),
tmp as (
    select
        last_rates. *,
        rate_to_usd
    from
        last_rates
        join currency c on c .id = last_rates.id
        and c .updated = last_rates.updated
),
sums as (
    select
        case
            when u.name is null then 'not defined'
            else u.name
        end name,
        case
            when u.lastname is null then 'not defined'
            else u.lastname
        end lastname,
        b.type,
        -- b.money,
        sum(b.money) as volume
         -- b.currency_id,
        -- case
        --     when c .name is null then 'not defined'
        --     else c .name
        -- end currency_name,
        -- case
        --     when c .rate_to_usd is null then 1
        --     else c .rate_to_usd
        -- end rate_to_usd,
        -- b.updated
    from
        balance b
        left join public .user u on u.id = b.user_id
        left join tmp c on c .id = b.currency_id
    group by
        u.name,
        u.lastname,
        b.type
)

select * from sums;