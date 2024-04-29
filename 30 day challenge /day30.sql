

-- Start transaction to ensure data integrity
START TRANSACTION;

-- Drop existing tables if they exist to avoid conflicts
DROP TABLE IF EXISTS ServiceRecords;
DROP TABLE IF EXISTS ServiceAppointments;
DROP TABLE IF EXISTS Mechanics;
DROP TABLE IF EXISTS Bikes;
DROP TABLE IF EXISTS Parts;
DROP TABLE IF EXISTS Customers;

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(200)
);

-- Create the Bikes table
CREATE TABLE Bikes (
    BikeID INT PRIMARY KEY,
    CustomerID INT,
    Model VARCHAR(50),
    Make VARCHAR(50),
    Year INT,
    BatteryType VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the Mechanics table
CREATE TABLE Mechanics (
    MechanicID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(100)
);

-- Insert a default mechanic needed for the initial appointment reference
INSERT INTO Mechanics VALUES (1, 'John', 'Doe', 'General Maintenance');

-- Create the ServiceAppointments table
CREATE TABLE ServiceAppointments (
    AppointmentID INT PRIMARY KEY,
    BikeID INT,
    Date DATE,
    Status VARCHAR(20),
    MechanicID INT,
    FOREIGN KEY (BikeID) REFERENCES Bikes(BikeID),
    FOREIGN KEY (MechanicID) REFERENCES Mechanics(MechanicID)
);

select * from ServiceAppointments;

-- Create the Parts table
CREATE TABLE Parts (
    PartID INT PRIMARY KEY,
    PartName VARCHAR(50),
    StockQuantity INT,
    Price DECIMAL(10, 2)
);

select * from Parts;

-- Create the ServiceRecords table
CREATE TABLE ServiceRecords (
    RecordID INT PRIMARY KEY,
    AppointmentID INT,
    PartID INT,
    QuantityUsed INT,
    FOREIGN KEY (AppointmentID) REFERENCES ServiceAppointments(AppointmentID),
    FOREIGN KEY (PartID) REFERENCES Parts(PartID)
);

-- Inserting more customers
INSERT INTO Customers VALUES (2, 'Bob Thompson', '555-0202', 'bob@example.com', '2345 Maple Avenue');
INSERT INTO Customers VALUES (3, 'Carmen Santiago', '555-0303', 'carmen@example.com', '3456 Oak Boulevard');
INSERT INTO Customers VALUES (4, 'David Park', '555-0404', 'david@example.com', '4567 Pine Street');
INSERT INTO Customers VALUES (5, 'Eva Lee', '555-0505', 'eva@example.com', '5678 Cedar Drive');

-- Inserting more bikes associated with the customers
INSERT INTO Bikes VALUES (102, 2, 'Model Y', 'Ola', 2021, 'Li-ion');
INSERT INTO Bikes VALUES (103, 3, 'Model S', 'Ather', 2020, 'Li-ion');
INSERT INTO Bikes VALUES (104, 4, 'Zero S', 'Hero', 2022, 'Li-ion');
INSERT INTO Bikes VALUES (105, 5, 'Energica Ego', 'TVS', 2022, 'Li-ion');

-- Inserting additional mechanics
INSERT INTO Mechanics VALUES (2, 'Sarah', 'Miller', 'Mechanical Systems');
INSERT INTO Mechanics VALUES (3, 'Alex', 'Johnson', 'Battery Management');
INSERT INTO Mechanics VALUES (4, 'Rita', 'Gupta', 'Software Issues');

-- Inserting more service appointments
INSERT INTO ServiceAppointments VALUES (1002, 102, '2024-05-10', 'Completed', 2);
INSERT INTO ServiceAppointments VALUES (1003, 103, '2024-05-15', 'Scheduled', 3);
INSERT INTO ServiceAppointments VALUES (1004, 104, '2024-05-20', 'Scheduled', 1);
INSERT INTO ServiceAppointments VALUES (1005, 105, '2024-05-25', 'Scheduled', 4);

-- Inserting more parts
INSERT INTO Parts VALUES (502, 'Front Tire', 20, 50.00);
INSERT INTO Parts VALUES (503, 'Rear Tire', 20, 50.00);
INSERT INTO Parts VALUES (504, 'Brake Pads', 30, 30.00);
INSERT INTO Parts VALUES (505, 'LED Headlight', 15, 45.00);

-- Inserting more service records
INSERT INTO ServiceRecords VALUES (2002, 1002, 502, 2); -- Front tires changed
INSERT INTO ServiceRecords VALUES (2003, 1003, 503, 2); -- Rear tires changed
INSERT INTO ServiceRecords VALUES (2004, 1004, 504, 4); -- Brake pads replaced
INSERT INTO ServiceRecords VALUES (2005, 1005, 505, 1); -- New LED headlight installed

-- Commit transaction to finalize changes
COMMIT;


SELECT A.AppointmentID, B.Model, A.Date, A.Status, M.FirstName, M.LastName
FROM ServiceAppointments A
JOIN Mechanics M ON A.MechanicID = M.MechanicID
JOIN Bikes B ON A.BikeID = B.BikeID;

SELECT A.AppointmentID, SUM(P.Price * S.QuantityUsed) AS TotalCost
FROM ServiceAppointments A
JOIN ServiceRecords S ON A.AppointmentID = S.AppointmentID
JOIN Parts P ON S.PartID = P.PartID
GROUP BY A.AppointmentID;


SELECT B.Model, A.Date AS ServiceDate, A.Status
FROM ServiceAppointments A
JOIN Bikes B ON A.BikeID = B.BikeID
ORDER BY B.Model, A.Date;





