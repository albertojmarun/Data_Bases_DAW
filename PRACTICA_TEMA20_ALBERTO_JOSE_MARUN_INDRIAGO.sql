CREATE OR REPLACE TYPE EMPLEADO AS OBJECT(
    EMPLEADO_ID INTEGER,
    NOMBRE VARCHAR2(20),
    APELLIDO VARCHAR2(20),
    EMAIL VARCHAR2(50),
    DIA_CONTRATACION DATE,
    TRABAJO_ID VARCHAR2(10),
    SALARIO NUMBER,
    MANAGER_ID NUMBER,
    DEPARTAMENTO_ID NUMBER
);

CREATE TABLE OBJECT_EMPLOYEE(
    EMPLOYEE_ID INTEGER,
    OBJ_EMPLEADO EMPLEADO
);

INSERT INTO OBJECT_EMPLOYEE
SELECT E.EMPLOYEE_ID, EMPLEADO( E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.EMAIL, E.HIRE_DATE, E.JOB_ID, E.SALARY, E.MANAGER_ID, E.DEPARTMENT_ID) FROM EMPLOYEES E WHERE E.DEPARTMENT_ID = 30;

-- SUBSELECT
-- SELECT E.EMPLOYEE_ID, EMPLEADO( E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.EMAIL, E.HIRE_DATE, E.JOB_ID, E.SALARY, E.MANAGER_ID, E.DEPARTMENT_ID) FROM EMPLOYEES E WHERE E.DEPARTMENT_ID = 30;

UPDATE OBJECT_EMPLOYEE E
SET EMPLOYEE_ID = 20, E.OBJ_EMPLEADO.EMPLEADO_ID = 20
WHERE EMPLOYEE_ID = 116;

UPDATE OBJECT_EMPLOYEE E
SET E.OBJ_EMPLEADO.MANAGER_ID = 100
WHERE E.OBJ_EMPLEADO.DEPARTAMENTO_ID = 30 AND E.OBJ_EMPLEADO.SALARIO > 2600;

DELETE FROM OBJECT_EMPLOYEE E
WHERE E.OBJ_EMPLEADO.NOMBRE = 'Den';