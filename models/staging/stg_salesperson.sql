with
    source as (
        select 
            businessentityid        
            , salesquota    
            , modifieddate      
            , rowguid   
            , saleslastyear     
            , commissionpct 
            , territoryid   
            , bonus 
            , salesytd          
            , _sdc_table_version        
            , _sdc_extracted_at     
            , _sdc_received_at  
            , _sdc_sequence     
            , _sdc_batched_at       
 
        from {{ source('adventure_works','salesperson') }}
    )
    
select * from source