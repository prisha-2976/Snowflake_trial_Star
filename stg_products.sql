select
    p.productid                  as product_id,
    p.productname                as product_name,
    p.categoryid                 as category_id,
    c.categoryname               as category_name,
    p.supplierid                 as supplier_id,
    s.companyname                as supplier_name,
    s.country                    as supplier_country,
    p.unitprice                  as list_price,
    case when p.discontinued = 1 then true else false end as is_discontinued
from {{ ref('raw_products') }} p
left join {{ ref('raw_categories') }} c on p.categoryid = c.categoryid
left join {{ ref('raw_suppliers') }}  s on p.supplierid = s.supplierid
