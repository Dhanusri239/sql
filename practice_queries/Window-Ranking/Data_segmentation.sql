SELECT
*,
CASE WHEN ranks=1 THEN 'High'
     WHEN ranks=2 THEN 'Medium'
	 WHEN ranks=3 THEN 'Low'
END Salessgementation
FROM(
SELECT
OrderDate,
Sales,
NTILE(3) OVER (ORDER BY Sales DESC) ranks
FROM Sales.Orders)t