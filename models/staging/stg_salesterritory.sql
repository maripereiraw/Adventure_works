with
    source as (
        select *	
 
        from {{ source('adventure_works','salesterritory') }}
    )
 
select * from source