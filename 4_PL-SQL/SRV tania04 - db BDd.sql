SET SERVEROUTPUT ON SIZE 1000000;

CREATE OR REPLACE PROCEDURE pr_empleados_tlf
(p_Telefono VARCHAR2,  p_Nombre OUT VARCHAR2, p_DNI OUT VARCHAR2)
IS
BEGIN
SELECT NOMBRE,DNI INTO p_Nombre,p_DNI
FROM TEL�FONOS NATURAL JOIN EMPLEADOS
WHERE TEL�FONO = p_Telefono;
DBMS_OUTPUT.put_line('El empleado con el tel�fono '||p_Telefono||' es: '||p_Nombre||', con DNI: '||p_DNI);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.put_line('No se encontr� el empleado con el tel�fono ' || p_Telefono);
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.put_line('Hay m�s de un empleado con el tel�fono ' || p_Telefono);
END;
/
DECLARE
v_telefono TEL�FONOS.TEL�FONO%TYPE:='666666666';
v_nombre empleados.nombre%TYPE;
v_dni empleados.dni%TYPE;
BEGIN
pr_empleados_tlf(v_telefono,v_nombre, v_dni);
END;
/
DECLARE
v_telefono TEL�FONOS.TEL�FONO%TYPE:='611111111';
v_nombre empleados.nombre%TYPE;
v_dni empleados.dni%TYPE;
BEGIN
pr_empleados_tlf(v_telefono,v_nombre, v_dni);
END;
/
DECLARE
v_telefono TEL�FONOS.TEL�FONO%TYPE:='913333333';
v_nombre empleados.nombre%TYPE;
v_dni empleados.dni%TYPE;
BEGIN
pr_empleados_tlf(v_telefono,v_nombre, v_dni);
END;
/

CREATE OR REPLACE PROCEDURE pr_comprobar_poblaciones
IS
v_poblacion "C�digos postales".POBLACI�N%TYPE;
BEGIN
SELECT POBLACI�N INTO v_poblacion
FROM "C�digos postales"
GROUP BY POBLACI�N
HAVING COUNT(*) >1;
DBMS_OUTPUT.put_line('A la poblaci�n ' || v_poblacion||' no le corresponde siempre la misma provincia.');
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.put_line('No hay dos o m�s provincias que compartan la misma poblaci�n.');
END;
/
BEGIN
pr_comprobar_poblaciones();
END;
/
INSERT INTO "C�digos postales" VALUES('41008','Arganda','Sevilla');
/
BEGIN
pr_comprobar_poblaciones();
END;
/
DELETE FROM "C�digos postales" 
WHERE "C�digo postal" = '41008';




DECLARE
v_nombre localidades.nombre%TYPE;
v_total localidades.poblaci�n%TYPE;
CURSOR c_provincias IS
SELECT P.nombre, SUM(L.poblaci�n) AS total_poblaci�n
FROM localidades L INNER JOIN provincias P
ON L.provincia = P.nombre
GROUP BY P.nombre;
CREATE OR REPLACE PROCEDURE pr_empleados_CP
IS

BEGIN
SELECT POBLACI�N INTO v_poblacion
FROM "C�digos postales"
GROUP BY POBLACI�N
HAVING COUNT(*) >1;
DBMS_OUTPUT.put_line('A la poblaci�n ' || v_poblacion||' no le corresponde siempre la misma provincia.');
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.put_line('No hay dos o m�s provincias que compartan la misma poblaci�n.');
END;

