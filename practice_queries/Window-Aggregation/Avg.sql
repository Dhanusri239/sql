SELECT
*
FROM
(SELECT
CustomerID,
Score,
Country,
AVG(Score) OVER() AvgSalesover,
AVG(Score) OVER(PARTITION BY Country) AvgSalesbyco,
AVG(COALESCE(Score,0)) OVER() AvgSales
FROM Sales.Customers
)t WHERE Score>AvgSales