
SELECT
OrderID,
OrderDate,
SUM(Sales) OVER() Totalsales
FROM Sales.Orders