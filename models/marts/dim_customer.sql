with
    cl as (
        select *
            from {{ ref('stg_customer') }} as cl
    )
 
    , pe as (
        select *
            from {{ ref('stg_person') }} as pe
    )
 
    , pcc as (
        select *
            from {{ ref('stg_personcreditcard') }} as pcc
    )
 
    , cc as (
        select *
            from {{ ref('stg_creditcard') }} as cc
    )
    , spe as (
        select *
            from {{ ref('stg_salesperson') }} as spe
    )
    , tt as (
        select
            territoryid		
            , countryregioncode			
            , name as territoryname	

        from {{ ref('stg_salesterritory') }} as tt
    )	
    , fim_customer as (
        select
            cl.customerid 
            , cl.personid           
            , cl.territoryid        
            , cl.storeid    

            , pe.businessentityid       
            , pe.title      
            , pe.firstname      
            , pe.middlename
            , pe.lastname       
            , pe.persontype     
            , pe.suffix     
            , pe.emailpromotion 
            , pe.namestyle      

            , cc.creditcardid
            , cc.cardtype   
            , cc.cardnumber
            , cc.expmonth       
            , cc.expyear

            , tt.territoryname	
            , tt.countryregioncode		

            from cl
            left join tt on cl.territoryid = tt.territoryid
            left join spe on tt.territoryid = spe.territoryid 
            left join pe on spe.businessentityid = pe.businessentityid
            left join pcc on pe.businessentityid = pcc.businessentityid
            left join cc on pcc.creditcardid = cc.creditcardid
    )
    , transformed as (
        select 
            row_number () over (order by customerid ) as customer_sk
            , *
        from fim_customer
    )
    
select * from transformed