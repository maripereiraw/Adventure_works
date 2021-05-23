with
    source as (
        select 
        
            /*Foreing key*/ 
            creditcardid    
            , businessentityid
                    
            , modifieddate  

             /* Stich columns*/  
            , _sdc_extracted_at 
            , _sdc_received_at  
            , _sdc_sequence 
            , _sdc_batched_at       
            , _sdc_table_version        
 
        from {{ source('adventure_works','personcreditcard') }}
    )
    
select * from source