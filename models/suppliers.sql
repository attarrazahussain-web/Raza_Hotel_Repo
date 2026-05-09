{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
) }}

with supplier as (

    select
        S_SUPPKEY   as supp_key,
        S_NAME      as supp_name,
        S_ADDRESS   as supp_address,
        S_NATIONKEY as nation_key,
        S_PHONE     as supp_phone,
        S_ACCTBAL   as account_balance,
        S_COMMENT   as comment
    from {{ source('snowflake_sample_data', 'supplier') }}

)

select * from supplier
