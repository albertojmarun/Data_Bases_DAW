/*
    @author Alberto J. Marun I.
    @date February 15, 2021.
    Funcion para saber el Estado de la nota del Alumno.
*/
create or replace FUNCTION SITUACION_NOTA (DNI_ALUMNO VARCHAR2)
    RETURN VARCHAR2
    
    IS
        SITUACION VARCHAR2(50);
        NOTA_ALUMNO BINARY_FLOAT;

    BEGIN
        SELECT NOTA INTO NOTA_ALUMNO FROM ALUMNOS WHERE DNI = DNI_ALUMNO;

        IF NOTA_ALUMNO < 5 THEN
            SITUACION := 'SUSPENSO';
            
        ELSIF NOTA_ALUMNO BETWEEN 5 AND 6.49 THEN
            SITUACION := 'APROBADO';
            
        ELSIF NOTA_ALUMNO BETWEEN 6.5 AND 8.99 THEN
            SITUACION := 'NOTABLE';
            
        ELSIF NOTA_ALUMNO BETWEEN 9 AND 10 THEN
            SITUACION := 'SOBRESALIENTE';
            
        END IF;
        
        RETURN SITUACION;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                SITUACION := 'ALUMNO NO ENCONTRADO';
                RETURN SITUACION;
                
            WHEN OTHERS THEN
                SITUACION := 'ERROR NO ENCONTRADO';
                RETURN SITUACION;

END SITUACION_NOTA;