with customer as (
    select *
    from {{ ref('stg_aworks__sales_customer') }}
),

person as (
    select *
    from {{ ref('stg_aworks__person_person') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['customer_pk']) }} as customer_sk,
    c.customer_pk,
    c.person_fk,
    concat_ws(' ',
        p.first_name,
        p.middle_name,
        p.last_name
    ) as customer_name
from customer c

left join person p
    on c.person_fk = p.person_pk