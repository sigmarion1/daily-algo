select
    round(
        avg(order_date = customer_pref_delivery_date) * 100,
        2
    ) as immediate_percentage
from
    Delivery
where
    (customer_id, order_date) in (
        select
            customer_id,
            min(order_date) as first_order
        from
            delivery
        group by
            customer_id
    )