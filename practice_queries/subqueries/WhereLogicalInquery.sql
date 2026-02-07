SELECT
*
FROM Sales.Orders
WHERE CustomerID IN (SELECT
CustomerID
FROM Sales.Customers
WHERE Country='Germany' )
