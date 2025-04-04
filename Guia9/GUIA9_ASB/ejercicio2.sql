DELIMITER $$
CREATE PROCEDURE AddNewRental(
 IN customerId INT,
 IN inventoryId INT,
 IN staffId INT,
 OUT newRentalId INT
)
BEGIN
 -- Insertamos un nuevo alquiler en la tabla RENTAL
 INSERT INTO RENTAL (RENTAL_DATE, INVENTORY_ID, CUSTOMER_ID, STAFF_ID, RETURN_DATE,
LAST_UPDATE)
 VALUES (NOW(), inventoryId, customerId, staffId, NULL, NOW());
 -- Obtenemos el ID del último alquiler insertado
 SET newRentalId = LAST_INSERT_ID();
END $$
DELIMITER ;

SET @rentalId = 0;
CALL AddNewRental(5, 10, 2, @rentalId);
SELECT @rentalId;