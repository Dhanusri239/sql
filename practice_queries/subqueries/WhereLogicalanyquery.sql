SELECT
EmployeeID,
Gender,
Salary
FROM Sales.Employees
WHERE Gender='F' AND Salary > ANY(SELECT
Salary
FROM Sales.Employees
WHERE Gender='M')