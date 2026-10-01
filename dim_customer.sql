select
    customer_id, company_name, contact_name, contact_title, city, region, country
from {{ ref('stg_customers') }}
