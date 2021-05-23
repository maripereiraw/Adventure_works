with
    selected as (
        select 
            productid	
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
 
        from {{ ref('stg_product_p') }}
    )
    , transformed as (
        select 
            row_number () over (order by productid) as product_sk
            , *
        from selected
    )   
select * from transformed 