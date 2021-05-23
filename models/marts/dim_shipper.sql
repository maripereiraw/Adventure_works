with
    sm as (
        select *
            from {{ ref('stg_shipmethod') }} as sm
    )
    , poh as (
        select *
            from {{ ref('stg_purchaseorderheader') }} as poh
    )
    , pod as (
        select *
            from {{ ref('stg_purchaseorderdetail') }} as pod
    )
    , fim_shippers as (
        select
            sm.shipmethodid     
            , sm.name   
            , sm.shiprate       
            , sm.shipbase
        
            , poh.purchaseorderid       
            , poh.employeeid    
            , poh.vendorid      
            , poh.subtotal  
            , poh.taxamt        
            , poh.status
            , poh.freight   
            , poh.orderdate 
            , poh.shipdate  
            , poh.revisionnumber    
 
            , pod.purchaseorderdetailid             
            , pod.productid 
            , pod.orderqty      
            , pod.receivedqty       
            , pod.rejectedqty       
            , pod.unitprice             
            , pod.duedate                   
            
            from sm
            left join poh on sm.shipmethodid = poh.shipmethodid 
            left join pod on poh.purchaseorderid = pod.purchaseorderid
    )
    , transformed as (
        select 
            row_number () over (order by shipmethodid) as shipmethod_sk
            , *
        from fim_shippers
    )   
select * from transformed 