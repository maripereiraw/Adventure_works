with
    source as (
        select 
            /*Primary key*/
            loginid    

              /*Foreing key*/            
            , businessentityid      
            
            , jobtitle    
            , nationalidnumber  
            , gender        
            , birthdate     
            , maritalstatus     
            , hiredate      
            , organizationnode      
            , currentflag       
            , salariedflag      
            , vacationhours     
            , sickleavehours        
            , rowguid   
            , modifieddate      

            /* Stich columns*/ 
            , _sdc_table_version    
            , _sdc_received_at      
            , _sdc_sequence     
            , _sdc_batched_at   
            , _sdc_extracted_at     
 
        from {{ source('adventure_works','employee') }}
    )
    
select * from source