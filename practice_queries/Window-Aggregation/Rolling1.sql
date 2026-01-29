SELECT
OrderDate,
OrderDate,
ProductID,
Sales,
AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate
ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) movingavg
FROM Sales.Orders