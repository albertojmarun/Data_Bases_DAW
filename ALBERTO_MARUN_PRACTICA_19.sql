DECLARE
    alberto EMPLEADO;
    espana DEPARTAMENTO;
BEGIN
    alberto := NEW EMPLEADO(0967197, 'ALBERTO JOSE', 'MARUN INDRIAGO', 'ALBERTOJMARUN@GMAIL.COM', '05/09/2019', 'ESTUDIANTE');
    espana := NEW DEPARTAMENTO('34', 'ESPANA', '10', '34');
    
    alberto.salario := 1250;
    dbms_output.put_line('EL SALARIO ES DE ' || alberto.salario || ' €');
    
    alberto.AUMENTO_SALARIAL( (115 / 100) );
    dbms_output.put_line('EL NUEVO SALARIO (AUMENTO DE 15%) ES DE ' || alberto.salario || ' €');
    
    dbms_output.put_line('ALBERTO SE CONTRATO (CONSTRUCTOR): ' || alberto.DIA_CONTRATACION);
    
    alberto.DIA_CONTRATACION := '22/09/2020';
    dbms_output.put_line('TIEMPO TRABAJADO (NUEVO): ' || alberto.tiempo_contratado || ' DIAS');
END;
