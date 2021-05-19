with
    source as (
        select 
            purchaseorderid     
            , shipmethodid      
            , employeeid    
            , vendorid  
            
            , modifieddate      
            , taxamt        
            , status
            , orderdate 
            , subtotal  
            , revisionnumber    
            , freight   
            , shipdate  
 
            , _sdc_sequence 
            , _sdc_extracted_at 
            , _sdc_batched_at   
            , _sdc_received_at      
            , _sdc_table_version        
 
        from {{ source('adventure_works','purchaseorderheader') }}
    )
    
select * from source