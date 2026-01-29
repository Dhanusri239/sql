SELECT
OrderDate,
OrderDate,
ProductID,
Sales,
AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) movingavg
FROM Sales.Orders