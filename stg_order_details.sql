select
    orderid                                                          as order_id,
    productid                                                        as product_id,
    cast(orderid as varchar) || '-' || cast(productid as varchar)    as order_line_id,
    unitprice                                                        as unit_price,
    quantity,
    discount
from {{ ref('raw_order_details') }}
