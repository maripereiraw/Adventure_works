with
    source as (
        select 
            /*Primary key*/
            salesorderdetailid

            /*Foreing key*/       
            , salesorderid      
            , specialofferid    
            , productid 
 
            , orderqty      
            , unitprice     
            , unitpricediscount     
            , carriertrackingnumber     
            , modifieddate      
            , rowguid       

             /* Stich columns*/  
            , _sdc_table_version        
            , _sdc_received_at      
            , _sdc_sequence     
            , _sdc_batched_at   
            , _sdc_extracted_at 
            
        from {{ source('adventure_works','salesorderdetail') }}
    )
    
select * from source