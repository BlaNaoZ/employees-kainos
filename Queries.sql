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

-- Queries for user story 6
INSERT INTO Projects (ProjectName) VALUES ('NEW PROJECT NAME');

INSERT INTO Project_Employees (ProjectID, EmployeeID) VALUES ('Project ID', 'Employee ID');

SELECT p.ProjectName AS 'Project', e.Department, e.Name 
	FROM Employees e JOIN Project_Employees pe USING(EmployeeID) 
	JOIN Projects p USING(ProjectID)
    ORDER BY p.ProjectName ASC;
    
-- Queries for user story 7
SELECT p.ProjectName as 'Projects without employees' FROM Projects p
	WHERE NOT EXISTS (SELECT 1 FROM Project_Employees pe WHERE pe.ProjectID = p.ProjectID);
    
SELECT e.EmployeeID, e.Name as 'Employee without projects' FROM Employees e
	WHERE NOT EXISTS (SELECT 1 FROM Project_Employees pe WHERE pe.EmployeeID = e.EmployeeID);
    
SELECT COUNT(DISTINCT(e.EmployeeID)) as 'Employees on project' FROM Employees e
JOIN Project_Employees USING(EmployeeID)
WHERE ProjectID = '1';
