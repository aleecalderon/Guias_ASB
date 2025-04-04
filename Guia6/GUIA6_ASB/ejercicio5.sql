Paso 1

SELECT CategoryID AS 'Codigo de la categoria',
       CategoryName AS 'Nombre de la categoria'
FROM Categories;

Paso 2

SELECT ProductID,
       ProductName,
       UnitPrice,
       UnitPrice * 1.10 AS Aumento
FROM Products;