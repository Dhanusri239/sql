SELECT
OrderID,
OrderDate,
ProductID,
SUM(Sales) OVER(PARTITION BY CustomerID) TotalSales
FROM Sales.Orders