SELECT
*
FROM Sales.Orders o
WHERE EXISTS (SELECT
*
FROM Sales.Customers c
WHERE Country='Germany' AND o.CustomerID=c.CustomerID )
