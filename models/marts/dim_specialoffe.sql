with
    so as (
        select *
            from {{ ref('stg_specialoffer') }} as st
    )
 
    , fim_offer as (
        select
            specialofferid		
            , startdate		
            , maxqty		
            , modifieddate		
            , type		
            , discountpct	
            , category		
            , description
            , minqty		
            , enddate	

            from so
    )
 
select * from fim_offer
