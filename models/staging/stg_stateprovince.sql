with
    source as (
        select 
            /*Primary key*/
            stateprovinceid   

            /*Foreing key*/       
            , territoryid

            , name as t_name
            , countryregioncode     
            , stateprovincecode 
            , isonlystateprovinceflag
            , modifieddate      
            , rowguid

             /* Stich columns*/            
            , _sdc_table_version    
            , _sdc_received_at      
            , _sdc_sequence 
            , _sdc_batched_at   
            , _sdc_extracted_at 
 
        from {{ source('adventure_works','stateprovince') }}
    )
    
select * from source