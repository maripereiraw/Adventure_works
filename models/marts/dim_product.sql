with
    selected as (
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
 
        from {{ ref('stg_product_p') }}
    )
 
select * from selected