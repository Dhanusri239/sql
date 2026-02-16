	--Updating Statistics
	SELECT
	SCHEMA_NAME(t.schema_id) AS schemaname,
	t.name AS Tablename,
	s.name AS statisticname,
	sp.last_updated AS lastupdate,
	DATEDIFF(day,sp.last_updated,GETDATE()) AS Lastupdateday,
	sp.rows AS Rows,
	sp.modification_counter AS modificationlastchange
	FROM sys.stats s
	JOIN sys.tables t
	ON s.object_id=t.object_id
	CROSS APPLY sys.dm_db_stats_properties(s.object_id,s.stats_id) AS sp
	ORDER BY sp.modification_counter DESC;


	UPDATE STATISTICS Sales.DBCustomers
