with source as (
    select *
    from {{ ref('int_aworks_products_join') }}
)

select
    product_sk,
    product_pk,
    product_name,
    product_number,
    category_name,
    subcategory_name,
    color,
    product_size,
    standard_cost,
    list_price

from source