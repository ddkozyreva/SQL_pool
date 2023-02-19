with last_currency_without_rates as (
    select
        id,
        name,
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
),
last_rates as (
    select
        lc.*,
        c.rate_to_usd as last_rate_to_usd
    from
        last_currency_without_rates lc
        join currency c on c.id = lc.id
        and c.updated = lc.updated
),
sums as (
    select
        user_id,
        b.type,
        b.currency_id,
        sum(b.money) as volume
    from
        balance b
    group by
        user_id,
        b.type,
        b.currency_id
),
sums_with_rates as (
    select
        *
    from
        sums s
        left join last_rates lr on lr.id = s.currency_id
),
final_sums as (
    select
        case
            when u.name is null then 'not defined'
            else u.name
        end name,
        case
            when u.lastname is null then 'not defined'
            else u.lastname
        end lastname,
        type,
        volume,
        case
            when sr.name is null then 'not defined'
            else sr.name
        end currency_name,
        case
            when last_rate_to_usd is null then 1
            else last_rate_to_usd
        end last_rate_to_usd
    from
        sums_with_rates sr
        left join public.user u on u.id = sr.user_id
)
select
    *,
    volume * last_rate_to_usd as total_volume_in_usd
from
    final_sums
order by
    name desc,
    lastname,
    type;