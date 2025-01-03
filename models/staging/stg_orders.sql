{{ config(materialized = 'incremental', unique_key = 'orderid') }}

select 
order_id as orderid,
order_date as orderdate,
customer_id as customerid,
employee_id as employeeid,
shipper_id as shipperid,
freight,

from 
{{source("QWT_RAW", 'orders')}}

{% if is_incremental() %}

where orderdate > (select max(orderdate) from {{this}} )

{% endif %}