with source as (

    select *
    from {{ source('aworks', 'person_businessentityaddress') }}

),

renamed as (

    select
        cast(businessentityid as int) as business_entity_fk,
        cast(addressid as int) as address_fk,
        cast(addresstypeid as int) as address_type_fk,
        cast(modifieddate as timestamp) as modified_date
    from source

)

select *
from renamed