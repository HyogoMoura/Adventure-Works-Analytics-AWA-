with sales as (
    select *
    from {{ ref('int_aworks__sales_join') }}
),

product as (
    select
        product_sk,
        product_pk
    from {{ ref('dim_product') }}
),

customer as (
    select
        customer_sk,
        customer_pk
    from {{ ref('dim_customers') }}
),

location as (
    select
        location_sk,
        address_pk
    from {{ ref('dim_location') }}
),

credit_card as (
    select
        credit_card_sk,
        credit_card_pk
    from {{ ref('dim_cards') }}
),

status as (
    select
        status_sk,
        status_id
    from {{ ref('dim_status') }}
),

date_dim as (

    select
        date_sk,
        full_date
    from {{ ref('dim_date') }}

),

sales_reason as (
    select distinct
        sales_order_fk,
        sales_reason_sk
    from {{ ref('int_aworks__sales_reason_join') }}
)

select
    s.sales_order_item_sk,
    p.product_sk,
    c.customer_sk,
    l.location_sk,
    cc.credit_card_sk,
    st.status_sk,
    d.date_sk,
    sr.sales_reason_sk,
    s.sales_order_pk,
    s.order_pk,
    s.quantity,
    s.unit_price,
    s.unit_price_disct,
    s.gross_amount,
    s.discount_amount,
    s.net_amount,
    1 as order_count

from sales s

left join product p
    on s.product_fk = p.product_pk

left join customer c
    on s.customer_fk = c.customer_pk

left join location l
    on s.ship_to_address_fk = l.address_pk

left join credit_card cc
    on s.credit_card_fk = cc.credit_card_pk

left join status st
    on s.status = st.status_id

left join date_dim d
    on s.order_date = d.full_date

left join sales_reason sr
    on s.sales_order_pk = sr.sales_order_fk