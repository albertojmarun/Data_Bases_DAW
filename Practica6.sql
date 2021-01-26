/*
    @author: Alberto J. Marun I.
    @version: 1.0
    @date: January 25, 2021.
    @purpose: Practica 6 (Tema 9 BBDD)
*/
-- Pregunta 1
SELECT emp.first_name || ' ' || last_name as "Nombre y Apellido", dep.department_name
FROM EMPLOYEES emp
JOIN DEPARTMENTS dep USING (department_id);

--Pregunta 2
SELECT emp.first_name || ' ' || last_name as "NOMBRE COMPLETO", dep.department_name, job.job_title 
FROM EMPLOYEES emp
JOIN DEPARTMENTS dep USING (department_id)
JOIN JOBS job USING (JOB_ID);

--PREGUNTA 3
SELECT emp.first_name || ' ' || last_name as "NOMBRE COMPLETO", emp.department_id, dep.department_name
FROM EMPLOYEES emp
LEFT JOIN DEPARTMENTS dep ON(emp.department_id = dep.department_id)
WHERE FIRST_NAME LIKE 'P%';

-- PREGUNTA 4
/*
En este caso se selecciona lo mismo que en la columna anterior, solo que en este caso, se quieren obtener la información del empleado, mientras que el nombre del Departamento sea nulo.
*/
SELECT emp.first_name || ' ' || last_name as "NOMBRE COMPLETO", emp.department_id, dep.department_name
FROM EMPLOYEES emp
LEFT JOIN DEPARTMENTS dep ON(emp.department_id = dep.department_id)
WHERE DEPARTMENT_NAME IS NULL;

-- PREGUNTA 5
SELECT emp.first_name || ' ' || last_name as "NOMBRE COMPLETO", dep.location_id
FROM EMPLOYEES emp
JOIN DEPARTMENTS dep USING (DEPARTMENT_ID)
WHERE dep.location_id != (SELECT LOCATION_ID FROM LOCATIONS WHERE LOCATION_ID = 2400);
-- WHERE NOT (dep.location_id = (SELECT LOCATION_ID FROM LOCATIONS WHERE LOCATION_ID = 2400));

-- PREGUNTA 6
SELECT dep.department_id, dep.department_name
FROM DEPARTMENTS dep
WHERE 0 < (SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES emp WHERE SALARY > 2500 AND dep.department_id = emp.department_id)
ORDER BY DEPARTMENT_NAME ASC;

-- PREGUNTA 7
SELECT emp.first_name || ' ' || last_name as "NOMBRE COMPLETO", emp.SALARY AS "SALARIO"
FROM EMPLOYEES emp
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 80);

-- PREGUNTA 8
SELECT dep.DEPARTMENT_NAME, COUNT(emp.FIRST_NAME) AS NUM_EMPLEADOS
FROM DEPARTMENTS DEP, EMPLOYEES emp
WHERE (dep.DEPARTMENT_ID = emp.DEPARTMENT_ID)
GROUP BY dep.department_name
HAVING COUNT(emp.FIRST_NAME) > (SELECT COUNT(*) FROM EMPLOYEES WHERE DEPARTMENT_ID = 90);

-- PREGUNTA 9
SELECT *
FROM (SELECT emp.FIRST_NAME AS NOMBRE, dep.DEPARTMENT_NAME AS DEPARTAMENTO FROM employees emp, departments dep WHERE (emp.department_id = dep.department_id));

-- PREGUNTA 10
SELECT DEP.DEPARTMENT_ID FROM DEPARTMENTS DEP
UNION
SELECT LOC.LOCATION_ID FROM LOCATIONS LOC
ORDER BY 1 DESC;