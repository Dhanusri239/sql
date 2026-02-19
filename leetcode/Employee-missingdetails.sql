SELECT e.employee_id
FROM Employees e
LEFT JOIN Salaries j
ON e.employee_id = j.employee_id
WHERE j.employee_id IS NULL

UNION

SELECT j.employee_id
FROM Salaries j
LEFT JOIN Employees e
ON e.employee_id = j.employee_id
WHERE e.employee_id IS NULL

ORDER BY employee_id;
