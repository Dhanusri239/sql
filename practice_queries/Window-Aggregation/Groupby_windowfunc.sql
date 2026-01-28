SELECT
CustomerID,
SUM(Sales) ToatalSales,
RANK() OVER (ORDER BY SUM(Sales) DESC) RankingSales
FROM Sales.Orders
GROUP BY CustomerID