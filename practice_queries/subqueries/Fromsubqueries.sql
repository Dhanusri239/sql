SELECT
CustomerID,
sums,
RANK() OVER ( ORDER BY sums DESC) SalesRanks
FROM
(SELECT
CustomerID,
SUM(Sales) sums
FROM Sales.Orders
GROUP BY CustomerID)t
