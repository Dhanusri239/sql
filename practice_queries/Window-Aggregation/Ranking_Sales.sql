SELECT
OrderID,
OrderDate,
Sales,
RANK() OVER(ORDER BY Sales DESC) Rankingforsales
FROM Sales.Orders