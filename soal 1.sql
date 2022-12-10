Kelompok: Felix Hernanta Wijaya / 71190416 Mishael Elian Dharmawan / 71190441 sqlplus / as sysdba CREATE USER DBSEC IDENTIFIED BY secc $ 1new;

grant create table to DBSEC;

grant create view to DBSEC;

grant create session to DBSEC;

conn DBSEC/secc$1new;

CREATE TABLE PELANGGAN (
    LOKASI_ID NUMBER(4) NULL,
    PELANGGAN_ID NUMBER(8) NOT NULL,
    NAMA_LENGKAP VARCHAR2(100) NULL,
    KOTA VARCHAR2(30) NULL,
    PROPINSI VARCHAR2(30) NULL,
    EMAIL VARCHAR2(80) NULL,
    GENDER CHAR(1) NULL,
    STATUS CHAR(1) NULL,
    USERNAME VARCHAR2(30),
    PRIMARY KEY(PELANGGAN_ID)
);

INSERT INTO
    PELANGGAN (
        LOKASI_ID,
        PELANGGAN_ID,
        NAMA_LENGKAP,
        KOTA,
        PROPINSI,
        EMAIL,
        GENDER,
        STATUS,
        USERNAME
    )
VALUES
    (
        6415,
        401554,
        'Carie Spooner',
        'Hodge',
        'GA',
        'CSpooner@wzzryyiptkhrfah.edu',
        'F',
        'I',
        'CarieSpooner'
    );

INSERT INTO
    PELANGGAN (
        LOKASI_ID,
        PELANGGAN_ID,
        NAMA_LENGKAP,
        KOTA,
        PROPINSI,
        EMAIL,
        GENDER,
        STATUS,
        USERNAME
    )
VALUES
    (
        2336,
        401563,
        'Lance Lindeman',
        'Baldwin Lake',
        'NM',
        'LLindeman@holzwfnlcnrquhg.edu',
        'F',
        'I',
        'LanceLindeman'
    );

INSERT INTO
    PELANGGAN (
        LOKASI_ID,
        PELANGGAN_ID,
        NAMA_LENGKAP,
        KOTA,
        PROPINSI,
        EMAIL,
        GENDER,
        STATUS,
        USERNAME
    )
VALUES
    (
        7719,
        401572,
        'Margit Fulkerson',
        'Del Rosa',
        'OH',
        'MFulkerson@lmlfbnhwjaqqwva.edu',
        'F',
        NULL,
        'MargitFulkerson'
    );

INSERT INTO
    PELANGGAN (
        LOKASI_ID,
        PELANGGAN_ID,
        NAMA_LENGKAP,
        KOTA,
        PROPINSI,
        EMAIL,
        GENDER,
        STATUS,
        USERNAME
    )
VALUES
    (
        9644,
        901574,
        'Jan Busse',
        'Victorville',
        'MS',
        'JBusse@jwfzwrjymqitgom.mil',
        'F',
        'I',
        'JanBusse'
    );

INSERT INTO
    PELANGGAN (
        LOKASI_ID,
        PELANGGAN_ID,
        NAMA_LENGKAP,
        KOTA,
        PROPINSI,
        EMAIL,
        GENDER,
        STATUS,
        USERNAME
    )
VALUES
    (
        6415,
        201595,
        'Charlene Keeton',
        'Rainbow Wells',
        'NC',
        'CKeeton@kxqrzpvxdtzicta.gov',
        'F',
        'I',
        'CharleneKeeton'
    );

create or replace view pelanggan_login(LOKASI_ID, PELANGGAN_ID
, NAMA_LENGKAP, KOTA, PROPINSI, EMAIL, GENDER, STATUS
, USERNAME) as 
	select
	    LOKASI_ID,
	    PELANGGAN_ID,
	    NAMA_LENGKAP,
	    KOTA,
	    PROPINSI,
	    EMAIL,
	    GENDER,
	    STATUS,
	    USERNAME
	from
	    pelanggan
	where
	    USERNAME =(
	        select
	            SYS_CONTEXT(
	                ')
		        from
		            dual
		    )
; 

conn / as sysdba create user DBSEC_CLERK identified by tec5363clerk;

grant select,insert on DBSEC.pelanggan_login to DBSEC_CLERK;

grant create session to DBSEC_CLERK;

conn DBSEC_CLERK/tec5363clerk;

INSERT INTO
    DBSEC.pelanggan_login (
        LOKASI_ID,
        PELANGGAN_ID,
        NAMA_LENGKAP,
        KOTA,
        PROPINSI,
        EMAIL,
        GENDER,
        STATUS,
        USERNAME
    )
VALUES
    (
        7415,
        901340,
        'Joe Cat',
        'Champaign',
        'IL',
        'JCat@catu.edu',
        'M',
        'A',
        (
            select
                SYS_CONTEXT('USERENV', 'SESSION_USER')
            from
                dual
        )
    );

select
    *
from
    DBSEC.pelanggan_login
where
    USERNAME =(
        select
            SYS_CONTEXT('USERENV', 'SESSION_USER')
        from
            dual
    );