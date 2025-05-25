--Crear la tabla film_update_log dentro de sakila.
SQL
USE sakila;
CREATE TABLE film_update_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT,
    update_date DATETIME
);

--Crear el Trigger after_film_update:
SQL
USE sakila;
DELIMITER $$
CREATE TRIGGER after_film_update
AFTER UPDATE ON film
FOR EACH ROW
BEGIN
    INSERT INTO film_update_log(film_id, update_date)
    VALUES (OLD.film_id, NOW());
END$$
DELIMITER ;

Probar el Trigger:
Ahora, actualiza una película en la tabla film y luego verifica la tabla film_update_log.

SQL

USE sakila;

-- 1. Identifica una película para actualizar (puedes cambiar el film_id)
SELECT film_id, title FROM film LIMIT 1;

-- 2. Actualiza un campo de esa película (por ejemplo, el rental_rate)
UPDATE film
SET rental_rate = 2.99
WHERE film_id = 1; 

-- 3. Verifica la tabla de log
SELECT * FROM film_update_log;

--Ejercicio 2: Validación de rental_rate

--Crear el Trigger before_film_insert_rental_rate
USE sakila;
DELIMITER $$
CREATE TRIGGER before_film_insert_rental_rate
BEFORE INSERT ON film
FOR EACH ROW
BEGIN
    IF NEW.rental_rate <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El rental_rate debe ser mayor que 0.';
    END IF;
END$$
DELIMITER ;

--Probar el Trigger
USE sakila;

-- Intento de inserción INVÁLIDA
INSERT INTO film (title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update)
VALUES ('Pelicula Invalida', 'Descripción', 2025, 1, NULL, 3, 0.00, 120, 19.99, 'G', 'Trailers', NOW());

-- Intento de inserción VÁLIDA 
INSERT INTO film (title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update)
VALUES ('Pelicula Valida', 'Descripción', 2025, 1, NULL, 3, 0.99, 120, 19.99, 'G', 'Trailers', NOW());

--Ejercicio 3: Actualizar last_update en la tabla customer
--Crear el Trigger before_customer_update_last_update
USE sakila;

DELIMITER $$
CREATE TRIGGER before_customer_update_last_update
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    SET NEW.last_update = NOW();
END$$
DELIMITER ;

--Probar el Trigger
USE sakila;

-- 1. Identifica un cliente para actualizar (puedes cambiar el customer_id)
SELECT customer_id, first_name, last_update FROM customer LIMIT 1;

-- 2. Actualiza un campo de ese cliente (por ejemplo, el email)
UPDATE customer
SET email = 'nuevo.email@example.com'
WHERE customer_id = 1; -- Cambia el ID si necesitas otro

-- 3. Verifica el campo last_update del cliente actualizado
SELECT customer_id, first_name, last_update FROM customer WHERE customer_id = 1;

--Ejercicio Complementario - Auditoría de Pagos
--Crear la tabla payment_audit
USE sakila;
CREATE TABLE payment_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_id INT,
    customer_id INT,
    amount DECIMAL(5,2),
    audit_date DATETIME
);
--Craer trigger
USE sakila;

DELIMITER $$
CREATE TRIGGER after_payment_insert
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
    INSERT INTO payment_audit(payment_id, customer_id, amount, audit_date)
    VALUES (NEW.payment_id, NEW.customer_id, NEW.amount, NOW());
END$$
DELIMITER ;
--probar trigger 
USE sakila;

-- 1. Puedes obtener un customer_id y staff_id existente de Sakila
SELECT customer_id FROM customer LIMIT 1;
SELECT staff_id FROM staff LIMIT 1;

-- 2. Inserta un nuevo pago (ajusta customer_id y staff_id si es necesario)
INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date, last_update)
VALUES (1, 1, NULL, 5.99, NOW(), NOW()); -- rental_id puede ser NULL o un ID válido

-- 3. Verifica la tabla de auditoría de pagos
SELECT * FROM payment_audit;
