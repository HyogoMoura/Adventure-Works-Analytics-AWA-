with source as (

    select distinct
        order_date
    from {{ ref('int_aworks__sales_join') }}

)

select

    {{ dbt_utils.generate_surrogate_key([
        'order_date'
    ]) }} as date_sk,

    order_date as full_date,

    day(order_date) as day_number,

    month(order_date) as month_number,

    date_format(order_date, 'MMMM') as month_name,

    quarter(order_date) as quarter_number,

    year(order_date) as year_number,

    concat(
        year(order_date),
        '-',
        lpad(month(order_date), 2, '0')
    ) as year_month

from source