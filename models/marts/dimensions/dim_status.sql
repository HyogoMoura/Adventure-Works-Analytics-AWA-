with source as (

    select distinct
        status
    from {{ ref('int_aworks__sales_join') }}

),

formated as (

    select

        {{ dbt_utils.generate_surrogate_key([
            'status'
        ]) }} as status_sk,

        cast(status as int) as status_id,

        case cast(status as int)
            when 1 then 'In Process'
            when 2 then 'Approved'
            when 3 then 'Backordered'
            when 4 then 'Rejected'
            when 5 then 'Shipped'
            when 6 then 'Cancelled'
        end as status_name

    from source

)

select *
from formated