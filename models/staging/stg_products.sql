{{ config(materialized = 'table', sort = 'productid') }}

select * 
from
{{source("QWT_RAW", 'products')}}