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
),
CTE_Customer_Segments AS
(
SELECT
CustomerID,
CASE
    WHEN TotalSales>100 THEN 'HIGH'
	WHEN TotalSales >50 THEN 'MEDIUM'
	ELSE 'LOW'
END AS Segements
FROM CTE_total_sales
)


SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales,
clo.Lastorder,
cre.Ranks,
ces.Segements
FROM Sales.Customers c
LEFT JOIN CTE_total_sales cts
ON cts.CustomerID=c.CustomerID
LEFT JOIN CTE_Last_Orderdate clo
ON clo.CustomerID=c.CustomerID
LEFT JOIN CTE_RANK_TOTALSALES cre
ON cre.CustomerID=c.CustomerID
LEFT JOIN CTE_Customer_Segments ces
ON ces.CustomerID=c.CustomerID

