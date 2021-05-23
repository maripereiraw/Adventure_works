with
    source as (
        select 
            /*Primary key*/
            purchaseorderdetailid

             /*Foreing key*/        
            , purchaseorderid       
            , productid 
            
            , orderqty      
            , receivedqty       
            , rejectedqty       
            , unitprice     
            , duedate
            , modifieddate      

             /* Stich columns*/  
            , _sdc_table_version
            , _sdc_batched_at   
            , _sdc_sequence 
            , _sdc_received_at      
            , _sdc_extracted_at 
 
        from {{ source('adventure_works','purchaseorderdetail') }}
    )
select * from source