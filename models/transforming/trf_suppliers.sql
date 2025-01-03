{{config(materialized = 'table', schema = 'transforming')}}

select 
GET(XMLGET(supplierinfo, 'SupplierID'), '$') as Supplierid,
GET(XMLGET(supplierinfo, 'CompanyName'), '$')::varchar as companyname,
GET(XMLGET(supplierinfo, 'ContactName'), '$')::varchar as contactname,
GET(XMLGET(supplierinfo, 'Address'), '$')::varchar as address,
GET(XMLGET(supplierinfo, 'City'), '$')::varchar as city,
GET(XMLGET(supplierinfo, 'PostalCode'), '$')::varchar as postalcode,
GET(XMLGET(supplierinfo, 'Country'), '$')::varchar as country,
GET(XMLGET(supplierinfo, 'Phone'), '$')::varchar as phone,
GET(XMLGET(supplierinfo, 'Fax'), '$')::varchar as fax

from {{ref('stg_suppliers')}}