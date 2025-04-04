Punto 1

SELECT order_id, product_id, unit_price
FROM order_details
WHERE order_id = 10251;

Punto 2

SELECT company
FROM Customers
WHERE company = 'Alfreds Futterkiste';

Punto 3

SELECT order_id, product_id, unit_price
FROM order_details
WHERE order_id = 10251 AND product_id = 57;

Punto 4

SELECT order_id, product_id, unit_price
FROM order_details
WHERE order_id = 10251 OR product_id = 57;

Punto 5

SELECT order_id, product_id, unit_price
FROM order_details
WHERE order_id = 11000;

Punto 6

SELECT order_id, product_id, unit_price
FROM order_details
WHERE order_id = 11000 AND order_id = 11003;

Punto 7

SELECT order_id, product_id, unit_price
FROM order_details
WHERE order_id  BETWEEN 11000 AND 11003;

Punto 8

SELECT company
FROM Customers
WHERE company LIKE 'A%';

Punto 9

SELECT company
FROM Customers
WHERE company LIKE '%MA';

Punto 10

SELECT RegionDescription
FROM Region
WHERE RegionDescription LIKE '%TERN%' LIMIT 0, 25;

Punto 11

SELECT order_id
FROM order_details
WHERE order_id  LIKE '_0285';

Punto 12

SELECT company
FROM Customers
WHERE company LIKE '[a-c]%';

INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
VALUES (98105, 'Santa_Catalina', 2);

SELECT *
FROM Territories
WHERE TerritoryDescription LIKE 'Santa_C%';

SELECT * FROM Territories
WHERE TerritoryDescription LIKE 'Santa!_C%' ESCAPE '!';

Punto 13

SELECT * FROM [Order Details]
WHERE OrderID IN (10248, 10255, 10270);

Punto 14

SELECT * FROM [Order Details]
WHERE OrderID = 10248 OR OrderID = 10255 OR OrderID = 10270;