//Asi llamamos nuestra base de datos

CREATE DATABASE IF NOT EXISTS mi_negocio_db;

//Creamos cada tabla siguiendo el diagrama

-- Tabla 'ciudad'
CREATE TABLE ciudad (
    nomb_ciudad VARCHAR(100) PRIMARY KEY,
    departamento VARCHAR(100)
);

-- Tabla 'cliente'
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT, -- AUTO_INCREMENT para generar IDs automáticamente
    nomb_cliente VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    tipo_cliente VARCHAR(50),
    nomb_ciudad VARCHAR(100), -- Clave foránea
    FOREIGN KEY (nomb_ciudad) REFERENCES ciudad(nomb_ciudad)
);

-- Tabla 'transporte'
CREATE TABLE transporte (
    num_transporte INT PRIMARY KEY AUTO_INCREMENT,
    nomb_conductor VARCHAR(100)
);

-- Tabla 'pedido'
CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT, -- Clave foránea
    num_transporte INT, -- Clave foránea
    destino VARCHAR(255),
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (num_transporte) REFERENCES transporte(num_transporte)
);

//Llenamos las tablas con los datos de ejemplo

-- Insertar datos en 'ciudad'
INSERT INTO ciudad (nomb_ciudad, departamento) VALUES
('San Salvador', 'San Salvador'),
('Santa Ana', 'Santa Ana'),
('La Unión', 'La Unión');

-- Insertar datos en 'cliente'
INSERT INTO cliente (nomb_cliente, direccion, telefono, tipo_cliente, nomb_ciudad) VALUES
('Juan Pérez', 'Calle 1, Casa 1', '7890-1234', 'Premium', 'San Salvador'),
('María García', 'Avenida Central, #5', '7123-4567', 'Normal', 'Santa Ana'),
('Pedro López', 'Colonia Las Flores, Bloque D', '6000-1111', 'Premium', 'San Salvador');

-- Insertar datos en 'transporte'
INSERT INTO transporte (nomb_conductor) VALUES
('Carlos Ruiz'),
('Ana Martínez'),
('Luis Morales');

-- Insertar datos en 'pedido'
INSERT INTO pedido (id_cliente, num_transporte, destino, fecha_pedido) VALUES
(1, 1, 'San Salvador', '2025-05-20'),
(2, 2, 'Santa Ana', '2025-05-21'),
(1, 3, 'La Unión', '2025-05-21');

//Otorgar permisos para la tabla cliente

GRANT INSERT, UPDATE, DELETE, SELECT ON mi_negocio_db.cliente TO 'usuario_clientes_ciudades'@'localhost';

//Otorgar permisos para la tabla ciudad

GRANT INSERT, UPDATE, DELETE, SELECT ON mi_negocio_db.ciudad TO 'usuario_clientes_ciudades'@'localhost';

//Para usuario_ver_pedidos

CREATE USER 'usuario_ver_pedidos'@'localhost' IDENTIFIED BY 'password456';
GRANT SELECT ON mi_negocio_db.pedido TO 'usuario_ver_pedidos'@'localhost';
FLUSH PRIVILEGES;

//Para usuario_admin_pedidos_transporte

CREATE USER 'usuario_admin_pedidos_transporte'@'localhost' IDENTIFIED BY 'password789';
GRANT SELECT, INSERT, UPDATE, DELETE ON mi_negocio_db.pedido TO 'usuario_admin_pedidos_transporte'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON mi_negocio_db.transporte TO 'usuario_admin_pedidos_transporte'@'localhost';
FLUSH PRIVILEGES;