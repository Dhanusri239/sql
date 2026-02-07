SELECT
*,
(SELECT COUNT(*) FROM Sales.Orders o WHERE o.CustomerID=c.CustomerID)
FROM Sales.Customers c