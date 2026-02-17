--30X TIPS

--#TIP1=SELECT ONLY NEEDED

--BAD
SELECT*
FROM Sales.Customers
--GOOD
SELECT
CustomerID,
FirstName
FROM Sales.Customers

--#TIP2=AVOID UNECESSARY DISTINCT AND ORDERBY
--BAD
SELECT
DISTINCT FirstName
FROM Sales.Customers
ORDER BY FirstName
---GOOD
SELECT FirstName
FROM Sales.Customers

--#TIP3=FOR EXPLORATION PURPOSE-LIMIT THE ROWS
--BAD
SELECT FirstName
FROM Sales.Customers
--GOOD
SELECT TOP 3
FirstName,
Score
FROM Sales.Customers

--#TIP4=FILTERING DATA
SELECT*FROM Sales.Orders WHERE OrderStatus='Delivered'

CREATE NONCLUSTERED INDEX Idx_Orders_Orderstatus ON Sales.Orders(OrderStatus)

--#TIP5=AVOID APPLYING FUNCTIONS TO COULUMN IN WHERE CLAUSE
SELECT
*
FROM Sales.Orders
WHERE LOWER(OrderStatus)='delivered'--function avoid indexes



