
-- creating  a  Database
create database challenge;

-- using this Challenge Database
use challenge;


/* 1. You have two tables: Product and Supplier.
- Product Table Columns: Product_id, Product_Name, Supplier_id, Price
- Supplier Table Columns: Supplier_id, Supplier_Name, Country
*/

-- Write an SQL query to find the name of the product with the highest 
-- price in each country.
-- creating the product table 
-- creating supplier table 

CREATE TABLE suppliers(supplier_id int PRIMARY KEY,
					  supplier_name varchar(25),
					  country VARCHAR(25)
					  );

-- let's insert some values 
INSERT INTO suppliers
VALUES(501, 'alan', 'India'),
		(502, 'rex', 'US'),
		(503, 'dodo', 'India'),
		(504, 'rahul', 'US'),
		(505, 'zara', 'Canda'),
		(506, 'max', 'Canada')
;

CREATE TABLE products(

						product_id int PRIMARY KEY,
						product_name VARCHAR(25),
						supplier_id int,
						price float,
						FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
						);

INSERT INTO products
VALUES	(201, 'iPhone 14', '501', 1299),
		(202, 'iPhone 8', '502', 999),
		(204, 'iPhone 13', '502', 1199),
		(203, 'iPhone 11', '503', 1199),
		(205, 'iPhone 12', '502', 1199),
		(206, 'iPhone 14', '501', 1399),
		(214, 'iPhone 15', '503', 1499),
		(207, 'iPhone 15', '505', 1499),
		(208, 'iPhone 15', '504', 1499),
		(209, 'iPhone 12', '502', 1299),
		(210, 'iPhone 13', '502', 1199),
		(211, 'iPhone 11', '501', 1099),
		(212, 'iPhone 14', '503', 1399),
		(213, 'iPhone 8', '502', 1099)
;

-- adding more products 

INSERT INTO products (product_id, product_name, supplier_id, price)
VALUES
    (251, 'Samsung Galaxy Note 20 Ultra', 504, 1399),
    (252, 'Samsung Galaxy A72', 505, 499),
    (253, 'Google Pixel 4a', 501, 349),
    (254, 'Google Pixel 3a', 502, 399),
    (255, 'OnePlus Nord', 503, 499),
    (256, 'OnePlus 8T', 504, 749),
    (257, 'Xiaomi Redmi Note 10 Pro', 505, 279),
    (258, 'Xiaomi Poco X3', 501, 249),
    (259, 'Huawei Mate 40 Pro', 502, 1199),
    (260, 'Huawei P20 Lite', 503, 299),
    (261, 'Sony Xperia 10 II', 504, 379),
    (262, 'Sony Xperia L4', 505, 199),
    (263, 'LG Wing', 501, 999),
    (264, 'LG G7 ThinQ', 502, 599),
    (265, 'Motorola Moto G Power', 503, 249),
    (266, 'Motorola Moto E7 Plus', 504, 149),
    (267, 'ASUS ZenFone 7 Pro', 505, 799),
    (268, 'ASUS ROG Phone 3', 501, 999),
    (269, 'Nokia 5.3', 502, 199),
    (270, 'Nokia 2.4', 503, 139),
    (271, 'BlackBerry Evolve', 504, 449),
    (272, 'BlackBerry Keyone', 505, 299),
    (273, 'HTC U20 5G', 501, 599),
    (274, 'HTC Desire 19+', 502, 299),
    (275, 'Lenovo K11', 503, 199),
    (276, 'Lenovo K8 Note', 504, 249),
    (277, 'ZTE Axon 20', 505, 499),
    (278, 'ZTE Blade 10', 501, 249),
    (279, 'Oppo Reno 5 Pro', 502, 599),
    (280, 'Oppo A15', 503, 149),
    (281, 'Vivo V20 Pro', 504, 499),
    (282, 'Vivo Y20', 505, 199),
    (283, 'Realme X7 Pro', 501, 399),
    (284, 'Realme 7i', 502, 199),
    (285, 'Infinix Note 8', 503, 249),
    (286, 'Infinix Hot 10', 504, 149),
    (287, 'Tecno Camon 16 Premier', 505, 299),
    (288, 'Tecno Spark 6', 501, 129),
    (289, 'Poco M3', 502, 149),
    (290, 'Xiaomi Redmi 9T', 503, 199),
    (291, 'Samsung Galaxy M51', 504, 329),
    (292, 'Samsung Galaxy M31', 505, 249),
    (293, 'Google Pixel 5a', 501, 449),
    (294, 'Google Pixel 4 XL', 502, 899),
    (295, 'OnePlus 9R', 503, 599),
    (296, 'OnePlus Nord N10', 504, 299),
    (297, 'Xiaomi Redmi Note 9 Pro', 505, 249),
    (298, 'Xiaomi Redmi 9C', 501, 119),
    (299, 'Huawei Nova 7i', 502, 249),
    (300, 'Huawei Y9 Prime', 503, 199); 



