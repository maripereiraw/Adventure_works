with
    st as (
        select *
            from {{ ref('stg_salesterritory') }} as st
    )
 
    , fim_territory as (
        select
            st.territoryid		
            , st.group		
            , st.countryregioncode			
            , st.saleslastyear		
            , st.name as territoryname	
            , st.costytd	
            , st.costlastyear	
            , st.salesytd	

            from st
    )
    select * from fim_territory
