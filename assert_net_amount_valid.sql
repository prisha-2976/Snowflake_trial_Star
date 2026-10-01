-- Fails if any line has a negative amount or net above gross
select order_line_id
from {{ ref('fact_sales') }}
where net_amount < 0 or net_amount > gross_amount
