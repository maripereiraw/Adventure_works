with
    source as (
        select 
            creditcardid    
            , businessentityid
                    
            , modifieddate  
 
            , _sdc_extracted_at 
            , _sdc_received_at  
            , _sdc_sequence 
            , _sdc_batched_at       
            , _sdc_table_version        
 
        from {{ source('adventure_works','personcreditcard') }}
    )
    
select * from source