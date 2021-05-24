with
    source as (
        select 
         /*Primary key*/
            currencyrateid	
           
            , tocurrencycode		
            , endofdayrate         
            , averagerate	
            , currencyratedate
            , fromcurrencycode		
            , modifieddate				

         /* Stich columns*/               
            , _sdc_batched_at       
            , _sdc_received_at      
            , _sdc_sequence 
            , _sdc_table_version        
            , _sdc_extracted_at   


        from {{ source('adventure_works','currencyrate') }}
    )
    
select * from source
