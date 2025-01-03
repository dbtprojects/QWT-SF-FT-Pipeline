{{ config(materialized = 'table', schema = 'transforming') }}

select 

p.productid,
p.productname, 
s.companyname as suppliercompanyname,
s.contactname as suppliercontactname,
s.city as suppliercity,
s.country as suppliercountry,
c.categoryname,
p.quantityperunit,
p.unitcost,
p.unitprice,
(p.unitprice - p.unitcost) as porfit,
p.unitsinstock,
p.unitsonorder,
IFF(p.unitsinstock>p.unitsonorder, 'Yes', 'No') as productavailability

from 

{{ref('stg_products')}} as p left join {{ref('lkp_categories')}} as c

on p.categoryid = c.categoryid left join {{ref('trf_suppliers')}} as s

on p.supplierid = s.supplierid