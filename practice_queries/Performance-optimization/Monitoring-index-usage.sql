--List all indexes 

sp_helpindex 'Sales.DBCustomers'


--Monitoring index usage
SELECT
 tbl.name AS Tablename,
 idx.name AS Indexname,
 idx.type_desc AS indexType,
 idx.is_primary_key AS Isprimarykey,
 idx.is_unique AS isunique,
 idx.is_disabled AS disabled,
 s.user_seeks,
 s.user_scans,
 s.user_lookups,
 s.user_updates
 FROM sys.indexes idx
 JOIN sys.tables tbl
 ON idx.object_id=tbl.object_id
 LEFT JOIN  sys.dm_db_index_usage_stats s
 ON s.object_id=idx.object_id
 AND s.index_id=idx.index_id
 ORDER BY tbl.name,idx.name