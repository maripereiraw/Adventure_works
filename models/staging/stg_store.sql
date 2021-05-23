with
    source as (
        select 
            
            /*Foreing key*/
            salespersonid       
            , businessentityid
            
            , name      
            , modifieddate      
            , rowguid       

             /* Stich columns*/  
            , _sdc_table_version    
            , _sdc_batched_at
            , _sdc_received_at  
            , _sdc_sequence 
            , _sdc_extracted_at

        from {{ source('adventure_works','store') }}
    )
    
select * from source