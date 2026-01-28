SELECT
OrderID,
OrderDate,
ProductID,
SUM(Sales) OVER(PARTITION BY ProductID) Totalsales
FROM Sales.Orders