with
    source as (
        select 
            salesreasonid		
            , name	as name_reason			
            , reasontype
 
        from {{ source('adventure_works','salesreason') }}
    )
    
select * from source