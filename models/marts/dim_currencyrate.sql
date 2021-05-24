with

   sales as (
        select *
            from {{ ref ('stg_salesorderheader') }} 
    )
    , terrrotycode as (
        select *
            from {{ ref('stg_salesterritory') }} 
    )
    , currencyrate as (
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
            ,   
            case
                when countryregioncode = 'US' then subtotal 
                else subtotal / endofdayrate  
            end as subtotal_USD
            ,
                        case
                when countryregioncode = 'US' then totaldue
                else totaldue / endofdayrate  
            end as totaldue_USD
            ,
                        case
                when countryregioncode = 'US' then taxamt 
                else taxamt / endofdayrate  
            end as taxamt_USD
            ,
                        case
                when countryregioncode = 'US' then freight
                else freight / endofdayrate  
            end as freight_USD

    from sales
    left join currencyrate on sales.currencyrateid = currencyrate.currencyrateid 
    left join terrrotycode on sales.territoryid = terrrotycode.territoryid
    )

select * from salesorder_USD
