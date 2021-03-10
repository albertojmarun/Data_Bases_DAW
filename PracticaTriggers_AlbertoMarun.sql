/*
    * Alberto Jose Marun Indriago
    * March 10, 2021.
    * Tarea Triggers
*/  

/* 
Crea una tabla que denominaremos ALUMNOS_LOG
que contenga un campo denominado acción de tipo VARCHAR2(50) y un campo fecha
Crea los siguientes triggers:
*/

CREATE TABLE ALUMNOS_LOG (
    ACCION VARCHAR2(50),
    FECHA DATE
);

/* Pregunta 1 
Cuando se inserte un registro en la tabla alumnos
debe de guardarse un registro en la tabla log 
en acción pondrá INSERT y la fecha
*/

CREATE OR REPLACE TRIGGER alummnos_login AFTER INSERT ON ALUMNOS
    DECLARE
    
    BEGIN
        INSERT INTO ALUMNOS_LOG VALUES ('INSERT', SYSDATE);
END;        

-- PRUEBA 1
-- INSERT INTO ALUMNOS VALUES ('12345678K', 'LEONEL', 'MESSI', 10);

/* Pregunta 2 
Cuando se modifique un registro de la tabla alumnos,
se guardará un registro en la tabla log,
en acción se pondrá UPDATE y la fecha.
*/
CREATE OR REPLACE TRIGGER alumnos_update AFTER UPDATE ON ALUMNOS
    DECLARE
    
    BEGIN
        INSERT INTO ALUMNOS_LOG VALUES ('UPDATE', SYSDATE);
END;

-- PRUEBA 2
-- UPDATE ALUMNOS SET NOTA = 9 WHERE APELLIDO = 'MESSI';


-- Crea otra tabla que se llame EMPLOYEES_LOG con los campos EMPLEADO_ID, SALARIO_ANTIGUO, SALARIO_NUEVO, FECHA_ACTUALIZACION
CREATE TABLE EMPLOYEES_LOG (
    EMPLEADO_ID NUMBER(6, 0),
    SALARIO_ANTIGUO NUMBER(8, 2),
    SALARIO_NUEVO NUMBER(8, 2),
    FECHA_ACTUALIZACION DATE
);

/* PREGUNTA 3
Crea un trigger que cuando se actualice el salario de un empleado,
inserte en la tabla employee_log los datos correspondientes
*/
CREATE OR REPLACE TRIGGER salary_update AFTER UPDATE OF SALARY ON EMPLOYEES FOR EACH ROW
    DECLARE
    BEGIN
        INSERT INTO EMPLOYEES_LOG
        VALUES (:OLD.EMPLOYEE_ID, :OLD.SALARY, :NEW.SALARY, SYSDATE);
END;

-- PRUEBA 3
-- UPDATE EMPLOYEES SET SALARY = SALARY * 1.2 WHERE LAST_NAME = 'Marun';