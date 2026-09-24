with source as (

    select *
    from {{ ref('int_aworks__sales_customer_join') }}

)

select
    customer_sk,
    customer_pk,
    customer_name,
    territory_fk

from source