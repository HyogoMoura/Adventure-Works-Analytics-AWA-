with source as (
    select *
    from {{ ref('int_aworks__sales_reason_join') }}
)

select distinct
    sales_reason_sk,
    sales_reason_pk,
    sales_reason_name,
    reason_type

from source