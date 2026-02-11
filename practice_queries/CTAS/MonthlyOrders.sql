
SELECT
DATENAME(MONTH,OrderDate) OrderDatebyMonth,
COUNT(*) TotalOrders
INTO Sales.Monthlyorders
FROM Sales.Orders
GROUP BY DATENAME(MONTH,OrderDate)


SELECT*
FROM Sales.Monthlyorders