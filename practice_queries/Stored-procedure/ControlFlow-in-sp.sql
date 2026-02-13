
ALTER PROCEDURE Storedvalues @Country NVARCHAR(50)='USA' AS
BEGIN
DECLARE @totalcus INT,@Avgscore FLOAT;

IF EXISTS(SELECT 1 FROM Sales.Customers WHERE Score IS NULL AND Country=@Country)
BEGIN
PRINT ('UPDATING NULL SCORE TO 0');
UPDATE Sales.Customers
SET Score=0
WHERE Score IS NULL AND Country=@Country
END

ELSE
BEGIN
PRINT('NO NULL SCORE IS FOUND');
END

SELECT
@totalcus=COUNT(*),
@Avgscore=COALESCE(AVG(Score),0)
FROM Sales.Customers
WHERE Country=@Country;

PRINT 'TOTAL CUSTOMER FROM '+ @Country +':'+CAST(@totalcus AS NVARCHAR);
PRINT 'AVG SCORE FROM '+ @Country +':'+CAST(@Avgscore AS NVARCHAR);

SELECT
COUNT(OrderID) totalorder,
SUM(Sales) Totalsales
FROM Sales.Orders o
JOIN Sales.Customers c
ON o.CustomerID=c.CustomerID
WHERE Country=@Country;
END

EXEC Storedvalues

