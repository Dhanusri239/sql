SELECT
*,
ROUND(CAST((CurrentSalesMonth-PreviousSales) AS FLOAT) / PreviousSales * 100 ,1) AS mom_val
FROM
(SELECT
MONTH(OrderDate) OrderMonth,
SUM(Sales) CurrentSalesMonth,
LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) PreviousSales
FROM Sales.Orders
GROUP BY MONTH(OrderDate)
)t