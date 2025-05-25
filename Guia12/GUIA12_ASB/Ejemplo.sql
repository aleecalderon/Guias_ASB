-- Crear base de datos
CREATE DATABASE seguridad_bd;
USE seguridad_bd;
-- Crear tabla alumnos
CREATE TABLE alumnos (
 id_alumno INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 correo VARCHAR(100) UNIQUE NOT NULL
);
-- Crear tabla clases
CREATE TABLE clases (
 id_clase INT AUTO_INCREMENT PRIMARY KEY,
 nombre_clase VARCHAR(100) NOT NULL
);
-- Crear tabla notas con relaciones
CREATE TABLE notas (
 id_nota INT AUTO_INCREMENT PRIMARY KEY,
 id_alumno INT,
 id_clase INT,
 nota DECIMAL(5,2),
 FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
 FOREIGN KEY (id_clase) REFERENCES clases(id_clase)
);

- Crear usuario para crear procedimientos almacenados
CREATE USER 'creador_proc'@'local' IDENTIFIED BY 'P@ssw0rdSegura!';
-- Políticas implementadas:
-- - Contraseña segura (mayúsculas, minúsculas, símbolo, número, longitud
adecuada)
-- - Acceso restringido a 192.168.0.8 (Control de host)
-- - Principio de menor privilegio (solo permisos necesarios)
-- Otorgar permisos para crear procedimientos, pero NO INSERT
GRANT CREATE ROUTINE ON seguridad_bd.* TO 'creador_proc'@'local';
GRANT SELECT ON seguridad_bd.* TO 'creador_proc'@'local';

-- Aplicar cambios de privilegios
FLUSH PRIVILEGES;

-- Crear usuario que solo podrá ejecutar procedimientos almacenados
CREATE USER 'ejecutor_proc'@'local' IDENTIFIED BY 'Usu4rio$Seguro';
-- Políticas implementadas:
-- - Contraseña segura
-- - Control de host (192.168.0.8)
-- - Principio de menor privilegio
-- Otorgar permisos para ejecutar procedimientos
GRANT EXECUTE ON seguridad_bd.* TO 'ejecutor_proc'@'local';
GRANT SELECT ON seguridad_bd.* TO 'ejecutor_proc'@'local';
-- Aplicar cambios de privilegios
FLUSH PRIVILEGES;


-- Iniciar sesión como 'creador_proc' y crear el procedimiento
DELIMITER $$
CREATE PROCEDURE ingresar_nota (
 IN p_id_alumno INT,
 IN p_id_clase INT,
 IN p_nota DECIMAL(5,2)
)
BEGIN
 INSERT INTO notas (id_alumno, id_clase, nota)
 VALUES (p_id_alumno, p_id_clase, p_nota);
END$$
DELIMITER ;

-- Iniciar sesión con usuario de ejecución
-- Utilizar la db indicada
USE seguridad_bd;
-- Ejecutar Store Procedure
CALL sp_insertar_nota(1, 3, 87);
-- Para capturar el valor de salida

SET @mensaje = '';
CALL sp_insertar_nota(1, 3, 87, @mensaje);
SELECT @mensaje;