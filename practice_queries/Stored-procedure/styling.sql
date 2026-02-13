
ALTER PROCEDURE Storedvalues @Country NVARCHAR(50)='USA' AS
BEGIN
    BEGIN TRY
		DECLARE @totalcus INT,@Avgscore FLOAT;
		--=====================================
		--STEP1:PREPARE AND CLEANUP THE DATA
		--====================================

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
			--==================================
			--STEP2:GENERATING SUMMARY REPORT
			--==================================
			--Calculate Total Customer and Average Report for specific Country
			SELECT
			@totalcus=COUNT(*),
			@Avgscore=COALESCE(AVG(Score),0)
			FROM Sales.Customers
			WHERE Country=@Country;

			PRINT 'TOTAL CUSTOMER FROM '+ @Country +':'+CAST(@totalcus AS NVARCHAR);
			PRINT 'AVG SCORE FROM '+ @Country +':'+CAST(@Avgscore AS NVARCHAR);
			--Calculate Total Number of order and Total sales for specific Country
			SELECT
			COUNT(OrderID) totalorder,
			SUM(Sales) Totalsales
			FROM Sales.Orders o
			JOIN Sales.Customers c
			ON o.CustomerID=c.CustomerID
			WHERE Country=@Country;
	END TRY

	BEGIN CATCH
	       --=================================
	       --Error handling
		   --=================================
			PRINT(' AN ERROR OCCURED:');
			PRINT('ERROR IS:'+ERROR_MESSAGE());
			PRINT('ERROR LINE IS :'+CAST(ERROR_LINE() AS NVARCHAR));
			PRINT(' AN ERROR PROCEDURE IS :'+ERROR_PROCEDURE());
	END CATCH
END

EXEC Storedvalues

