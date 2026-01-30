SELECT
*,
CONCAT(Cumedistrank*100,'%') DistRankPercentage
FROM(
SELECT
Product,
Price,
CUME_DIST() OVER(ORDER BY Price DESC) Cumedistrank
FROM Sales.Products)t
WHERE Cumedistrank <= 0.4