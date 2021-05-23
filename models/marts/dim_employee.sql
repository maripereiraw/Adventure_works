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
 
            st.salespersonid  
            , st.name   

            , em.loginid      
            , em.businessentityid       
            , em.jobtitle       
            , em.nationalidnumber   
            , em.gender     
            , em.birthdate      
            , em.sickleavehours     
            , em.maritalstatus      
            , em.hiredate       
            , em.organizationnode       
            , em.currentflag                
            , em.salariedflag       
            , em.vacationhours              
            
            from em
            left join st on em.businessentityid = st.businessentityid
    )
    , transformed as (
        select 
            row_number () over (order by salespersonid  ) as salesperson_sk
            , *
        from fim_employee
    )
    
select * from transformed