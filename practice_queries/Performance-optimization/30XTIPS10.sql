--#TIP6=AVOID LEADING WILDCARDS IN WHERE CLAUSE--As it prevent index usage
--Bad
SELECT*
FROM Sales.Customers
WHERE LastName LIKE '%Gold%'
--Good
SELECT*
FROM Sales.Customers
WHERE LastName LIKE 'Gold%'

--#TIP7=USE IN INSTEAD OF MULTIPLE OR OPERATOR
--Bad
SELECT
*
FROM Sales.Customers
WHERE CustomerID=1	OR CustomerID=2 OR CustomerID=3
--Good
SELECT
*
FROM Sales.Customers
WHERE CustomerID IN(1,2,3)

--#TIP8=USE JOIN 
--BEST
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
--Slightly slower
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
--Worst
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
OUTER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID

--#TIP9=USE EXPLICIT JOIN INSTEAD OF IMPLICIT JOIN
--Bad
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c, Sales.Orders o
WHERE c.CustomerID=o.CustomerID
--Good
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID

--#TIP10=MAKE SURE COLOUMN USED ON CLAUSE SHOULD HAVE INDEX

SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID

CREATE NONCLUSTERED INDEX Idx_id ON Sales.Orders(CustomerID)
