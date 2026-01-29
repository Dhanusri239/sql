SELECT
OrderID,
OrderDate,
ProductID,
Sales,
ROW_NUMBER() OVER(ORDER BY Sales DESC) Rankingsales
FROM Sales.Orders
