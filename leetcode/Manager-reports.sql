SELECT
m.employee_id,
m.name,
COUNT(e.reports_to)reports_count,
ROUND(AVG(e.age),0) average_age
FROM Employees m
JOIN Employees e
ON m.employee_id=e.reports_to
GROUP BY m.employee_id,m.name
ORDER BY m.employee_id