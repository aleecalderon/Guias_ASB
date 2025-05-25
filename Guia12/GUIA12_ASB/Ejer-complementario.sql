--procedimiento para insertar los alumnos 
DELIMITER $$
CREATE PROCEDURE insertar_alumno (
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(100)
)
BEGIN
    INSERT INTO alumnos (nombre, correo)
    VALUES (p_nombre, p_correo);
END$$
DELIMITER ;

--Procedimiento para insertar clases 
DELIMITER $$
CREATE PROCEDURE insertar_clase (
    IN p_nombre_clase VARCHAR(100)
)
BEGIN
    INSERT INTO clases (nombre_clase)
    VALUES (p_nombre_clase);
END$$
DELIMITER ;

--Procedimiento para agregar notas y agregando mensaje de salida 
DELIMITER $$
CREATE PROCEDURE sp_insertar_nota (
    IN p_id_alumno INT,
    IN p_id_clase INT,
    IN p_nota DECIMAL(5,2),
    OUT p_mensaje VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        SET p_mensaje = 'Error al insertar la nota.';
    END;

    INSERT INTO notas (id_alumno, id_clase, nota)
    VALUES (p_id_alumno, p_id_clase, p_nota);

    SET p_mensaje = 'Nota insertada correctamente.';
END$$
DELIMITER ;


