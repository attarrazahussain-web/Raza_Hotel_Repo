{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
) }}

with part as (

    select
        P_PARTKEY     as part_key,
        P_NAME        as part_name,
        P_MFGR        as manufacturer,
        P_BRAND       as brand,
        P_TYPE        as type,
        P_SIZE        as size,
        P_CONTAINER   as container,
        P_RETAILPRICE as retail_price,
        P_COMMENT     as comment
    from {{ source('snowflake_sample_data', 'part') }}

)

select * from part
