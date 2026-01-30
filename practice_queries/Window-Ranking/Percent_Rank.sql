SELECT
*,
CONCAT(Percentrank*100,'%') PercentRankPercentage
FROM(
SELECT
Product,
Price,
PERCENT_RANK() OVER(ORDER BY Price DESC) Percentrank
FROM Sales.Products)t
WHERE Percentrank <= 0.6