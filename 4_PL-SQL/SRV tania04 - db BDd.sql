SET SERVEROUTPUT ON SIZE 1000000;

CREATE OR REPLACE PROCEDURE pr_empleados_tlf
(p_Telefono VARCHAR2,  p_Nombre OUT VARCHAR2, p_DNI OUT VARCHAR2)
IS
BEGIN
SELECT NOMBRE,DNI INTO p_Nombre,p_DNI
FROM TELÉFONOS NATURAL JOIN EMPLEADOS
WHERE TELÉFONO = p_Telefono;
DBMS_OUTPUT.put_line('El empleado con el teléfono '||p_Telefono||' es: '||p_Nombre||', con DNI: '||p_DNI);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.put_line('No se encontró el empleado con el teléfono ' || p_Telefono);
WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.put_line('Hay más de un empleado con el teléfono ' || p_Telefono);
END;
/
DECLARE
v_telefono TELÉFONOS.TELÉFONO%TYPE:='666666666';
v_nombre empleados.nombre%TYPE;
v_dni empleados.dni%TYPE;
BEGIN
pr_empleados_tlf(v_telefono,v_nombre, v_dni);
END;
/
DECLARE
v_telefono TELÉFONOS.TELÉFONO%TYPE:='611111111';
v_nombre empleados.nombre%TYPE;
v_dni empleados.dni%TYPE;
BEGIN
pr_empleados_tlf(v_telefono,v_nombre, v_dni);
END;
/
DECLARE
v_telefono TELÉFONOS.TELÉFONO%TYPE:='913333333';
v_nombre empleados.nombre%TYPE;
v_dni empleados.dni%TYPE;
BEGIN
pr_empleados_tlf(v_telefono,v_nombre, v_dni);
END;
/

CREATE OR REPLACE PROCEDURE pr_comprobar_poblaciones
IS
v_poblacion "Códigos postales".POBLACIÓN%TYPE;
BEGIN
SELECT POBLACIÓN INTO v_poblacion
FROM "Códigos postales"
GROUP BY POBLACIÓN
HAVING COUNT(*) >1;
DBMS_OUTPUT.put_line('A la población ' || v_poblacion||' no le corresponde siempre la misma provincia.');
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.put_line('No hay dos o más provincias que compartan la misma población.');
END;
/
BEGIN
pr_comprobar_poblaciones();
END;
/
INSERT INTO "Códigos postales" VALUES('41008','Arganda','Sevilla');
/
BEGIN
pr_comprobar_poblaciones();
END;
/
DELETE FROM "Códigos postales" 
WHERE "Código postal" = '41008';




DECLARE
v_nombre localidades.nombre%TYPE;
v_total localidades.población%TYPE;
CURSOR c_provincias IS
SELECT P.nombre, SUM(L.población) AS total_población
FROM localidades L INNER JOIN provincias P
ON L.provincia = P.nombre
GROUP BY P.nombre;
CREATE OR REPLACE PROCEDURE pr_empleados_CP
IS

BEGIN
SELECT POBLACIÓN INTO v_poblacion
FROM "Códigos postales"
GROUP BY POBLACIÓN
HAVING COUNT(*) >1;
DBMS_OUTPUT.put_line('A la población ' || v_poblacion||' no le corresponde siempre la misma provincia.');
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.put_line('No hay dos o más provincias que compartan la misma población.');
END;

