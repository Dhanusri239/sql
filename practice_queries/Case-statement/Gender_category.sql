SELECT
EmployeeID,
Gender,
CASE 
    WHEN Gender='M' THEN 'Male' 
	WHEN Gender='F' THEN 'Female'
END Genderinfulltxt
FROM Sales.Employees