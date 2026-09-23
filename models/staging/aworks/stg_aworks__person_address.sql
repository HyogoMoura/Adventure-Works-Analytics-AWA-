with source as (

    select *
    from {{ source('aworks', 'person_address') }}

),

renamed as (

    select
        cast(addressid as int) as address_pk,
        cast(addressline1 as string) as address_line_1,
        cast(addressline2 as string) as address_line_2,
        cast(city as string) as city,
        cast(stateprovinceid as int) as state_province_fk,
        cast(postalcode as string) as postal_code,
        cast(spatiallocation as string) as spatial_location,
        cast(modifieddate as timestamp) as modified_date
    from source

)

select *
from renamed