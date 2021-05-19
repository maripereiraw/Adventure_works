with
    source as (
        select 
            productid       
            , productmodelid    
            , productsubcategoryid      
             
            , safetystocklevel      
            , finishedgoodsflag     
            , class 
            , makeflag  
            , productnumber     
            , reorderpoint      
            , modifieddate  
            , rowguid       
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
            , _sdc_batched_at   
            , _sdc_extracted_at 
 
        from {{ source('adventure_works','product') }}
    )
    
select * from source