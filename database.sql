CREATE DATABASE Web_Service_JadeN;
USE Web_Service_JadeN;

-- Setting up tables

-- Employee 'base' table, every Sales & Delivery employee has a 1 - 1 link to an employee record
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

