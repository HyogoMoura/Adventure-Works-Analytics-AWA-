with validation as (

    select
        round(sum(f.gross_amount), 2) as total_sales
    from {{ ref('fct_sales') }} f
    inner join {{ ref('dim_date') }} d
        on f.date_sk = d.date_sk
    where d.year_number = 2011

)

select *
from validation
where abs(total_sales - 12646112.16) > 1