SELECT
*
FROM Sales.Orders
WHERE CustomerID NOT IN (SELECT
CustomerID
FROM Sales.Customers
WHERE Country='Germany' )
