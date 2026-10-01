select
    product_id, product_name, category_name, supplier_name, supplier_country, list_price, is_discontinued
from {{ ref('stg_products') }}
