with 

source as (

    select * from {{ source('aworks', 'production_productsubcategory') }}

),

renamed as (

    select
        cast(productsubcategoryid as int) as product_subcategory_pk,
        cast(productcategoryid as int) as product_category_fk,
        cast(name as string) as subcategory_name,
        cast(modifieddate as timestamp) as modified_date

    from source

)

select * from renamed