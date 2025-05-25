//Crear un inicio de sesión

CREATE USER 'sakila_dev_user'@'localhost' IDENTIFIED BY 'MiContraseñaFuerte123!';

//Crear un usuario para la base de datos SAKILA

GRANT SELECT ON sakila.* TO 'sakila_dev_user'@'localhost';

//Asignar a este usuario que puede crear tablas y vistas en la base de datos

GRANT CREATE TABLE, CREATE VIEW ON sakila.* TO 'sakila_dev_user'@'localhost';

//Eliminar el inicio de sesión y el usuario de la base de datos creado en el ejercicio

DROP USER 'sakila_dev_user'@'localhost';