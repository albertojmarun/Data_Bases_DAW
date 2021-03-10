/*
    @author: Alberto J. Marun
    DAW - Base de Datos
    @date: 21 de Febrero de 2021
    @work: Practica 13 - BBDD
*/

/*  PREGUNTA 1
    Crea un registro que tenga la siguiente estructura:
        - Nombre
        - Apellido
        - DNI
    Inicialízalo con los datos que desees y guarda el dato en la tabla alumno.
*/
DECLARE
    TYPE ALUMNADO IS RECORD(
        DNI VARCHAR(10),
        NOMBRE VARCHAR(20),
        APELLIDO VARCHAR(20)
    );
    
    ALBERTO ALUMNADO;
    
    BEGIN
        ALBERTO.DNI := '123456789A';
        ALBERTO.NOMBRE := 'ALBERTO JOSE';
        Alberto.APELLIDO := 'MARUN INDRIAGO';

        INSERT INTO ALUMNO (DNI, NOMBRE, APELLIDO) VALUES (Alberto.DNI, Alberto.NOMBRE, Alberto.APELLIDO);
END;

/*  PREGUNTA 2
    Partiendo del registro anterior. Crea una lista del tipo de datos anterior
        - Añade a la lista 3 registros
    Haz un bucle para que imprima por pantalla (dbms_output) los tres registros.
*/

DECLARE
    TYPE ALUMNADO IS RECORD(
        DNI VARCHAR(10),
        NOMBRE VARCHAR(20),
        APELLIDO VARCHAR(20)
    );
    
    ANA ALUMNADO;
    CLAUDIA ALUMNADO;
    ANGELICA ALUMNADO;
    
    TYPE LISTADO_ALUMNOS IS VARRAY(3) OF ALUMNADO;
    
    ALUMNOS LISTADO_ALUMNOS;
    
    TOTAL INTEGER;
    
    BEGIN
        ANA.DNI := '123456789A';
        ANA.NOMBRE := 'ANA ISABELLA';
        ANA.APELLIDO := 'MARULANDA SUAREZ';
        
        CLAUDIA.DNI := '123456789B';
        CLAUDIA.NOMBRE := 'CLAUDIA';
        CLAUDIA.APELLIDO := 'AURE PI';
        
        ANGELICA.DNI := '123456789C';
        ANGELICA.NOMBRE := 'ANGELICA AURORA';
        ANGELICA.APELLIDO := 'ECHEVERRIA HERNANDEZ';
        
        ALUMNOS := LISTADO_ALUMNOS(ANA, CLAUDIA, ANGELICA);
        
        TOTAL := ALUMNOS.COUNT;
        
        FOR i in 1 .. TOTAL LOOP 
        dbms_output.put_line( 'ALUMNA: ' || ALUMNOS(i).NOMBRE || ' ' ||  ALUMNOS(i).APELLIDO || ' - ' || ALUMNOS(i).DNI); 
   END LOOP; 
        
END;

/*  PREGUNTA 3
    Crea un cursor que recupere el nombre, id y hire_date de la tabla empleados, que pertenezcan al departamento 50
        - Si el empleado ha sido contratado antes de 2007 se insertará un registro en la tabla empleados con nota = 9 (como dni se usará el employee_id)
    Si ha sido contratado con posterioridad, la nota será el resultado de dividir su número de empleado por 20
*/

DECLARE
    CURSOR EMPLEADOS (SELECTED NUMBER) IS
        SELECT FIRST_NAME, EMPLOYEE_ID, HIRE_DATE
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID = SELECTED;
    
    
        EMPLEADO_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
        NOMBRE EMPLOYEES.FIRST_NAME%TYPE;
        FECHA EMPLOYEES.HIRE_DATE%TYPE;
    
    BEGIN
        OPEN EMPLEADOS(50);
        
        LOOP 
            FETCH EMPLEADOS INTO NOMBRE, EMPLEADO_ID, FECHA; 
            
            EXIT WHEN EMPLEADOS%notfound;
            
            IF( EXTRACT(YEAR FROM FECHA) < 2007 ) THEN
                INSERT INTO ALUMNO (DNI, NOMBRE, NOTA) VALUES ( EMPLEADO_ID , NOMBRE , 9);
            
            ELSIF ( EXTRACT(YEAR FROM FECHA) >= 2007 ) THEN
                INSERT INTO ALUMNO (DNI, NOMBRE, NOTA) VALUES ( EMPLEADO_ID , NOMBRE , ( EMPLEADO_ID / 20) );
            
            END IF;
            
        END LOOP;
        
        CLOSE EMPLEADOS;
END;