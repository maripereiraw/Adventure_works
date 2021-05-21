with
    st as (
        select *
            from {{ ref('stg_salesterritory') }} as st
    )
 
    , fim_territory as (
        select
            st.territoryid 
            , st.group              
            , st.saleslastyear      
            , st.costytd            
            , st.costlastyear       
            , st.salesytd       
            
            from st
    )
 
select * from fim_territory
