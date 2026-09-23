with source as (

    select *
    from {{ source('aworks', 'sales_salesorderheadersalesreason') }}

),

renamed as (

    select
        cast(salesorderid as int) as sales_order_fk,
        cast(salesreasonid as int) as sales_reason_fk,
        cast(modifieddate as timestamp) as modified_date
    from source

)

select *
from renamed