select
    s.product_id,
    s.year as first_year,
    s.quantity,
    s.price
from
    Sales s
    join (
        select
            product_id,
            min(year) as first_year
        from
            Sales
        group by
            product_id
    ) t on t.product_id = s.product_id
    and s.year = t.first_year