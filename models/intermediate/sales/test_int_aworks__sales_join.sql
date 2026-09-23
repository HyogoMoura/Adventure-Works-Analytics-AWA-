with head as(
    select * from 
    {{ ref('stg_aworks__salesorderheader') }}
),

details as (
    select * from
    {{ ref('stg_aworks__sales_details') }}
),

joined as (
select * 
from details
inner join head on head.sales_pk = details.sales_fk
)

select * from joined