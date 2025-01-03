{{ config(materialized = 'table') }}

select 
customer_id as customerid,
company_name as companyname,
contact_name as contactname,
city,
country,
division_id as divisionid,
address,
fax,
phone,
postal_code as postalcode,
state_province as stateprovince
from 
{{ source('QWT_RAW', 'customers')}}