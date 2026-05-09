with customer as (
select C_CUSTKEY as Cust_Key, 
C_NAME as Cust_Name,
C_ADDRESS as Cust_addrress,
C_NATIONKEY as Cust_NataionKey,
C_PHONE as Cust_Phone,
C_ACCTBAL as Cust_Account_Balance,
C_MKTSEGMENT as Cust_Mktsegment,
C_COMMENT  as Cust_Comment
) 

select * from customer