{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
) }}
with lineitem as (
    select * from HOTEL_DB.DBT_DEV.lineitem
),
orders as (
    select * from HOTEL_DB.DBT_DEV.orders
),
customer as (
    select * from HOTEL_DB.DBT_DEV.customer
),
supplier as (
    select * from HOTEL_DB.DBT_DEV.supplier
),
part as (
    select * from HOTEL_DB.DBT_DEV.part
),
partsupp as (
    select * from HOTEL_DB.DBT_DEV.partsupp
),
nation as (
    select * from HOTEL_DB.DBT_DEV.nation
),
region as (
    select * from HOTEL_DB.DBT_DEV.region
)

select
    -- lineitem columns
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

    -- orders columns
    o.cust_key,
    o.order_status,
    o.total_price,
    o.order_date,
    o.order_priority,
    o.clerk,
    o.ship_priority,

    -- customer columns
    c.cust_name,
    c.cust_addrress,
    c.cust_nataionkey,
    c.cust_phone,
    c.cust_account_balance,
    c.cust_mktsegment,
    c.cust_comment,

    -- supplier columns
    s.supp_name,
    s.supp_address,
    s.nation_key as supp_nationkey,
    s.supp_phone,
    s.account_balance,
    s.comment as supp_comment,

    -- part columns
    p.part_key,
    p.part_name,
    p.brand,
    p.type,
    p.size,
    p.container,
    p.retail_price,
    p.comment as part_comment,

    -- partsupp columns
    ps.avail_qty,
    ps.supply_cost,
    ps.comment as partsupp_comment,

    -- nation columns
    n.nation_key,
    n.nation_name,
    n.comment as nation_comment,

    -- region columns
    r.region_key,
    r.region_name,
    r.comment as region_comment

from lineitem l
join orders o     on l.order_key = o.order_key
join customer c   on o.cust_key = c.cust_key
join supplier s   on l.supp_key = s.supp_key
join part p       on l.part_key = p.part_key
join partsupp ps  on l.part_key = ps.part_key and l.supp_key = ps.supp_key
join nation n     on c.cust_nataionkey = n.nation_key
join region r     on n.region_key = r.region_key