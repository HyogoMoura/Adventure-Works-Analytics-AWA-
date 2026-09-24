with address as (
    select *
    from {{ ref('stg_aworks__person_address') }}
),

state as (
    select *
    from {{ ref('stg_aworks__person_stateprovince') }}
),

country as (
    select *
    from {{ ref('stg_aworks__person_countryregion') }}
),

joined as (
    select
        {{ dbt_utils.generate_surrogate_key(['a.address_pk']) }} as location_sk,
        a.address_pk,
        a.city,
        s.state_province_pk,
        s.state_province_name,
        s.state_province_code,
        c.country_region_code,
        c.country_name
    from address a

    left join state s
        on a.state_province_fk = s.state_province_pk

    left join country c
        on s.country_region_code = c.country_region_code

)

select *
from joined