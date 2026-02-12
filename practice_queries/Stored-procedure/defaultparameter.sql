
ALTER PROCEDURE Storedvalues @Country NVARCHAR(50)='USA' AS
BEGIN
SELECT
COUNT(*) totalUScustomer,
COALESCE(AVG(Score),0) Avgscore
FROM Sales.Customers
WHERE Country=@Country
END

EXEC Storedvalues