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
            
            from cl
            left join pe on cl.rowguid = pe.rowguid
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