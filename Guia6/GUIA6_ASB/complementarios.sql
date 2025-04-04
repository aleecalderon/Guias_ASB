SELECT customerNumber
FROM orders
WHERE customerNumber LIKE '1_1';

SELECT *
FROM HumanResources.Department;

SELECT BusinessEntityID, NationalIDNumber, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Production%';

SELECT *
FROM Sales.Customer
WHERE CustomerID IN (2, 4, 7, 10);

SELECT DepartmentID, Name
FROM HumanResources.Department
WHERE DepartmentID BETWEEN 5 AND 12;

SELECT AddressID, City, StateProvinceID
FROM Person.Address
WHERE City LIKE 'B%';

SELECT *
FROM Production.Culture
WHERE Name IN ('English', 'Spanish');

SELECT TOP 50 PERCENT *
FROM Sales.CreditCard;

SELECT TOP 10 *
FROM Sales.SalesOrderDetail
ORDER BY LineTotal DESC;

SELECT DISTINCT JobTitle
FROM HumanResources.Employee
ORDER BY JobTitle DESC;

SELECT Name, ProductNumber, ListPrice AS Price
FROM Production.Product
WHERE ProductLine = 'R' AND DaysToManufacture < 4;