SELECT
c.name AS Customer
FROM Customer c
LEFT JOIN Orders o
ON c.id=o.CustomerId
WHERE o.CustomerId IS NULL