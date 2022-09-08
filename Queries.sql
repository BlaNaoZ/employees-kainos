USE Web_Service_JadeD;


SELECT Department, COUNT(DISTINCT(Department))
FROM Employees 
GROUP BY Department;

SELECT EmployeeID, Name, (StartingSalary * 0.75) AS GrossPay
From Employees
WHERE Department != 'Sales';

SELECT Employees.EmployeeID, Name, (Commission * TotalSales / 100) AS GrossPay
FROM Employees, SalesEmployees
WHERE Department = 'Sales' AND Employees.EmployeeID = SalesEmployees.EmployeeID;