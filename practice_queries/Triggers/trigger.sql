--Creating new table to use trigger
CREATE TABLE Sales.EmployeeLogs(
   logID  INT IDENTITY(1,1) PRIMARY KEY,
   EmployeeID INT,
   Logmessage NVARCHAR(255),
   LogDate DATE
)
--creating trigger
CREATE TRIGGER TRG_afterInsertOnEmployee ON Sales.Employees
AFTER INSERT
AS
BEGIN
 INSERT INTO Sales.EmployeeLogs(EmployeeID,Logmessage,LogDate)
 SELECT
     EmployeeID,
	 'New Employee added= '+ CAST(EmployeeID AS VARCHAR),
	 GETDATE()
	 FROM INSERTED
END
--checking the results
SELECT
*
FROM Sales.EmployeeLogs
--triggering triggers
INSERT INTO Sales.Employees
VALUES(6,'MARIA','DOE','HR','1978-01-02','F',80000,3);