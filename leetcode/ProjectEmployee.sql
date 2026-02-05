SELECT
p.project_id,
ROUND(AVG(experience_years),2) average_years
FROM Project p
JOIN Employee e
ON p.project_id=e.project_id
GROUP BY p.project_id;