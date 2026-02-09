SELECT
IFNULL(u.unique_id,null) AS unique_id,
e.name
FROM Employees e
LEFT JOIN EmployeeUNI u
ON e.id=u.id

