DELIMITER $$
CREATE PROCEDURE AddNewCustomer(
 IN storeId INT,
 IN firstName VARCHAR(45),
 IN lastName VARCHAR(45),
 IN email VARCHAR(50),
 IN addressId INT,
 IN active CHAR(1),
 OUT newCustomerId INT
)
BEGIN
 -- Insertamos un nuevo cliente en la tabla CUSTOMER
 INSERT INTO CUSTOMER (STORE_ID, FIRST_NAME, LAST_NAME, EMAIL, ADDRESS_ID, ACTIVE,
CREATE_DATE, LAST_UPDATE)
 VALUES (storeId, firstName, lastName, email, addressId, active, NOW(), NOW());
 -- Obtenemos el ID del último cliente insertado
 SET newCustomerId = LAST_INSERT_ID();
END $$
DELIMITER ;

SET @newId = 0;
CALL AddNewCustomer(1, 'Juan', 'Pérez', 'juan.perez@email.com', 5, 'Y', @newId);