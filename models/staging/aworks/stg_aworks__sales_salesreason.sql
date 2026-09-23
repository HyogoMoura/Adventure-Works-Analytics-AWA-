with source as (

    select *
    from {{ source('aworks', 'sales_salesreason') }}

),

renamed as (

    select
        cast(salesreasonid as int) as sales_reason_pk,
        cast(name as string) as sales_reason_name,
        cast(reasontype as string) as reason_type,
        cast(modifieddate as timestamp) as modified_date
    from source

)

select *
from renamed