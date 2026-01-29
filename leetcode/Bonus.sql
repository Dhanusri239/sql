SELECT
e.name,
b.bonus
FROM Employee e
LEFT JOIN bonus b
ON e.id=b.id
WHERE b.bonus<500 OR b.bonus IS NULL;