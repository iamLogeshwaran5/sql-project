use challenge;
-- Dropping the table if it exists and then recreating it
DROP TABLE IF EXISTS employee;

-- Creating the employee table
CREATE TABLE employee (
    EMP_ID INT PRIMARY KEY,
    SALARY DECIMAL(10, 2)
);

-- Inserting sample data into the employee table
INSERT INTO employee (EMP_ID, SALARY) VALUES
(1, 50000),
(2, 60000),
(3, 70000),
(4, 45000),
(5, 80000),
(6, 55000),
(7, 75000),
(8, 62000),
(9, 48000),
(10, 85000);

-- ----------------------------------------------
-- My solution
-- ----------------------------------------------

-- avg salary
-- salary > avg salary

-- SELECT AVG(salary) FROM employee; 63000

SELECT 
	emp_id,
	salary
FROM employee
WHERE salary < (SELECT AVG(salary) FROM employee)

