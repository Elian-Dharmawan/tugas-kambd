Kelompok: Felix Hernanta Wijaya / 71190416 Mishael Elian Dharmawan / 71190441 #nomor 1
conn / as sysdba #nomor 2
grant DBA to DBSEC;

#nomor 3 create user VPD_CLERK1 identified by Jessie#22;

grant create session to VPD_CLERK1;

grant create table to VPD_CLERK1;

#nomor 4
conn DBSEC / secc $ 1new #nomor 5
CREATE TABLE CUSTOMER (
    SALES_REP_ID NUMBER(4) NULL,
    CUSTOMER_ID NUMBER(8) NOT NULL,
    CUSTOMER_SSN VARCHAR2(9) NULL,
    FIRST_NAME VARCHAR2(20) NULL,
    LAST_NAME VARCHAR2(20) NULL,
    ADDR_LINE VARCHAR2(80) NULL,
    CITY VARCHAR2(30) NULL,
    STATE VARCHAR2(30) NULL,
    ZIP_CODE VARCHAR2(9) NULL,
    PHONE VARCHAR2(15) NULL,
    EMAIL VARCHAR2(80) NULL,
    CC_NUMBER VARCHAR2(20) NULL,
    CREDIT_LIMIT NUMBER NULL,
    GENDER CHAR(1) NULL,
    STATUS CHAR(1) NULL,
    COMMENTS VARCHAR2(1024) NULL,
    CTL_UPD_DTTM DATE NULL,
    CTL_UPD_USER VARCHAR2(30) NULL,
    CTL_REC_STAT CHAR(1) NULL,
    PRIMARY KEY(CUSTOMER_ID)
);

#nomer 6
#nomor 7
select
    CTL_UPD_USER,
    count(CTL_UPD_USER) as total_user
from
    customer
group by
    CTL_UPD_USER;

#nomor 8 conn / as sysdba;

grant select,insert,update,delete on DBSEC.customer to VPD_CLERK1;

#BINGUNG alter system set audit_trail=NONE scope=spfile;

shutdown immediate startup create table DBSEC_dbms(
    owner VARCHAR2(30),
    table_name VARCHAR2(30),
    policy_name VARCHAR2(30)
) create
or replace procedure DBSEC_ROW_OWNER_FUNCTION (sname VARCHAR2, tname VARCHAR2, pname VARCHAR2) is pragma autonomus_transaction;

begin
insert into
    DBSEC_dbms(owner, table_name, policy_name)
values
    (sname, tname, pname);

commit;

end;