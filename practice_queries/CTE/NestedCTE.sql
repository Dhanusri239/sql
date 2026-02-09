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
),
CTE_RANK_TOTALSALES AS
(
SELECT
     CustomerID,
     RANK() OVER( ORDER BY TotalSales DESC) Ranks
FROM CTE_total_sales
)

SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales,
clo.Lastorder,
cre.Ranks
FROM Sales.Customers c
LEFT JOIN CTE_total_sales cts
ON cts.CustomerID=c.CustomerID
LEFT JOIN CTE_Last_Orderdate clo
ON clo.CustomerID=c.CustomerID
LEFT JOIN CTE_RANK_TOTALSALES cre
ON cre.CustomerID=c.CustomerID

