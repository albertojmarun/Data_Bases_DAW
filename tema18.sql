CREATE OR REPLACE TYPE alumno AS OBJECT (
    nombre    VARCHAR2(50),
    apellido  VARCHAR2(100),
    dni       VARCHAR2(9),
    nota      NUMBER
);

DROP TYPE profesor;

CREATE OR REPLACE TYPE profesor AS OBJECT (
    nombre      VARCHAR2(50),
    apellido    VARCHAR(100),
    dni         VARCHAR2(9),
    asignatura  VARCHAR2(50),
    MEMBER FUNCTION dime_asignatura RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY profesor AS 
   MEMBER FUNCTION dime_asignatura return VARCHAR2 IS 
   BEGIN 
      return self.asignatura; 
   END dime_asignatura;   
END; 

-- ALTER TYPE PROFESOR MODIFY ATTRIBUTE asignatura VARCHAR2(100);