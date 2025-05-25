--Análisis de Resultados - Gestión de Citas Médicas
--Crear la base de datos clinica: 
SQL
CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;
--Crear las tablas principales: pacientes, medicos, citas_medicas y auditoria_citas.

SQL
USE clinica;
-- Tabla pacientes
CREATE TABLE pacientes (
    paciente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE,
    fecha_nacimiento DATE,
    telefono VARCHAR(20)
);

-- Tabla medicos
CREATE TABLE medicos (
    medico_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);

-- Tabla citas_medicas
CREATE TABLE citas_medicas (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    estado VARCHAR(50) DEFAULT 'Pendiente', -- Ej: Pendiente, Confirmada, Cancelada, Realizada
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES medicos(medico_id)
);

-- Tabla de auditoría de citas
CREATE TABLE auditoria_citas (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT,
    tipo_operacion VARCHAR(10), -- INSERT, UPDATE, DELETE
    fecha_operacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario_cambio VARCHAR(100) -- Función para obtener el usuario actual
);

--Crear un Trigger AFTER INSERT para citas_medicas:
SQL
USE clinica;
DELIMITER $$
CREATE TRIGGER after_cita_insert
AFTER INSERT ON citas_medicas
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_citas (cita_id, tipo_operacion, usuario_cambio)
    VALUES (NEW.cita_id, 'INSERT', USER()); -- USER() obtiene el usuario actual de MySQL
END$$
DELIMITER ;

--Crear un Trigger AFTER UPDATE para citas_medicas:
SQL
USE clinica;
DELIMITER $$
CREATE TRIGGER after_cita_update
AFTER UPDATE ON citas_medicas
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_citas (cita_id, tipo_operacion, usuario_cambio)
    VALUES (NEW.cita_id, 'UPDATE', USER());
END$$
DELIMITER ;
--Insertar algunos datos de prueba:
SQL
USE clinica;
-- Insertar pacientes
INSERT INTO pacientes (nombre, apellido, correo, fecha_nacimiento, telefono) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', '1985-05-10', '555-1234'),
('María', 'González', 'maria.gonzalez@email.com', '1992-11-20', '555-5678');

-- Insertar médicos
INSERT INTO medicos (nombre, apellido, especialidad, telefono) VALUES
('Dr. Carlos', 'Ruiz', 'Cardiología', '555-9876'),
('Dra. Ana', 'Martínez', 'Pediatría', '555-4321');

-- Insertar citas médicas (esto activará el trigger INSERT)
INSERT INTO citas_medicas (paciente_id, medico_id, fecha_hora, estado) VALUES
(1, 1, '2025-06-01 10:00:00', 'Pendiente'),
(2, 2, '2025-06-02 11:30:00', 'Pendiente');

--Realizar algunas actualizaciones a las citas
SQL
USE clinica;
-- Actualizar el estado de una cita
UPDATE citas_medicas
SET estado = 'Confirmada'
WHERE cita_id = 1;
-- Actualizar la fecha y hora de otra cita
UPDATE citas_medicas
SET fecha_hora = '2025-06-03 09:00:00'
WHERE cita_id = 2;

--Consultar la tabla de auditoría:
SQL
USE clinica;
SELECT * FROM auditoria_citas;