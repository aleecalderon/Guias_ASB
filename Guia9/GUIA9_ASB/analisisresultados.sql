Ejemplo 1

DELIMITER //

CREATE PROCEDURE GetCustomerEmail (
    IN CustomerID INT,
    OUT CustomerEmail VARCHAR(100)
)
BEGIN
    -- Busca el email del cliente con el ID proporcionado
    SELECT EMAIL INTO CustomerEmail
    FROM CUSTOMER
    WHERE CUSTOMER_ID = CustomerID;
END //

DELIMITER ;

-- Ejemplo de cómo llamar al procedimiento almacenado

-- Primero, declara una variable para recibir el email
SET @email_cliente = '';

-- Luego, llama al procedimiento pasando el ID del cliente y la variable OUT
CALL GetCustomerEmail(123, @email_cliente); -- Reemplaza 123 con el ID del cliente que deseas buscar

-- Finalmente, puedes ver el valor de la variable que contiene el email
SELECT @email_cliente AS EmailDelCliente;

Ejemplo 2

DELIMITER //

CREATE PROCEDURE CountCustomers (
    OUT TotalCustomers INT
)
BEGIN
    -- Cuenta el número total de clientes en la tabla CUSTOMER
    SELECT COUNT(*) INTO TotalCustomers
    FROM CUSTOMER;
END //

DELIMITER ;

-- Ejemplo de cómo llamar al procedimiento almacenado

-- Primero, declara una variable para recibir el total de clientes
SET @total_clientes = 0;

-- Luego, llama al procedimiento pasando la variable OUT
CALL CountCustomers(@total_clientes);

-- Finalmente, puedes ver el valor de la variable que contiene el total de clientes
SELECT @total_clientes AS NumeroTotalDeClientes;


Ejemplo 3

DELIMITER //

CREATE PROCEDURE UpdateCustomerEmail (
    IN CustomerID INT,
    IN NewEmail VARCHAR(100)
)
BEGIN
    -- Actualiza el email del cliente con el ID proporcionado
    UPDATE CUSTOMER
    SET EMAIL = NewEmail
    WHERE CUSTOMER_ID = CustomerID;
END //

DELIMITER ;

-- Ejemplo de cómo llamar al procedimiento almacenado

CALL UpdateCustomerEmail(123, 'nuevo.email@ejemplo.com'); -- Reemplaza 123 con el ID del cliente y el nuevo email