with

   sales as (
        select *
            from {{ ref ('stg_salesorderheader') }} 
   )
   , currency_rate as (
        select 
            currencyrateid	
            , tocurrencycode		
            , endofdayrate	
            , averagerate	
            , currencyratedate
            , fromcurrencycode	 
 
        from {{ ref('stg_currencyrate') }} 

    )
    , salesorder_USD as (
        select 
            sales.*
            , (sales.subtotal/currency_rate.endofdayrate) as subtotal_USD
            , (sales.totaldue/currency_rate.endofdayrate) as totaldue_USD
            , (sales.taxamt/currency_rate.endofdayrate) as taxamt_USD
            , (sales.freight/currency_rate.endofdayrate) as freight_USD

    from sales
    left join currency_rate on sales.currencyrateid = currency_rate.currencyrateid
    )

select * from salesorder_USD
