with product as (
    select *
    from {{ ref('stg_aworks__production_product') }}
),

subcategory as (
    select *
    from {{ ref('stg_aworks__production_productsubcategory') }}
),

category as (
    select *
    from {{ ref('stg_aworks__production_productcategory') }}
),

joined as (
    select
        {{ dbt_utils.generate_surrogate_key(['p.product_pk']) }} as product_sk,
        p.product_pk,
        p.product_name,
        p.product_number,
        s.product_subcategory_pk,
        s.subcategory_name,
        c.product_category_pk,
        c.category_name,
        p.color,
        p.product_size,
        p.list_price,
        p.standard_cost

    from product p

    left join subcategory s
        on p.product_subcategory_fk = s.product_subcategory_pk

    left join category c
        on s.product_category_fk = c.product_category_pk

)

select *
from joined