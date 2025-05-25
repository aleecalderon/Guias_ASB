-- Crear base de datos
CREATE DATABASE sistema_academico;
USE sistema_academico;

-- Crear tabla profesores
CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL
);

-- Crear tabla materias 
CREATE TABLE materias (
    id_materia INT AUTO_INCREMENT PRIMARY KEY,
    nombre_materia VARCHAR(100) NOT NULL,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);


CREATE USER 'proc_user'@'localhost' IDENTIFIED BY 'ProcUserSecure1!@#';

CREATE USER 'exec_user'@'localhost' IDENTIFIED BY 'ExecUser$Seguro99';

-- Permisos para 'proc_user' 
GRANT CREATE ROUTINE ON sistema_academico.* TO 'proc_user'@'localhost';
GRANT SELECT ON sistema_academico.* TO 'proc_user'@'localhost';

-- Permisos para 'exec_user' 
GRANT EXECUTE ON sistema_academico.* TO 'exec_user'@'localhost';
GRANT SELECT ON sistema_academico.* TO 'exec_user'@'localhost';

FLUSH PRIVILEGES;

-- Ver permisos de 'proc_user'
SHOW GRANTS FOR 'proc_user'@'localhost';

-- Ver permisos de 'exec_user'
SHOW GRANTS FOR 'exec_user'@'localhost';

