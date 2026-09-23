with 

source as (

    select * from {{ source('aworks', 'production_product') }}

),

renamed as (

    select
        cast(productid as int) as product_pk,
        cast(name as string) as product_name,
        cast(productnumber as string) as product_number,
        cast(makeflag as boolean) as make_flag,
        cast(finishedgoodsflag as boolean) as finished_goods_flag,
        cast(color as string) as color,
        cast(safetystocklevel as int) as safety_stock_level,
        cast(reorderpoint as int) as reorder_point,
        cast(standardcost as decimal(18,4)) as standard_cost,
        cast(listprice as decimal(18,4)) as list_price,
        cast(size as string) as product_size,
        cast(sizeunitmeasurecode as string) as size_unit_measure_code,
        cast(weightunitmeasurecode as string) as weight_unit_measure_code,
        cast(weight as decimal(18,4)) as weight,
        cast(daystomanufacture as int) as days_to_manufacture,
        cast(productline as string) as product_line,
        cast(class as string) as product_class,
        cast(style as string) as product_style,
        cast(productsubcategoryid as int) as product_subcategory_fk,
        cast(productmodelid as int) as product_model_fk,
        cast(sellstartdate as timestamp) as sell_start_date,
        cast(sellenddate as timestamp) as sell_end_date,
        cast(discontinueddate as timestamp) as discontinued_date,
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as modified_date
    from source

)

select * from renamed