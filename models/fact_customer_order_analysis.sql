{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
) }}

with lineitem as (
    select * from {{ ref('lineitem') }}
),
orders as (
    select * from HOTEL_DB.DBT_DEV.orders
),
customer as (
    select * from HOTEL_DB.DBT_DEV.customer
)

select
    l.order_key,          -- unique order identifier
    l.line_number,        -- line item number within the order
    o.order_date,         -- when the order was placed
    c.cust_name,          -- customer name
    l.extended_price      -- revenue for this line item
from lineitem l
join orders o   on l.order_key = o.order_key
join customer c on o.cust_key = c.cust_key
