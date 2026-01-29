SELECT
OrderID,
OrderDate,
ProductID,
Sales,
DENSE_RANK() OVER(ORDER BY Sales DESC) Rankingsales
FROM Sales.Orders
