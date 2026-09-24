with header as (
    select *
    from {{ ref('stg_aworks__salesorderheader') }}
),

detail as (
    select *
    from {{ ref('stg_aworks__sales_details') }}
),

joined as (
    select
        d.order_pk,
        h.sales_order_pk,
        d.sales_order_item_sk ,
        d.product_fk ,
        h.customer_fk,
        h.salesperson_fk,
        h.credit_card_fk,
        h.ship_to_address_fk,
        h.order_date,
        h.status,
        d.quantity,
        d.unit_price,
        d.unit_price_disct,
        (d.quantity * d.unit_price) as gross_amount,
        (d.quantity * d.unit_price * d.unit_price_disct) as discount_amount,
        ((d.quantity * d.unit_price)-(d.quantity * d.unit_price * d.unit_price_disct)) as net_amount

    from detail d

    inner join header h
        on h.sales_order_pk = d.sales_fk

)

select *
from joined