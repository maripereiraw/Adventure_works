with
    source as (
        select 
            salesorderdetailid      
            , salesorderid      
            , specialofferid    
            , productid 
 
            , orderqty      
            , unitprice     
            , modifieddate      
            , rowguid       
            , carriertrackingnumber     
            , unitpricediscount     
 
            , _sdc_table_version        
            , _sdc_received_at      
            , _sdc_sequence     
            , _sdc_batched_at   
            , _sdc_extracted_at 
            
        from {{ source('adventure_works','salesorderdetail') }}
    )
    
select * from source