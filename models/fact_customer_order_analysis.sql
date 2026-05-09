{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
) }}

with lineitem as (
    select * from {{ ref('lineitem') }}
),

orders as (
    select * from {{ ref('orders') }}
),

customer as (
    select * from {{ ref('customer') }}
),

supplier as (
    select * from {{ ref('supplier') }}
),

part as (
    select * from {{ ref('part') }}
),

partsupp as (
    select * from {{ ref('partsupp') }}
),

nation as (
    select * from {{ ref('nation') }}
),

region as (
    select * from {{ ref('region') }}
)

select
    l.order_key,
    l.part_key,
    l.supp_key,
    l.line_number,
    l.quantity,
    l.extended_price,
    l.discount,
    l.tax,
    l.return_flag,
    l.line_status,
    l.ship_date,
    l.commit_date,
    l.receipt_date,
    l.ship_instruct,
    l.ship_mode,

    o.order_date,
    o.order_status,
    o.total_price,
    o.order_priority,
    o.clerk,
    o.ship_priority,

    c.cust_key,
    c.cust_name,
    c.cust_mktsegment,

    s.supp_name,
    s.supp_address,
    s.supp_phone,
    s.account_balance as supp_acctbal,

    p.part_name,
    p.brand,
    p.type,
    p.size,
    p.container,
    p.retail_price,

    ps.avail_qty,
    ps.supply_cost,

    n.nation_name as customer_nation,
    r.region_name as customer_region

from lineitem l
join orders o   on l.order_key = o.order_key
join customer c on o.cust_key = c.cust_key
join supplier s on l.supp_key = s.supp_key
join part p     on l.part_key = p.part_key
join partsupp ps on l.part_key = ps.part_key and l.supp_key = ps.supp_key
join nation n   on c.cust_nationkey = n.nation_key
join region r   on n.region_key = r.region_key
