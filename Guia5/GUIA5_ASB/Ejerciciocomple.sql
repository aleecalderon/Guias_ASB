CREATE DATABASE Gestion_Peliculas_Carnet;

USE Gestion_Peliculas_Carnet;

CREATE TABLE Estudio (
Codigo INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Domicilio (
Codigo INT PRIMARY KEY AUTO_INCREMENT,
Direccion VARCHAR(255) NOT NULL,
Ciudad VARCHAR(100) NOT NULL,
Pais VARCHAR(100) NOT NULL,
Estudio_Codigo INT,
FOREIGN KEY (Estudio_Codigo) REFERENCES Estudio(Codigo) ON DELETE CASCADE
);

CREATE TABLE Pelicula (
Codigo INT PRIMARY KEY,
Titulo VARCHAR(255) NOT NULL,
Direccion VARCHAR(255) NOT NULL,
Estudio_Codigo INT,
FOREIGN KEY (Estudio_Codigo) REFERENCES Estudio(Codigo) ON DELETE SET NULL
);

CREATE TABLE Actor (
Codigo INT PRIMARY KEY,
PrimerNombre VARCHAR(50) NOT NULL,
PrimerApellido VARCHAR(50) NOT NULL,
FechaNacimiento DATE NOT NULL,
Telefono VARCHAR(20),
Email VARCHAR(100)
);

CREATE TABLE Actua (
Pelicula_Codigo INT,
Actor_Codigo INT,
PRIMARY KEY (Pelicula_Codigo, Actor_Codigo),
FOREIGN KEY (Pelicula_Codigo) REFERENCES Pelicula(Codigo) ON DELETE CASCADE,
FOREIGN KEY (Actor_Codigo) REFERENCES Actor(Codigo) ON DELETE CASCADE
);


INSERT INTO Estudio (Codigo, Nombre) VALUES (1, 'Warner Bros'), (2, 'Universal Pictures'), (3, 'Paramount');

INSERT INTO Domicilio (Direccion, Ciudad, Pais, Estudio_Codigo) VALUES
('123 Hollywood Blvd', 'Los Angeles', 'EE.UU.', 1),
('456 Studio Ave', 'New York', 'EE.UU.', 2),
('789 Universal Studios', 'Florida', 'EE.UU', 3);

INSERT INTO Pelicula (Codigo, Titulo, Direccion, Estudio_Codigo) VALUES
(101, 'Pearl', 'Ti West', 1),
(102, 'Terrifier', 'Damien Leone', 2),
(103, 'Titanic', 'James Cameron', 3);

INSERT INTO Actor (Codigo, PrimerNombre, PrimerApellido, FechaNacimiento, Telefono, Email) VALUES
(201, 'Leonardo', 'DiCaprio', '1974-11-11', '555-1234', 'leo@gmail.com'),
(202, 'Tom', 'Hanks', '1956-07-09', '555-5678', 'tom@gmail.com'),
(203, 'Natalie', 'Portman', '1981-06-09', '555-8765', 'natalie@gmail.com');

INSERT INTO Actua (Pelicula_Codigo, Actor_Codigo) VALUES
(101, 201), (102, 202), (103, 201), (103, 203);
