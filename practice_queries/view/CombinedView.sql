CREATE VIEW Sales.OrderedDetails AS
(SELECT
o.OrderID,
o.OrderDate,
p.Product,
COALESCE(c.FirstName,'')+' '+COALESCE(c.LastName,'') AS customername,
c.Country AS CusomerCountry,
COALESCE(c.FirstName,'')+' '+COALESCE(c.LastName,'') AS SalesPersonName,
e.Department,
p.Category,
o.Sales,
o.Quantity
FROM Sales.Orders o
LEFT JOIN Sales.Products p
ON p.ProductID=o.ProductID
LEFT JOIN Sales.Customers c
ON c.CustomerID=o.CustomerID
LEFT JOIN Sales.Employees e
ON e.EmployeeID=o.SalesPersonID
 )