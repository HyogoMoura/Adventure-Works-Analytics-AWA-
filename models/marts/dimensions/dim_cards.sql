with source as (

    select *
    from {{ ref('stg_aworks__sales_creditcard') }}

)

select

    {{ dbt_utils.generate_surrogate_key([
        'credit_card_pk'
    ]) }} as credit_card_sk,

    credit_card_pk,
    card_type

from source