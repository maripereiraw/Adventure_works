with
    so as (
        select *
            from {{ ref('stg_specialoffer') }} as st
    )
 
    , fim_offer as (
        select
            specialofferid	
            , type		
            , category		
            , discountpct	
            , minqty		
            , maxqty		
            , startdate		
            , enddate	
            , description

            from so
    )
    , transformed as (
        select 
            row_number () over (order by specialofferid) as specialoffer_sk
            , *
        from fim_offer
    )   
select * from transformed 