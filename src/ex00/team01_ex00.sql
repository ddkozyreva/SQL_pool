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
    b.money,
    b.currency_id,
    case
        when c.name is null then 'not defined'
        else c.name
    end currency_name,
    case
        when c.rate_to_usd is null then 1
        else c.rate_to_usd
    end rate_to_usd
from
    balance b
    left join public .user u on u.id = b.user_id
    left join currency c on c.id = b.currency_id