{{ config(materialized = 'table') }}

select 
order_id as orderid,
line_no as lineno,
shipper_id as shipperid,
customer_id as customerid,
product_id as productid,
employee_id as employeeid,
shipment_date as shipmentdate,
status
from
{{source('QWT_RAW', 'shipments')}}