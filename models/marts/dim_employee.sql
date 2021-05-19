with
    sp as (
        select *
            from {{ ref('stg_salesperson') }} as sp
    )
    , em as (
        select *
            from {{ ref('stg_employee') }} as em
    )
    , st as (
        select *
            from {{ ref('stg_store') }} as st
    )
    , ste as (
        select *
            from {{ ref('stg_salesterritory') }} as st
    )
    , stp as (
        select *
            from {{ ref('stg_stateprovince') }} as stp
    )

    , fim_employee as (
        select
 
            em.loginid      
            , em.businessentityid       
            , em.nationalidnumber   
            , em.sickleavehours     
            , em.currentflag                
            , em.gender     
            , em.hiredate       
            , em.salariedflag       
            , em.birthdate      
            , em.maritalstatus      
            , em.organizationnode       
            , em.vacationhours      
            , em.jobtitle       
 
            , sp.salesquota     
            , sp.saleslastyear      
            , sp.commissionpct  
            , sp.territoryid        
            , sp.salesytd
 
            , st.salespersonid  
            , st.name       
             
            , ste.group                   
            , ste.costytd            
            , ste.costlastyear            
            
            , stp.stateprovinceid       
            , stp.countryregioncode 
            , stp.t_name 
            , stp.isonlystateprovinceflag   
            , stp.stateprovincecode 
            
            from em
            left join sp on em.businessentityid = sp.businessentityid   
            left join st on em.businessentityid = st.businessentityid
            left join ste on sp.territoryid = ste.territoryid
            left join stp on ste.territoryid = stp.territoryid  
    )
 
select * from fim_employee