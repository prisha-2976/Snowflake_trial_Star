-- Fails if the fact table drops or duplicates order lines
select 1
from (
    select
        (select count(*) from {{ ref('fact_sales') }})        as fact_rows,
        (select count(*) from {{ ref('stg_order_details') }}) as source_rows
) t
where fact_rows <> source_rows
