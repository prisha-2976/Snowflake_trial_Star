select
    employee_id, employee_name, job_title, city, country, hire_date
from {{ ref('stg_employees') }}
