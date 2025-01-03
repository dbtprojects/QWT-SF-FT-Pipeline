{{ config(materialized = 'view', schema = 'reporting')}}

select 
c.companyname,
c.contactname,
min(o.orderdate) as first_order_date,
max(o.orderdate) as recent_order_date,
count(p.productid) as number_of_products,
sum(o.quantity) as total_quanity,
sum(o.linesalesamount) as total_sales,
avg(o.margin) as avg_margin
from
{{ref('dim_customers')}} as c left join {{ref('fct_orders')}} as o on c.customerid = o.customerid
left join {{ref('dim_products')}} as p on o.productid = p.productid
group by c.companyname,c.contactname
having first_order_date is not null
order by total_sales desc
