-- Grain: one row per order line (order + product)
select
    d.order_line_id,
    d.order_id,
    o.customer_id,
    d.product_id,
    o.employee_id,
    year(o.order_date) * 10000 + month(o.order_date) * 100 + day(o.order_date) as order_date_key,
    case when o.shipped_date is null then null
         else year(o.shipped_date) * 10000 + month(o.shipped_date) * 100 + day(o.shipped_date)
    end                                              as shipped_date_key,
    d.quantity,
    d.unit_price,
    d.discount,
    d.quantity * d.unit_price                        as gross_amount,
    d.quantity * d.unit_price * (1 - d.discount)     as net_amount
from {{ ref('stg_order_details') }} d
inner join {{ ref('stg_orders') }} o on d.order_id = o.order_id
