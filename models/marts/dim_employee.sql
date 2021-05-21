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

            
            from em
            left join sp on em.businessentityid = sp.businessentityid   
            left join st on em.businessentityid = st.businessentityid
    )
 
select * from fim_employee