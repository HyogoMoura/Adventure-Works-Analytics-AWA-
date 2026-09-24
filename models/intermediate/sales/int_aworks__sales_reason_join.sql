with bridge as (
    select *
    from {{ ref('stg_aworks__sales_salesorderheadersalesreason') }}
),

reason as (
    select *
    from {{ ref('stg_aworks__sales_salesreason') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['sales_reason_pk']) }} as sales_reason_sk
    b.sales_order_fk,
    r.sales_reason_pk,
    r.sales_reason_name,
    r.reason_type
from bridge b

left join reason r
    on b.sales_reason_fk = r.sales_reason_pk