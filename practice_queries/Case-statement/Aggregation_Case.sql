SELECT
CustomerID,
SUM(CASE 
       WHEN Sales>30 THEN 1
	   ELSE 0
END) avgsales1,
COUNT(*) totalorders
FROM Sales.Orders
GROUP BY CustomerID