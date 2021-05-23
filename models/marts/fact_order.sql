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
    , salesreason as (
        select *
        from {{ ref('dim_salesreason')}}
    )
    , shippers as (
        select *
        from {{ ref('dim_shipper')}}
    )
    , territorys as (
        select *
        from {{ ref('dim_territory')}}
    )
    , offer as (
        select *
        from {{ ref('dim_specialoffe')}}
    )
    , sales_order_detail as (
        select 
            order_detail.salesorderdetailid     
            , offer.specialoffer_sk as specialoffer_fk  
            , products.product_sk as product_fk    
            , order_detail.orderqty     
            , order_detail.salesorderid     
            , order_detail.unitprice                
            , order_detail.carriertrackingnumber        
            , order_detail.unitpricediscount    
 
        from {{ ref('stg_salesorderdetail') }} as order_detail
        left join products on order_detail.productid = products.productid
        left join offer on order_detail.specialofferid  = offer.specialofferid 
    )
    , sales_orders as (
        select 
            orders.salesorderid
            , shippers.shipmethod_sk as shipmethod_fk    
            , employees.salesperson_sk as salesperson_fk
            , territorys.territory_sk  as territory_fk    
            , customers.customer_sk as customer_fk 
            , orders.creditcardid	
            , orders.currencyrateid
            , orders.shiptoaddressid	
            , orders.billtoaddressid	
            , salesreason.name_reason
            , orders.purchaseordernumber	
            , orders.subtotal_USD
            , orders.freight_USD	
            , orders.taxamt_USD	
            , orders.totaldue_USD
            , orders.orderdate
            , orders.subtotal
            , orders.taxamt	
            , orders.status
            , orders.revisionnumber
            , orders.freight	
            , orders.duedate
            , orders.totaldue
            , orders.shipdate
            , orders.accountnumber

            from {{ ref('dim_currencyrate') }} as orders
        left join customers on orders.customerid = customers.customerid 
        left join employees on orders.salespersonid = employees.salespersonid
        left join shippers on orders.shipmethodid = shippers.shipmethodid
        left join territorys on orders.territoryid = territorys.territoryid 
        left join salesreason on orders.salesorderid = salesreason.salesorderid
    )

    , final as (
        select 
            sales_order_detail.salesorderdetailid           
            , sales_order_detail.specialoffer_fk  
            , sales_order_detail.product_fk  
            , sales_order_detail.orderqty       
            , sales_order_detail.unitprice                  
            , sales_order_detail.unitpricediscount
            , sales_order_detail.carriertrackingnumber      

            , sales_orders.salesorderid
            , sales_orders.shipmethod_fk    
            , sales_orders.salesperson_fk
            , sales_orders.territory_fk    
            , sales_orders.customer_fk
            , sales_orders.name_reason 
            , sales_orders.creditcardid	
            , sales_orders.currencyrateid
            , sales_orders.shiptoaddressid	
            , sales_orders.billtoaddressid	
            , sales_orders.subtotal_USD
            , sales_orders.freight_USD	
            , sales_orders.taxamt_USD	
            , sales_orders.totaldue_USD
            , sales_orders.orderdate
            , sales_orders.subtotal
            , sales_orders.taxamt	
            , sales_orders.freight	
            , sales_orders.duedate
            , sales_orders.shipdate
            , sales_orders.totaldue
            , sales_orders.accountnumber
            , sales_orders.revisionnumber
            , sales_orders.purchaseordernumber	
            , sales_orders.status
 
            from sales_order_detail
            left join sales_orders on sales_order_detail.salesorderid = sales_orders.salesorderid
    )
 
select * from final
