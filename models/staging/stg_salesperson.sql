with
    source as (
        select 

            /*Foreing key*/ 
            businessentityid
            , territoryid   

            , salesquota    
            , saleslastyear     
            , commissionpct 
            , bonus 
            , salesytd          
            , modifieddate      
            , rowguid   
            
             /* Stich columns*/ 
            , _sdc_table_version        
            , _sdc_extracted_at     
            , _sdc_received_at  
            , _sdc_sequence     
            , _sdc_batched_at       
 
        from {{ source('adventure_works','salesperson') }}
    )
    
select * from source