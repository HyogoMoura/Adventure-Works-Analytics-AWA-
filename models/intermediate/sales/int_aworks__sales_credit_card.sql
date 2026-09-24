with credit_card as (

    select *
    from {{ ref('stg_aworks__sales_creditcard') }}

),

formated as (

    select
        {{ dbt_utils.generate_surrogate_key(['credit_card_pk']) }} as credit_card_sk,
        cast(credit_card_pk as int) as credit_card_pk,
        cast(card_type as string) as card_type,
        cast(card_number as string) as card_number,
        cast(exp_month as int) as exp_month,
        cast(exp_year as int) as exp_year,
        cast(modified_date as timestamp) as modified_date

    from credit_card

)

select *
from formated