SELECT
EmployeeID,
Gender,
Salary
FROM Sales.Employees
WHERE Gender='F' AND Salary > ALL(SELECT
Salary
FROM Sales.Employees
WHERE Gender='M')