{{ config(
    materialized='table',
    snowflake_warehouse='PC_DBT_WH'
)}}
with customer as (
select C_CUSTKEY as cust_key, 
C_NAME as cust_name,
C_ADDRESS as cust_addrress,
C_NATIONKEY as cust_nationkey
C_PHONE as cust_Phone,
C_ACCTBAL as cust_account_balance,
C_MKTSEGMENT as cust_mktsegment,
C_COMMENT  as cust_Comment
from {{ source('snowflake_sample_data','customer')}}
) 

select * from customer