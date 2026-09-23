with source as (

    select *
    from {{ source('aworks', 'sales_salesperson') }}

),

renamed as (

    select
        cast(businessentityid as int) as salesperson_pk,
        cast(territoryid as int) as territory_fk,
        cast(salesquota as decimal(18,2)) as sales_quota,
        cast(bonus as decimal(18,2)) as bonus,
        cast(commissionpct as decimal(18,4)) as commission_pct,
        cast(salesytd as decimal(18,2)) as sales_ytd,
        cast(saleslastyear as decimal(18,2)) as sales_last_year,
        cast(modifieddate as timestamp) as modified_date
    from source

)

select *
from renamed