
SELECT
employee_id,
CASE 
    WHEN employee_id%2!=0 AND LEFT(name,1)!='M' THEN salary
    ELSE salary=0
END AS bonus
FROM Employees 
ORDER BY employee_id ASC