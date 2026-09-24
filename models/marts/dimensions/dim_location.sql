with source as (
    select *
    from {{ ref('int_aworks_location_join') }}
)

select
    location_sk,
    address_pk,
    city,
    state_province_name,
    country_name
from source