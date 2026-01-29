SELECT
OrderDate,
OrderDate,
ProductID,
Sales,
MAX(Sales) OVER() HighestSale,
Min(Sales)OVER() lowestSale,
MAX(Sales) OVER(PARTITION BY ProductID)HighestSalebyprod,
Min(Sales) OVER(PARTITION BY ProductID) lowestSalebyprod,
MAX(Sales) OVER() - Sales  AS maxdiff, 
Sales -Min(Sales)OVER() AS Mindiff
FROM Sales.Orders