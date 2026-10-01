select
    employeeid                     as employee_id,
    firstname || ' ' || lastname   as employee_name,
    title                          as job_title,
    city,
    country,
    cast(hiredate as date)         as hire_date
from {{ ref('raw_employees') }}
