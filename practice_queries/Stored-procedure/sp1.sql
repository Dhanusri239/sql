
CREATE PROCEDURE Storedvalues AS
BEGIN
SELECT
COUNT(*) totalUScustomer,
COALESCE(AVG(Score),0) Avgscore
FROM Sales.Customers
WHERE Country='USA'
END

