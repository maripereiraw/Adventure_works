with
    source as (
        select 
            salespersonid       
            , businessentityid
            
            , modifieddate      
            , rowguid       
            , name      
 
            , _sdc_table_version    
            , _sdc_batched_at
            , _sdc_received_at  
            , _sdc_sequence 
            , _sdc_extracted_at
        from {{ source('adventure_works','store') }}
    )
    
select * from source