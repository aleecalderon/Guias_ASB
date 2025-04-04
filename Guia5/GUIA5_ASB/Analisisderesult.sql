CREATE DATABASE Gestion_Compras;

USE Gestion_Compras;

CREATE TABLE Cliente (
DUI VARCHAR(10) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Direccion VARCHAR(255) NOT NULL
);

CREATE TABLE Producto (
Codigo INT PRIMARY KEY,
Descripcion VARCHAR(255) NOT NULL,
Precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE Compra (
Cliente_DUI VARCHAR(10),
Producto_Codigo INT,
Fecha DATE NOT NULL,
Valor DECIMAL(10,2) NOT NULL,
PRIMARY KEY (Cliente_DUI, Producto_Codigo, Fecha),
FOREIGN KEY (Cliente_DUI) REFERENCES Cliente(DUI) ON DELETE CASCADE,
FOREIGN KEY (Producto_Codigo) REFERENCES Producto(Codigo) ON DELETE CASCADE
);


INSERT INTO Cliente (DUI, Nombre, Direccion) VALUES
('12345678-9', 'Belén Pérez', 'San Salvador, El Salvador'),
('98765432-1', 'Gabriela Molina', 'Santa Tecla, El Salvador'),
('45678912-3', 'Cesar Suria', 'Soyapango, El Salvador');

INSERT INTO Producto (Codigo, Descripcion, Precio) VALUES
(101, 'Laptop HP', 750.00),
(102, 'Teléfono Samsung', 500.00),
(103, 'Teléfono Iphone', 300.00);

INSERT INTO Compra (Cliente_DUI, Producto_Codigo, Fecha, Valor) VALUES
('12345678-9', 101, '2024-03-01', 750.00),
('98765432-1', 102, '2024-03-02', 500.00),
('45678912-3', 103, '2024-03-03', 300.00);
