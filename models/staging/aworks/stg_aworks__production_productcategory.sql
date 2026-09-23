with 

source as (

    select * from {{ source('aworks', 'production_productcategory') }}

),

renamed as (

    select
        cast(productcategoryid as int) as product_category_pk,
        cast(name as string) as category_name,
        cast(rowguid as string) as row_guid,
        cast(modifieddate as timestamp) as modified_date

    from source

)

select * from renamed