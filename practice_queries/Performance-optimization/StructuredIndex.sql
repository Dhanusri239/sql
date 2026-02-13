SELECT*
INTO Sales.DBCustomers
FROM Sales.Customers

CREATE CLUSTERED INDEX idx_customerdb_cusid
ON Sales.DBCustomers(CustomerID)

CREATE  INDEX idx_customerdb_lastname
ON Sales.DBCustomers(LastName)


CREATE  INDEX idx_customerdb_firststname
ON Sales.DBCustomers(FirstName)