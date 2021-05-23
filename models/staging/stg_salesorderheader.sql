with
    source as (
        select
            /*Primary key*/
            salesorderid 

             /*Foreing key*/    
            , creditcardid  
            , currencyrateid
            , salespersonid 
            , customerid    
            , billtoaddressid       
            , shiptoaddressid   
            , shipmethodid      
            , territoryid   
 
            , subtotal  
            , taxamt        
            , orderdate     
            , freight       
            , shipdate  
            , duedate       
            , totaldue  
            , accountnumber
            , revisionnumber    
            , purchaseordernumber       
            , onlineorderflag   
            , creditcardapprovalcode        
            , status    
            , modifieddate      
            , rowguid 
 
        from {{ source ('adventure_works','salesorderheader') }} 
)
select *
from source
