with
    source as (
        select 
            stateprovinceid         
            , territoryid       
            , countryregioncode     
            , modifieddate      
            , rowguid
            , name as t_name
            , isonlystateprovinceflag
            , stateprovincecode 
            
            , _sdc_table_version    
            , _sdc_received_at      
            , _sdc_sequence 
            , _sdc_batched_at   
            , _sdc_extracted_at 
 
        from {{ source('adventure_works','stateprovince') }}
    )
    
select * from source