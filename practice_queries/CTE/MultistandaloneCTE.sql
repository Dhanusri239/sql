WITH CTE_total_sales AS
(
SELECT
CustomerID,
SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY CustomerID
),
CTE_Last_Orderdate AS
(
SELECT
      CustomerID,
      MAX(OrderDate) AS Lastorder
FROM Sales.Orders
GROUP BY CustomerID
)
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales,
clo.Lastorder
FROM Sales.Customers c
LEFT JOIN CTE_total_sales cts
ON cts.CustomerID=c.CustomerID
LEFT JOIN CTE_Last_Orderdate clo
ON clo.CustomerID=c.CustomerID
