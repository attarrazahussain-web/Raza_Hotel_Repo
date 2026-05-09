{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
) }}

with nation as (

    select
        N_NATIONKEY as nation_key,
        N_NAME      as nation_name,
        N_REGIONKEY as region_key,
        N_COMMENT   as comment
    from {{ source('snowflake_sample_data', 'nation') }}

)

select * from nation
