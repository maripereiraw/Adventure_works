with
    source as (
        select 
            /*Primary key*/
            purchaseorderid    

            /*Foreing key*/  
            , employeeid    
            , vendorid  
            , shipmethodid      
            
            , subtotal  
            , taxamt        
            , status
            , freight   
            , orderdate 
            , shipdate  
            , revisionnumber    
            , modifieddate      
            
             /* Stich columns*/  
            , _sdc_sequence 
            , _sdc_extracted_at 
            , _sdc_batched_at   
            , _sdc_received_at      
            , _sdc_table_version        
 
        from {{ source('adventure_works','purchaseorderheader') }}
    )
    
select * from source