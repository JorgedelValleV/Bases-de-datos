SET AUTOCOMMIT OFF

CREATE TABLE cuentas (
numero number primary key,
 saldo number not null
 );
INSERT INTO cuentas VALUES (123, 400);
INSERT INTO cuentas VALUES (456, 300);
COMMIT;

-- 1
UPDATE cuentas SET saldo=saldo + 100 WHERE numero=123;
COMMIT;

-- 2
UPDATE cuentas SET saldo=saldo + 100 WHERE numero=123;
COMMIT;
select saldo from cuentas WHERE numero=123;
select saldo from cuentas WHERE numero=123;
-- 3
UPDATE cuentas SET saldo=saldo + 100 WHERE numero=123;
UPDATE cuentas SET saldo=saldo + 300 WHERE numero=456;
COMMIT;
-- 4
ALTER SESSION SET ISOLATION_LEVEL = SERIALIZABLE;
SELECT SUM(saldo) FROM cuentas;
SELECT SUM(saldo) FROM cuentas;
ALTER SESSION SET ISOLATION_LEVEL = READ COMMITTED;
SELECT SUM(saldo) FROM cuentas;
SELECT SUM(saldo) FROM cuentas;
-- 5
CREATE TABLE butacas(id number(8) primary key,
 evento varchar(30),
fila varchar(10),
columna varchar(10)) ;
CREATE TABLE reservas(id number(8) primary key,
 evento varchar(30),
 fila varchar(10),
 columna varchar(10)) ;
CREATE SEQUENCE Seq_Butacas INCREMENT BY 1 START WITH 1
NOMAXVALUE;
CREATE SEQUENCE Seq_Reservas INCREMENT BY 1 START WITH 1
NOMAXVALUE;

INSERT INTO butacas VALUES (Seq_Butacas.NEXTVAL,'Circo','1','1');
INSERT INTO butacas VALUES (Seq_Butacas.NEXTVAL,'Circo','1','2');
INSERT INTO butacas VALUES (Seq_Butacas.NEXTVAL,'Circo','1','3');
COMMIT;

@'C:\hlocal\MlC\script.sql'
@'C:\hlocal\MlC\script.sql'
@'C:\hlocal\MlC\script.sql'
@'C:\hlocal\MlC\script.sql'

@'C:\hlocal\MlC\script.sql'
