select
    customerid   as customer_id,
    companyname  as company_name,
    contactname  as contact_name,
    contacttitle as contact_title,
    city,
    region,
    country
from {{ ref('raw_customers') }}
