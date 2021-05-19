with
    source as (
        select 
            loginid     
            , businessentityid      
            
            , nationalidnumber  
            , sickleavehours        
            , currentflag       
            , modifieddate      
            , rowguid   
            , gender        
            , hiredate      
            , salariedflag      
            , birthdate     
            , maritalstatus     
            , organizationnode      
            , vacationhours     
            , jobtitle      
 
            , _sdc_table_version    
            , _sdc_received_at      
            , _sdc_sequence     
            , _sdc_batched_at   
            , _sdc_extracted_at     
 
        from {{ source('adventure_works','employee') }}
    )
    
select * from source