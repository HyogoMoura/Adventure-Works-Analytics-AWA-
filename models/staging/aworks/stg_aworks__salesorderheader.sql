with source as (

    select *
    from {{ source('aworks', 'sales_salesorderheader') }}

),

renamed as (

    select
        cast(salesorderid as int) as sales_order_pk,
        cast(revisionnumber as int) as revision_number,
        cast(orderdate as date) as order_date,
        cast(duedate as date) as due_date,
        cast(shipdate as date) as ship_date,
        cast(status as int) as status,
        cast(onlineorderflag as boolean) as online_order_flag,
        cast(purchaseordernumber as string) as purchase_order_number,
        cast(accountnumber as string) as account_number,
        cast(customerid as int) as customer_fk,
        cast(salespersonid as int) as salesperson_fk,
        cast(territoryid as int) as territory_fk,
        cast(billtoaddressid as int) as bill_to_address_fk,
        cast(shiptoaddressid as int) as ship_to_address_fk,
        cast(shipmethodid as int) as ship_method_fk,
        cast(creditcardid as int) as credit_card_fk,
        cast(creditcardapprovalcode as string) as credit_card_approval_code,
        cast(currencyrateid as int) as currency_rate_fk,
        cast(subtotal as decimal(18,2)) as subtotal,
        cast(taxamt as decimal(18,2)) as tax_amount,
        cast(freight as decimal(18,2)) as freight_amount,
        cast(totaldue as decimal(18,2)) as total_due,

        cast(comment as string) as comments,

        cast(modifieddate as timestamp) as modified_date

    from source

)

select *
from renamed