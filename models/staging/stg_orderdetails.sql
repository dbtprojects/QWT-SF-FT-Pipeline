{{ config(materialized = 'incremental', unique_key = ['orderid', 'lineno']) }}

select 
od.order_id as orderid,
od.line_no as lineno,
product_id as productid,
quantity,
unit_price as unitprice,
discount,
o.order_date
from 
{{source("QWT_RAW", "orders")}} as o inner join {{source("QWT_RAW", "orderdetails")}} as od 
on o.order_id = od.order_id

{% if is_incremental() %}

where o.order_date > (select max(orderdate)  from {{this}} )

{% endif %}