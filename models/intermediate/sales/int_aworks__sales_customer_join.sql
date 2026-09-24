with customer as (

    select *
    from {{ ref('stg_aworks__sales_customer') }}

),

person as (

    select *
    from {{ ref('stg_aworks__person_person') }}

),

joined as (

    select
        {{ dbt_utils.generate_surrogate_key(['c.customer_pk']) }} as customer_sk,
        c.customer_pk,
        c.person_fk,
        c.store_fk,
        c.territory_fk,

        cast(trim(concat_ws(' ',p.first_name,p.middle_name,p.last_name)) as string) as customer_name

    from customer c

    left join person p
        on c.person_fk = p.person_pk

)

select *
from joined