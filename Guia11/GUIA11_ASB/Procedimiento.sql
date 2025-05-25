CREATE DATABASE alumno_CE231635;
USE alumno_CE231635;

CREATE TABLE alumnos (
 id_alumno INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 apellido VARCHAR(100) NOT NULL,
 fecha_nacimiento DATE NOT NULL
);

INSERT INTO alumnos (nombre, apellido, fecha_nacimiento) VALUES
('Juan', 'Pérez', '2000-05-14'),
('Ana', 'Gómez', '1999-11-23'),
('Luis', 'Ramírez', '2001-03-10');

CREATE TABLE notas (
 id_nota INT AUTO_INCREMENT PRIMARY KEY,
 id_alumno INT,
 materia VARCHAR(100) NOT NULL,
 nota DECIMAL(5,2) NOT NULL,
 FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno)
);

INSERT INTO notas (id_alumno, materia, nota) VALUES
(1, 'Matemáticas', 85.50),
(1, 'Historia', 90.00),
(2, 'Matemáticas', 78.25),
(3, 'Historia', 88.75),
(3, 'Matemáticas', 92.00);

//Para ver los alumnos que pusimos solo ponemos 

SELECT * FROM alumnos;

//Para ver las notas ponemos 

SELECT * FROM notas;

//Para ver las notas con los nombres de los alumnos ponemos 

SELECT alumnos.nombre, alumnos.apellido, notas.materia, notas.nota
FROM alumnos
INNER JOIN notas ON alumnos.id_alumno = notas.id_alumno;

CREATE USER 'CE231635'@'%' IDENTIFIED BY '1234';

//Con este paso otorgamos permisos para INSERT, UPDATE y DELETE en la base de datos

GRANT SELECT, INSERT, UPDATE, DELETE ON alumno_CE231635.* TO 'CE231635'@'localhost';

//Otorgamos permisos para crear procedimientos almacenados

GRANT CREATE ROUTINE, EXECUTE ON alumno_CE231635.* TO 'CE231635'@'localhost';

USE alumno_CE231635;

//Creamos el procedimiento almacenado 

DELIMITER $$
CREATE PROCEDURE insertar_nota(
 IN p_id_alumno INT,
 IN p_materia VARCHAR(100),
 IN p_nota DECIMAL(5,2)
)
BEGIN
 -- Insertar la nueva nota
 INSERT INTO notas (id_alumno, materia, nota)
 VALUES (p_id_alumno, p_materia, p_nota);
 -- Mostrar los datos insertados
 SELECT * FROM notas WHERE id_nota = LAST_INSERT_ID();
END $$
DELIMITER ;

CREATE USER 'notas_CE231635'@'localhost' IDENTIFIED BY '1234';

//Otorgar permisos solo para ejecutar el procedimiento almacenado

GRANT EXECUTE ON PROCEDURE alumno_CE231635.insertar_nota TO 'notas_CE231635'@'localhost';

//Dar permisos SELECT solo sobre la tabla notas

GRANT SELECT ON alumno_CE231635.notas TO 'notas_CE231635'@'localhost';

CALL insertar_nota(1, 'Matemáticas', 9.5);

//Eliminar el usuario 

DROP USER 'CE231635'@'localhost';

//Eliminar el usuario notas_user 

DROP USER 'notas_CE231635'@'localhost';

//Eliminar la base de datos

DROP DATABASE alumno_CE231635;

