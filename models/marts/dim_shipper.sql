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
            , poh.taxamt        
            , poh.status
            , poh.orderdate 
            , poh.subtotal  
            , poh.revisionnumber    
            , poh.freight   
            , poh.shipdate  
 
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
 
select * from fim_shippers