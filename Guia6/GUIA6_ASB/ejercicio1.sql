con este codigo cree la tabla Categories

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(15) NOT NULL,
    Description TEXT,
    Picture LONGBLOB
);

despues escribi lo que pide en la guia 

SELECT * FROM Categories;
SELECT CategoryName, CategoryID FROM Categories;