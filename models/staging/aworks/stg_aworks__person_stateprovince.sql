with source as (

    select *
    from {{ source('aworks', 'person_stateprovince') }}

),

renamed as (

    select
        cast(stateprovinceid as int) as state_province_pk,
        cast(stateprovincecode as string) as state_province_code,
        cast(countryregioncode as string) as country_region_code,
        cast(isonlystateprovinceflag as boolean) as is_only_state_province_flag,
        cast(name as string) as state_province_name,
        cast(territoryid as int) as territory_fk,
        cast(modifieddate as timestamp) as modified_date
    from source

)

select *
from renamed