SELECT
CustomerID,
LastName,
AVG(CASE
   WHEN Score IS NULL THEN 0
   ELSE Score
   END) OVER() avgscores
FROM Sales.Customers
