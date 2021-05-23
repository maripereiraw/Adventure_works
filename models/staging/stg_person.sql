with
    source as (
        select 
        
            /*Foreing key*/             
            businessentityid
 
            , title     
            , firstname     
            , middlename
            , lastname      
            , persontype        
            , suffix    
            , emailpromotion    
            , namestyle     
            , rowguid   
            , modifieddate  

            /* Stich columns*/         
            , _sdc_table_version        
            , _sdc_sequence 
            , _sdc_received_at      
            , _sdc_extracted_at 
            , _sdc_batched_at       
 
        from {{ source('adventure_works','person') }}
    )
    
select * from source