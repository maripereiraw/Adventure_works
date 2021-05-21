with
    source as (
        select 
            specialofferid		
            , startdate		
            , maxqty		
            , modifieddate	
            , rowguid	
            , type		
            , discountpct	
            , category		
            , description
            , minqty		
            , enddate	

            , _sdc_received_at	
            , _sdc_sequence		
            , _sdc_batched_at		
            , _sdc_extracted_at		
            , _sdc_table_version		

        from {{ source('adventure_works','specialoffer') }}
    )
    
select * from source