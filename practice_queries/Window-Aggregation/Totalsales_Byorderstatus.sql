SELECT
OrderID,
OrderDate,
ProductID,
OrderStatus,
SUM(Sales) OVER(PARTITION BY ProductID,OrderStatus) Totalsales
FROM Sales.Orders