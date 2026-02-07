SELECT
*
FROM Sales.Products
WHERE Price > (SELECT
				AVG(Price) avgprice
				FROM Sales.Products
				)