with
    customers as (
        select *
        from {{ref('dim_customer')}}
    )
    , employees as (
        select *
        from {{ ref('dim_employee')}}
    )
    , products as (
        select *
        from {{ ref('dim_product')}}
    )
    , shippers as (
        select *
        from {{ ref('dim_shipper')}}
    )
    , sales_order_detail as (
        select 
            order_detail.salesorderdetailid     
            , order_detail.salesorderid     
            , order_detail.specialofferid   
            , products.productid    
            , order_detail.orderqty     
            , order_detail.unitprice                
            , order_detail.carriertrackingnumber        
            , order_detail.unitpricediscount    
 
        from {{ ref('stg_salesorderdetail') }} as order_detail
        left join products on order_detail.productid = products.productid
    )
    , sales_orders as (
        select 
           orders.salesorderid  
            , shippers.shipmethodid     
            , orders.shiptoaddressid    
            , orders.currencyrateid
            , orders.billtoaddressid        
            , customers.creditcardid    
            , employees.salespersonid   
            , employees.territoryid     
            , customers.customerid  
 
            , orders.purchaseordernumber            
            , orders.taxamt      
            , orders.status 
            , orders.orderdate      
            , orders.subtotal   
            , orders.revisionnumber 
            , orders.freight        
            , orders.duedate        
            , orders.totaldue   
            , orders.shipdate   
            , orders.accountnumber
 
            from {{ ref('stg_salesorderheader') }} as orders
        left join customers on orders.customerid = customers.customerid 
        left join employees on orders.salespersonid = employees.salespersonid
        left join shippers on orders.shipmethodid = shippers.shipmethodid   
    )
    , final as (
        select 
            sales_order_detail.salesorderdetailid           
            , sales_order_detail.specialofferid 
            , sales_order_detail.productid  
            , sales_order_detail.orderqty       
            , sales_order_detail.unitprice                  
            , sales_order_detail.carriertrackingnumber      
            , sales_order_detail.unitpricediscount
 
            , sales_orders.salesorderid 
            , sales_orders.shipmethodid     
            , sales_orders.shiptoaddressid  
            , sales_orders.currencyrateid
            , sales_orders.billtoaddressid      
            , sales_orders.creditcardid 
            , sales_orders.salespersonid    
            , sales_orders.territoryid  
            , sales_orders.customerid   
            , sales_orders.purchaseordernumber          
            , sales_orders.taxamt        
            , sales_orders.status   
            , sales_orders.orderdate            
            , sales_orders.subtotal 
            , sales_orders.revisionnumber   
            , sales_orders.freight      
            , sales_orders.duedate      
            , sales_orders.totaldue 
            , sales_orders.shipdate 
            , sales_orders.accountnumber
 
            from sales_order_detail
            left join sales_orders on sales_order_detail.salesorderid = sales_orders.salesorderid
    )
 
select * from final
