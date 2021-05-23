with
    source as (
        select 
            /*Primary key*/
            specialofferid	

            , type		
            , category		
            , discountpct	
            , minqty		
            , maxqty		
            , startdate		
            , enddate	
            , description
            , modifieddate	
            , rowguid	

             /* Stich columns*/ 
            , _sdc_received_at	
            , _sdc_sequence		
            , _sdc_batched_at		
            , _sdc_extracted_at		
            , _sdc_table_version		

        from {{ source('adventure_works','specialoffer') }}
    )
    
select * from source