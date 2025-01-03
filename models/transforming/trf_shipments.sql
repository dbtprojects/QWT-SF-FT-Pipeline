{{ config(materialized = 'table', schema = 'transforming') }}

select 
ss.orderid ,
ss.lineno,
ss.shipmentdate,
ss.status,
sh.companyname as shipmentcompnay_name
from
{{ref('shipments_snapshot')}} as ss inner join
{{ref('lkp_shippers')}} as sh 
on ss.shipperid = sh.shipperid
where ss.dbt_valid_to is null