SELECT
ProductID,
Product,
Price,
(SELECT COUNT(*)Orders FROM Sales.Orders) orders
FROM Sales.Products

