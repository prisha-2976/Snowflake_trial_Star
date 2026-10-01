with dates as (
    select order_date as date_day from {{ ref('stg_orders') }}
    union
    select shipped_date from {{ ref('stg_orders') }} where shipped_date is not null
)

select
    year(date_day) * 10000 + month(date_day) * 100 + day(date_day) as date_key,
    date_day,
    year(date_day)      as year_number,
    quarter(date_day)   as quarter_number,
    month(date_day)     as month_number,
    monthname(date_day) as month_name,
    day(date_day)       as day_of_month,
    dayname(date_day)   as day_name
from dates
