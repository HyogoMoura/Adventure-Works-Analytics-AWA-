with source_sales as (
    select * 
    from {{ source('aworks', 'sales_salesorderdetail') }}
),

renamed as (
    select
    {{ dbt_utils.generate_surrogate_key(['salesorderdetailid','salesorderid']) }} as sales_order_item_sk,
    cast(salesorderdetailid as int) as order_pk,
    cast(salesorderid AS INT) AS sales_fk,
    cast(orderqty as float) as quantity,
    cast(productid as int) as product_fk,
    cast(unitprice as float) as unit_price, 
    round(cast(unitpricediscount as float),2) as unit_price_disct ,
    cast(modifieddate as date) as modifie_ddate
    from source_sales
)

select * from renamed