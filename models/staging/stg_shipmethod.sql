with
    source as (
        select 
            /*Primary key*/        
            shipmethodid
                    
            , name  
            , shiprate      
            , shipbase      
            , modifieddate      
            , rowguid       

             /* Stich columns*/  
            , _sdc_extracted_at     
            , _sdc_table_version        
            , _sdc_received_at      
            , _sdc_sequence 
            , _sdc_batched_at   
 
        from {{ source('adventure_works','shipmethod') }}
    )
    
select * from source