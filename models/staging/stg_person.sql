with
    source as (
        select 
            businessentityid
 
            , lastname      
            , persontype        
            , namestyle     
            , suffix    
            , modifieddate  
            , rowguid   
            , emailpromotion    
            , title     
            , firstname     
            , middlename
        
            , _sdc_table_version        
            , _sdc_sequence 
            , _sdc_received_at      
            , _sdc_extracted_at 
            , _sdc_batched_at       
 
        from {{ source('adventure_works','person') }}
    )
    
select * from source