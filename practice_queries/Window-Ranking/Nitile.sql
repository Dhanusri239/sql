SELECT
OrderID,
Sales,
NTILE(1) OVER(ORDER BY Sales DESC) onebucket,
NTILE(2) OVER(ORDER BY Sales DESC) Twobucket,
NTILE(3) OVER(ORDER BY Sales DESC) Threebucket,
NTILE(4) OVER(ORDER BY Sales DESC) Fourbucket,
NTILE(5) OVER(ORDER BY Sales DESC) Fivebucket
FROM Sales.Orders