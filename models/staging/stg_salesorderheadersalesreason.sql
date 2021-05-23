with
    source as (
        select 
            salesreasonid			
            , salesorderid	
            
        from {{ source('adventure_works','salesorderheadersalesreason') }}
    )
    
select * from source