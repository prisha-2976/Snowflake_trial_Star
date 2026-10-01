select
    orderid                     as order_id,
    customerid                  as customer_id,
    employeeid                  as employee_id,
    cast(orderdate as date)     as order_date,
    cast(shippeddate as date)   as shipped_date,
    freight,
    shipcountry                 as ship_country
from {{ ref('raw_orders') }}
