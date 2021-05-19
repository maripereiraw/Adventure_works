with
    source as (
        select 
            salesorderid    
            , shipmethodid      
            , shiptoaddressid   
            , currencyrateid
            , billtoaddressid       
            , creditcardid  
            , salespersonid 
            , territoryid   
            , customerid    
 
            , purchaseordernumber       
            , modifieddate      
            , rowguid   
            , taxamt        
            , onlineorderflag   
            , status    
            , orderdate     
            , creditcardapprovalcode        
            , subtotal  
            , revisionnumber    
            , freight       
            , duedate       
            , totaldue  
            , shipdate  
            , accountnumber
                
            , _sdc_table_version    
            , _sdc_received_at  
            , _sdc_sequence 
            , _sdc_batched_at   
            , _sdc_extracted_at 
 
        from {{ source('adventure_works','salesorderheader') }}
    )
    
select * from source