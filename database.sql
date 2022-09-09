CREATE DATABASE Web_Service_JadeN;
USE Web_Service_JadeN;

-- Setting up tables

-- Employee 'base' table, every Sales employee has a 1 - 1 link to an employee record
CREATE TABLE `Addresses` (
   	`AddressID` smallint NOT NULL UNIQUE AUTO_INCREMENT,
   	`AddressLineOne` varchar(70) UNIQUE NOT NULL,
	`Town` varchar(90),
	`County` varchar(30),
	`Postcode` varchar(10) NOT NULL,
	PRIMARY KEY (`AddressID`)
);

CREATE TABLE `Employees` (
    `EmployeeID` smallint NOT NULL UNIQUE AUTO_INCREMENT,
	`AddressID`smallint NOT NULL,
	`Name` varchar(30) NOT NULL,
	`StartingSalary` decimal(10,2),
	`BankNum` char(17),
	`NIN` char(9),
	`Department` ENUM('Sales', 'HR', 'Talent', 'Finance'),
    PRIMARY KEY (`EmployeeID`),
	FOREIGN KEY (`AddressID`) REFERENCES Addresses(`AddressID`)
);

CREATE TABLE `SalesEmployees` (
   	`EmployeeID` smallint NOT NULL UNIQUE,
   	`Commission` decimal(10,2),
   	`TotalSales` decimal(10, 2),
	PRIMARY KEY(`EmployeeID`),
	FOREIGN KEY (`EmployeeID`) REFERENCES Employees(`EmployeeID`)
);

CREATE TABLE `Projects` (
	`ProjectID` smallint NOT NULL UNIQUE AUTO_INCREMENT,
	`ProjectName` varchar(30) UNIQUE,
	PRIMARY KEY (ProjectID)
);

CREATE TABLE `Project_Employees` (
	`ProjectID` smallint NOT NULL,
	`EmployeeID` smallint NOT NULL,
	PRIMARY KEY (`ProjectID`, `EmployeeID`),
	FOREIGN KEY (`EmployeeID`) REFERENCES Employees(`EmployeeID`),
	FOREIGN KEY (`ProjectID`) REFERENCES Projects(`ProjectID`)
);

INSERT INTO Addresses (AddressLineOne, Town, County, Postcode)
VALUES
('6 Aberforth road', 'Avalon', 'West Midlands', 'B58 0vx'),
('7 Aberlake road', 'Avalon', 'West Midlands', 'b72'),
('8 Aberstuck close', 'Avalon', 'West Midlands', 'b87'),
('9 Aberlock road', 'Avalon', 'West Midlands', 'b62'),
('2 Amazon road', 'Canonica', 'West Midlands', 'b91'),
('6 Fair way', 'West World', 'West Midlands', 'b47');

INSERT INTO Employees (AddressID, `Name`, StartingSalary, Department)
VALUES
('1', 'Joe Bloggs', '10000.00', 'Sales'),
('2', 'Jane Doe', '10000.00', 'Sales'),
('3', 'Fred Jones', '10000.00', 'HR'),
('4', 'John Anderson', '15000.00', 'HR'),
('5', 'Mr Jones', '15000.00', 'Finance'),
('6', 'Frank Michaels', '20000.00', 'Talent');

INSERT INTO SalesEmployees (EmployeeID, Commission, TotalSales)
VALUES
(1, '200.00', '12000.00'),
(2, '100.00', '8000.00');

INSERT INTO Projects (ProjectName)
VALUES
('NHS app'),
('Netflix Processing'),
('Majestic Backend'),
('Random Project'),
('Fake Project'),
('Non-existant project');

INSERT INTO Project_Employees (EmployeeID, ProjectID)
VALUES
('1', '2'),
('1', '1'),
('2', 1),
('3', '1'),
('4', 3),
('5', '6');