SELECT * FROM suppliers;
SELECT * FROM products;

-- ----------------------------------------------
-- My solution
-- ----------------------------------------------

WITH CTE AS (SELECT 
		s.country,
		p.product_name,
		p.price,
		ROW_NUMBER()	OVER(PARTITION BY s.country ORDER BY p.price DESC) as rn
	FROM products as p
	JOIN suppliers as s
	ON s.supplier_id = p.supplier_id
	)
SELECT 
	product_name, price,
	country
FROM CTE
WHERE rn =1;

--  another approach!
SELECT
	product_name,
	price,
	country
FROM 
	(SELECT 
		s.country,
		p.product_name,
		p.price,
		ROW_NUMBER()	OVER(PARTITION BY s.country ORDER BY p.price DESC) as rn
	FROM products as p
	JOIN suppliers as s
	ON s.supplier_id = p.supplier_id) x1 -- using alias for the query 
WHERE rn = 1;


-- Q.2 

/* 
You have two tables: Customer and Transaction.
- Customer Table Columns: Customer_id, Customer_Name, Registration_Date
- Transaction Table Columns: Transaction_id, Customer_id, Transaction_Date, Amount

-- Write an SQL query to calculate the total transaction amount for each customer for the current year. 
The output should contain Customer_Name and the total amount.
*/

-- 1. find total transaction amt group by each customer filter with current year 
-- put where condition to check if the transaction are current year year 1  



-- Create Customer table
CREATE TABLE Customers (
    Customer_id INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Registration_Date DATE
);

-- Create Transaction table
CREATE TABLE Transaction (
    Transaction_id INT PRIMARY KEY,
    Customer_id INT,
    Transaction_Date DATE,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

-- Insert records into Customer table
INSERT INTO Customers (Customer_id, Customer_Name, Registration_Date)
VALUES
    (1, 'John Doe', '2023-01-15'),
    (2, 'Jane Smith', '2023-02-20'),
    (3, 'Michael Johnson', '2023-03-10');

-- Insert records into Transaction table
INSERT INTO Transaction (Transaction_id, Customer_id, Transaction_Date, Amount)
VALUES
    (201, 1, '2024-01-20', 50.00),
    (202, 1, '2024-02-05', 75.50),
    (203, 2, '2023-02-22', 100.00),
    (204, 3, '2022-03-15', 200.00),
    (205, 2, '2024-03-20', 120.75),
	(301, 1, '2024-01-20', 50.00),
    (302, 1, '2024-02-05', 75.50),
    (403, 2, '2023-02-22', 100.00),
    (304, 3, '2022-03-15', 200.00),
    (505, 2, '2024-03-20', 120.75);



SELECT * FROM customers;
SELECT * FROM transaction;




-- ----------------------------------------------
-- My solution
-- ----------------------------------------------



SELECT c.customer_name,c.customer_id,SUM(t.amount) total_amt
FROM customers as c
JOIN transaction as t
ON c.customer_id = t.customer_id
WHERE EXTRACT(YEAR FROM t.Transaction_Date) =  EXTRACT(YEAR FROM current_date) 
GROUP BY 1, 2;

-- verifying it
SELECT	SUM(amount)
FROM Transaction
WHERE customer_id = 1 AND EXTRACT(YEAR FROM Transaction_Date) = '2024'





