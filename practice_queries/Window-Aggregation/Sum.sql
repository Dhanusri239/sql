SELECT
OrderID,
OrderDate,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesbyproduct
FROM Sales.Orders