SELECT*
FROM(
SELECT
OrderDate,
ProductID,
Sales,
ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) Rankingsales
FROM Sales.Orders)t
WHERE Rankingsales=1