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
            , pe.lastname       
            , pe.persontype     
            , pe.namestyle      
            , pe.suffix     
            , pe.emailpromotion 
            , pe.title      
            , pe.firstname      
            , pe.middlename
 
            , cc.creditcardid
            , cc.cardtype   
            , cc.expyear
            , cc.expmonth       
            , cc.cardnumber
            
            from cl
            left join pe on cl.rowguid = pe.rowguid
            left join pcc on pe.businessentityid = pcc.businessentityid
            left join cc on pcc.creditcardid = cc.creditcardid
    )
   
select * from fim_customer