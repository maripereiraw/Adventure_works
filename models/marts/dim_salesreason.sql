with
    order_sales_reason as (
        select *
        from {{ ref ('stg_salesorderheadersalesreason') }} 
    )
    , sales_reason as (
        select *
        from {{ ref ('stg_salesreason') }}
    )
    , salesorder as (
        select
            order_sales_reason.salesreasonid			
            , order_sales_reason.salesorderid			
            , sales_reason.name_reason			
            , sales_reason.reasontype

        from order_sales_reason
        left join sales_reason on order_sales_reason.salesreasonid = sales_reason.salesreasonid
    )

select * from salesorder
