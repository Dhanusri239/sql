SELECT*
FROM(
SELECT
CustomerID,
SUM(Sales) TotalSales,
ROW_NUMBER() OVER(ORDER BY SUM(Sales)) Rankingsales
FROM Sales.Orders
GROUP BY CustomerID)t
WHERE Rankingsales<=2