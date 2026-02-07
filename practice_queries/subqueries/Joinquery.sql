SELECT
*
FROM Sales.Customers c
LEFT JOIN(
         SELECT
         CustomerID,
         COUNT(*) TotalOrders
         FROM Sales.Orders
         GROUP BY CustomerID
         )o
ON c.CustomerID=o.CustomerID
