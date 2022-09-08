USE Web_Service_JadeD;


SELECT Department, COUNT(Department) AS NumberOfPeople
FROM Employees 
GROUP BY Department;

SELECT Department, EmployeeID, Name
FROM Employees
ORDER BY Department;


SELECT EmployeeID, Name, (StartingSalary * 0.75) AS GrossPay
From Employees
WHERE Department != 'Sales'
UNION
SELECT Employees.EmployeeID, Name, (Commission * TotalSales / 100) AS GrossPay
FROM Employees, SalesEmployees
WHERE Department = 'Sales' AND Employees.EmployeeID = SalesEmployees.EmployeeID;

SELECT TotalSales, SalesEmployees.EmployeeID
FROM SalesEmployees
WHERE TotalSales = (SELECT MAX(TotalSales) FROM SalesEmployees);
