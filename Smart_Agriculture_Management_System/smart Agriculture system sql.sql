
-- CREATE DATABASE

DROP DATABASE IF EXISTS SmartAgricultureDB;

CREATE DATABASE SmartAgricultureDB;
USE SmartAgricultureDB;


-- TABLES


CREATE TABLE Farmer (
    FarmerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Contact VARCHAR(20) NOT NULL
);

CREATE TABLE Farm (
    FarmID INT AUTO_INCREMENT PRIMARY KEY,
    FarmerID INT NOT NULL,
    FarmName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    FOREIGN KEY (FarmerID) REFERENCES Farmer(FarmerID)
);

CREATE TABLE Crop (
    CropID INT AUTO_INCREMENT PRIMARY KEY,
    FarmID INT NOT NULL,
    CropName VARCHAR(50) NOT NULL,
    Status VARCHAR(30) NOT NULL,
    FOREIGN KEY (FarmID) REFERENCES Farm(FarmID)
);

CREATE TABLE YieldData (
    YieldID INT AUTO_INCREMENT PRIMARY KEY,
    CropID INT NOT NULL,
    Quantity DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CropID) REFERENCES Crop(CropID)
);

CREATE TABLE AuditLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    Message VARCHAR(100),
    LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- INSERT DATA


-- Farmers
INSERT INTO Farmer (Name, Contact)
VALUES
('Ali Khan', '03001234567'),
('Ahmed Raza', '03111222333'),
('Sara Malik', '03221234567'),
('Usman Tariq', '03331234567');

-- Farms
INSERT INTO Farm (FarmerID, FarmName, Location)
VALUES
(1, 'Rawal Mango Farm', 'Multan'),
(2, 'Ayub Agri Farm', 'Lahore'),
(3, 'Khagga Farm', 'Faisalabad'),
(4, 'Fresh Valley Farm', 'Bahawalpur');

-- Crops
INSERT INTO Crop (FarmID, CropName, Status)
VALUES
(1, 'Wheat', 'Healthy'),
(2, 'Rice', 'Growing'),
(3, 'Cotton', 'Healthy'),
(4, 'Maize', 'Harvested');

-- Yield Data
INSERT INTO YieldData (CropID, Quantity)
VALUES
(1, 1200.00),
(2, 1800.00),
(3, 950.00),
(4, 1500.00);

-- SELECT QUERIES

-- Display all farmers
SELECT * FROM Farmer;

-- Display all crops
SELECT * FROM Crop;

-- WHERE Clause
SELECT *
FROM Crop
WHERE Status = 'Healthy';

-- ORDER BY
SELECT *
FROM Farmer
ORDER BY Name ASC;


-- AGGREGATE FUNCTIONS

SELECT COUNT(*) AS TotalFarmers
FROM Farmer;

SELECT SUM(Quantity) AS TotalYield
FROM YieldData;

SELECT AVG(Quantity) AS AverageYield
FROM YieldData;

SELECT MAX(Quantity) AS HighestYield
FROM YieldData;

SELECT MIN(Quantity) AS LowestYield
FROM YieldData;

-- JOIN

SELECT
    Farmer.Name,
    Farm.FarmName,
    Farm.Location
FROM Farmer
INNER JOIN Farm
ON Farmer.FarmerID = Farm.FarmerID;

-- Farmer + Farm + Crop

SELECT
    Farmer.Name,
    Farm.FarmName,
    Crop.CropName,
    Crop.Status
FROM Farmer
INNER JOIN Farm
ON Farmer.FarmerID = Farm.FarmerID
INNER JOIN Crop
ON Farm.FarmID = Crop.FarmID;


-- UPDATE


UPDATE Crop
SET Status = 'Harvested'
WHERE CropID = 1;

-- Verify Update
SELECT * FROM Crop;

-- DELETE

DELETE FROM YieldData
WHERE YieldID = 1;

-- Verify Delete
SELECT * FROM YieldData;

-- VIEW

CREATE OR REPLACE VIEW CropView AS
SELECT
    CropName,
    Status
FROM Crop;

SELECT * FROM CropView;

-- STORED PROCEDURE

DELIMITER $$

CREATE PROCEDURE CropReport()
BEGIN
    SELECT
        CropID,
        CropName,
        Status
    FROM Crop;
END $$

DELIMITER ;

-- Execute Procedure
CALL CropReport();

-- TRIGGER
DELIMITER $$

CREATE TRIGGER YieldLog
AFTER INSERT ON YieldData
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (Message)
    VALUES ('New Yield Added');
END $$

DELIMITER ;

-- TEST TRIGGER

INSERT INTO YieldData (CropID, Quantity)
VALUES (1, 1500.00);

-- Check Trigger Output
SELECT * FROM AuditLog;


-- FINAL TABLES

SELECT * FROM Farmer;
SELECT * FROM Farm;

SELECT * FROM Crop;

SELECT * FROM YieldData;

SELECT * FROM AuditLog;

SELECT * FROM CropView;