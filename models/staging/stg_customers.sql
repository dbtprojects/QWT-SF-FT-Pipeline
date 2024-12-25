{{ config(materialized = 'table') }}

select * 
from 
{{ source('QWT_RAW', 'customers')}}