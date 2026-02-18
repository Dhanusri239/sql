--#TIP11=FILTER DATA BEFORE JOIN
--BEFORE(WHERE)
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
WHERE o.OrderStatus='delivered'
--DURING(ON)
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID AND o.OrderStatus='Delivered'
--AFTER(SUBQUERY)
SELECT
c.FirstName
FROM Sales.Customers c
INNER JOIN (SELECT CustomerID,OrderID FROM Sales.Orders WHERE OrderStatus='Delivered')o
ON c.CustomerID=o.CustomerID



--#TIP12=AGGREGATE BEFORE JOINING
--GROUPING AND JOINING
--BEST FOR SMALL TABLES
SELECT
c.FirstName,
o.OrderID,
COUNT(o.OrderID) AS OrderCount
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
WHERE o.OrderStatus='delivered'
GROUP BY c.CustomerID,c.FirstName
--PRE-AGGREGATED-SUBQUERY
--BEST FOR LARGE TABLE
SELECT
c.FirstName,
c.OrderID,
o.OrderCount
FROM Sales.Customers c
INNER JOIN(
SELECT
CustomerID,
COUNT(o.OrderID) AS OrderCount
FROM Sales.Orders
GROUP BY CustomerID)o
ON c.CustomerID=o.CustomerID
--BAD
--CORRELATED SUBQUERY
SELECT
c.CustomerID,
c.FirstName,
(SELECT COUNT(o.OrderID)
FROM Sales.Orders o
c.CustomerID=o.CustomerID)AS OrderCount
FROM Sales.Customer c

--#TIP13=USE UNION INSTEAD OF OR IN JOINS
--BAD 
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
OR c.CustomerID= o.SalespersonID
--GOOD
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
UNION
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID= o.SalespersonID

--#TIP14=CHECK FOR NESTED LOOPS AND USE SQL HINTS
--BAD
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
--GOOD
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
OPTION(HASH JOIN)

--#TIP15=USE UNION ALL INSTEAD OF UNION IF DUPLICATES ARE ALLOWED
--BAD
SELECT CustomerID FROM Sales.Customers
UNION
SELECT CustomerID FROM Sales.Orders
--GOOD
SELECT CustomerID FROM Sales.Customers
UNION ALL
SELECT CustomerID FROM Sales.Orders

--#TIP16= USE UNION ALL+ DISTINCT IF DUPLICATES ARE NOT ALLOWED
--BAD
SELECT CustomerID FROM Sales.Customers
UNION
SELECT CustomerID FROM Sales.Orders
--GOOD
SELECT DISTINCT CustomerID FROM (
SELECT CustomerID FROM Sales.Customers
UNION ALL
SELECT CustomerID FROM Sales.Orders)AS combined

--#TIP17=USE COLOUMNSTORE INDEX FOR AGGEREGATION ON LARGE TABLE
--BAD
SELECT
CustomerID,
COUNT(OrderID) AS OrderCount
FROM Sales.Orders

CREATE CLUSTERED COLUMNSTORE INDEX Idx_col_count ON Sales.Orders

--#TIP18=PRE AGGEREGATE THE DATA AND STORE IT IN THE NEW TABLE
--BAD
SELECT
MONTH(OrderDate) AS mon,SUM(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY MONTH(OrderDate)
--GOOD
SELECT
MONTH(OrderDate) AS mon,SUM(Sales) AS TotalSales
INTO Sales.summary
FROM Sales.Orders
GROUP BY MONTH(OrderDate)
--Getting Data
SELECT
mon,TotalSales
From Sales.summary
