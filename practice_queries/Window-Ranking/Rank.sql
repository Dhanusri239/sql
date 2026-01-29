SELECT
OrderID,
OrderDate,
ProductID,
Sales,
RANK() OVER(ORDER BY Sales DESC) Rankingsales
FROM Sales.Orders
