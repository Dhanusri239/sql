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
--#TIP19=JOIN VS EXISTS VS IN
--JOIN(BEST ID IT PERFORMS EQUAL TO EXISTS )
SELECT
c.FirstName,
o.OrderID
FROM Sales.Customers c
INNER JOIN Sales.Orders o
ON c.CustomerID=o.CustomerID
WHERE o.OrderStatus='delivered'
--Exists(BEST FOR LARGE TABLE)
SELECT
c.FirstName
FROM Sales.Customers c
WHERE EXISTS(
SELECT
*
FROM Sales.Orders o
WHERE o.CustomerID=c.CustomerID)
--IN(BAD)
SELECT
c.FirstName
FROM Sales.Customers c
WHERE IN(
SELECT
*
FROM Sales.Orders o
WHERE o.CustomerID=c.CustomerID)
--#TIP20=AVOID REDUNDANCY
--BAD
SELECT*
FROM Sales.Employees
WHERE Salary>AVG(Salary)
UNION ALL
SELECT*
FROM Sales.Employees
WHERE Salary>AVG(Salary)
UNION ALL
--GOOD
SELECT
*,
CASE 
   WHEN Salary>AVG(Salary) THEN 'HIGH'
   ELSE 'LOW'
END
FROM Sales.Employees
