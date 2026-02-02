SELECT
CustomerID,
AVG(DayUntilNextOrder) AvgDays,
RANK() OVER(ORDER BY COALESCE(AVG(DayUntilNextOrder),999999)) RankAvg
FROM
(
SELECT
OrderId,
CustomerID,
OrderDate CurrentDate,
LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderId) NextOrder,
DATEDIFF(day,OrderDate,LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderId)) DayUntilNextOrder
FROM Sales.Orders
)t
GROUP BY CustomerID