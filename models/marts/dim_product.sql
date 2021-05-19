with
    selected as (
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
 
        from {{ ref('stg_product') }}
    )
 
select * from selected