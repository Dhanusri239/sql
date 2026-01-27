
SELECT
 Category,
 SUM(Sales) AS totalsales
 FROM(
SELECT
OrderID,
Sales,
CASE 
  WHEN Sales>50 THEN 'High'
  WHEN Sales BETWEEN 20 AND 50 THEN 'Medium'
  WHEN Sales=20 OR Sales<20 THEN 'Low'
END Category
FROM Sales.Orders
)t
GROUP BY Category
ORDER BY totalsales DESC;