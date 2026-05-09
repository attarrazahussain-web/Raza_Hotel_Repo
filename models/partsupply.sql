{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
) }}

with partsupp as (

    select
        PS_PARTKEY    as part_key,
        PS_SUPPKEY    as supp_key,
        PS_AVAILQTY   as avail_qty,
        PS_SUPPLYCOST as supply_cost,
        PS_COMMENT    as comment
    from {{ source('snowflake_sample_data', 'partsupp') }}

)

select * from partsupp
