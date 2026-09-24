with validation as (

    select
        round(sum(f.gross_amount), 2) as total_sales
    from {{ ref('fact_vendas') }} f
    inner join {{ ref('dim_data') }} d
        on f.date_sk = d.date_sk
    where d.year_number = 2011

)

select *
from validation
where abs(total_sales - 12646112.16) = 0