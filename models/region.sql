{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
) }}

with region as (

    select
        R_REGIONKEY as region_key,
        R_NAME      as region_name,
        R_COMMENT   as comment
    from {{ source('snowflake_sample_data', 'region') }}

)

select * from region
