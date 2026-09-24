with bridge as (
    select *
    from {{ ref('stg_aworks__sales_salesorderheadersalesreason') }}
),

reason as (
    select *
    from {{ ref('stg_aworks__sales_salesreason') }}
),

joined as (
    select
        {{ dbt_utils.generate_surrogate_key(['r.sales_reason_pk']) }} as sales_reason_sk,
        b.sales_order_fk,
        r.sales_reason_pk,
        r.sales_reason_name,
        r.reason_type
    from bridge b

    left join reason r
        on b.sales_reason_fk = r.sales_reason_pk

),

ranked as (

    select
        *,
        row_number() over(
            partition by sales_order_fk
            order by sales_reason_pk
        ) as rn
    from joined

)

select
    sales_order_fk,
    sales_reason_sk,
    sales_reason_pk,
    sales_reason_name,
    reason_type
from ranked
where rn = 1