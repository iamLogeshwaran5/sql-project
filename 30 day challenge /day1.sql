/*
Scenario:
You are managing a grocery shop database consisting of two tables: Product and Supplier.

Table Descriptions:

Product Table Columns:

Product_id: Unique identifier for each product.
Product_Name: Name of the product.
Supplier_id: Unique identifier referencing the supplier of the product.
Price: Price of the product.
Kg: Weight or quantity of the product.
Supplier Table Columns:

Supplier_id: Unique identifier for each supplier.
Supplier_Name: Name of the supplier.
Country: Country where the supplier is located.

*/

Create database challenge; -- create a database

use challenge; -- selecting using database

-- Creating Supplier table
CREATE TABLE Supplier (
    Supplier_id INT PRIMARY KEY,
    Supplier_Name VARCHAR(100),
    Country VARCHAR(100)
);

-- Creating Product table
CREATE TABLE Product (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Supplier_id INT,
    Price DECIMAL(10, 2),
    Kg DECIMAL(10, 2),
    FOREIGN KEY (Supplier_id) REFERENCES Supplier(Supplier_id)
);

-- Inserting sample data into Supplier table
INSERT INTO Supplier (Supplier_id, Supplier_Name, Country) VALUES
(1, 'Fresh Farms', 'USA'),
(2, 'Organic Produce Co.', 'USA'),
(3, 'British Grocers', 'UK'),
(4, 'Euro Delights', 'Germany'),
(5, 'Healthy Harvest', 'USA'),
(6, 'Green Grocers', 'UK'),
(7, 'BioFarm', 'Germany'),
(8, 'Nature''s Best', 'USA'),
(9, 'EcoFoods', 'UK'),
(10, 'Alpine Produce', 'Germany');

-- Inserting sample data into Product table
INSERT INTO Product (Product_id, Product_Name, Supplier_id, Price, Kg) VALUES
(1, 'Apples', 1, 2.50, 1),
(2, 'Bananas', 1, 1.75, 1),
(3, 'Tomatoes', 1, 3.00, 1),
(4, 'Spinach', 2, 2.80, 0.5),
(5, 'Carrots', 2, 1.50, 1),
(6, 'Broccoli', 2, 2.20, 1),
(7, 'Potatoes', 3, 2.00, 1),
(8, 'Onions', 3, 1.80, 1),
(9, 'Cucumbers', 3, 1.90, 1),
(10, 'Bell Peppers', 4, 2.50, 1),
(11, 'Lettuce', 4, 2.25, 0.5),
(12, 'Zucchinis', 4, 2.00, 1),
(13, 'Oranges', 5, 2.20, 1),
(14, 'Grapes', 5, 3.50, 1),
(15, 'Strawberries', 5, 4.00, 0.5),
(16, 'Blueberries', 6, 5.50, 0.25),
(17, 'Raspberries', 6, 6.00, 0.25),
(18, 'Blackberries', 6, 4.75, 0.25),
(19, 'Cabbage', 7, 1.80, 1),
(20, 'Brussels Sprouts', 7, 2.20, 1),
(21, 'Mushrooms', 7, 2.50, 0.5),
(22, 'Pumpkins', 8, 3.00, 1),
(23, 'Squash', 8, 2.75, 1),
(24, 'Sweet Potatoes', 8, 2.80, 1),
(25, 'Kale', 9, 2.25, 0.5),
(26, 'Swiss Chard', 9, 2.75, 0.5),
(27, 'Artichokes', 9, 3.50, 0.5),
(28, 'Leeks', 10, 2.00, 1),
(29, 'Celery', 10, 2.20, 1),
(30, 'Asparagus', 10, 3.00, 1);




/* ______________________________________________________________________________
Solution
___________________________________________________________*/
select * from supplier; -- sample testing for supplier table
select * from Product;  -- sample testing for Product table 


SELECT 
    Product_Name,
    Country
FROM 
    (SELECT 
        p.Product_Name,
        p.Price,
        s.Country,
        ROW_NUMBER() OVER (PARTITION BY s.Country ORDER BY p.Price DESC) AS product_rank
     FROM 
        Product p
     INNER JOIN 
        Supplier s ON p.Supplier_id = s.Supplier_id) AS RankedProducts
WHERE 
    product_rank = 1;


