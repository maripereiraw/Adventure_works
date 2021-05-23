with
    source as (
        select 
            /*Primary key*/        
            productid		

             /*Foreing key*/ 
            , productmodelid	
            , productsubcategoryid

            , name		
            , class	
            , color	
            , productnumber		
            , safetystocklevel	
            , sellenddate		
            , daystomanufacture		
            , sellstartdate		
            , weight	
            , size	
            , listprice	
            , sizeunitmeasurecode	
            , style
            , standardcost		
            , weightunitmeasurecode	
            , reorderpoint	
            , makeflag	
            , productline		
            , finishedgoodsflag	
            , rowguid	
            , modifieddate	

             /* Stich columns*/ 
            , _sdc_table_version	
            , _sdc_received_at	
            , _sdc_sequence	
            , __sdc_primary_key		
            , _sdc_batched_at		
            , _sdc_extracted_at	
 
        from {{ source('adventure_works','p') }}
    )
    
select * from source