SELECT*
FROM Sales.Customers
WHERE Country='USA' AND Score>300

CREATE CLUSTERED COLUMNSTORE INDEX idx_customerdb_countryscore
ON Sales.DBCustomers