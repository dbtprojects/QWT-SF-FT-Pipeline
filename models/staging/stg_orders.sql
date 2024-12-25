{{ config(materialized = 'incremental', unique_key = 'orderid') }}

select *
from 
{{source("QWT_RAW", 'orders')}}

{% if is_incremental() %}

where orderdate > (select max(orderdate) from {{this}} )

{% endif %}