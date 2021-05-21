with
    source as (
        select 
            productid	

            , productmodelid	
            , productsubcategoryid

            , sellenddate		
            , safetystocklevel	
            , finishedgoodsflag	
            , class	
            , makeflag	
            , productnumber		
            , reorderpoint	
            , modifieddate	
            , rowguid	
            , id	
            , weightunitmeasurecode	
            , standardcost		
            , name		
            , style
            , sizeunitmeasurecode	
            , listprice	
            , daystomanufacture		
            , productline		
            , size	
            , color	
            , sellstartdate		
            , weight	

            , _sdc_table_version	
            , _sdc_received_at	
            , _sdc_sequence	
            , __sdc_primary_key		
            , _sdc_batched_at		
            , _sdc_extracted_at	
 
        from {{ source('adventure_works','p') }}
    )
    
select * from source