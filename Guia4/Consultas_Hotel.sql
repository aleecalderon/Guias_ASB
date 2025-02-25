CREATE DATABASE Hotel_CE231635;
GO

USE Hotel_CE231635;
GO

CREATE TABLE Hotel (
CodigoHotel INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL UNIQUE,
Direccion TEXT NOT NULL,
SitioWeb VARCHAR(255) UNIQUE
);

CREATE TABLE Huesped (
CodigoHuesped INT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL UNIQUE,
Direccion TEXT NOT NULL,
Telefono VARCHAR(20) NOT NULL
);

CREATE TABLE Habitacion (
CodigoHabitacion INT IDENTITY(1,1) PRIMARY KEY,
CodigoHotel INT NOT NULL,
Tipo VARCHAR(20) NOT NULL CHECK (Tipo IN ('Doble', 'Individual')),
Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 25),
FOREIGN KEY (CodigoHotel) REFERENCES Hotel(CodigoHotel) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Reservacion (
    CodigoReserva INT IDENTITY(1,1) PRIMARY KEY,
    CodigoHotel INT NOT NULL,
    CodigoHuesped INT NOT NULL,
    CodigoHabitacion INT NOT NULL,
    FechaInicio DATE NOT NULL DEFAULT GETDATE(),
    FechaFin DATE NOT NULL,
    CHECK (FechaFin > FechaInicio),
    FOREIGN KEY (CodigoHotel) REFERENCES Hotel(CodigoHotel) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (CodigoHuesped) REFERENCES Huesped(CodigoHuesped) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (CodigoHabitacion) REFERENCES Habitacion(CodigoHabitacion) ON DELETE NO ACTION ON UPDATE NO ACTION
);








