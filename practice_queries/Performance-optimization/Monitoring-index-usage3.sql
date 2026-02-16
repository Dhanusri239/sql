--Monitoring index usage
--Identify Duplicates
SELECT
 tbl.name AS Tablename,
 col.name AS IndexColumn,
 idx.name AS indexName,
 idx.type_desc AS Indextype,
 COUNT(*) OVER(PARTITION BY tbl.name,col.name) Countcolumn
 FROM sys.indexes idx
 JOIN sys.tables tbl
 ON idx.object_id=tbl.object_id
 JOIN  sys.index_columns ic
 ON idx.object_id=ic.object_id
 AND idx.index_id=ic.index_id
 JOIN sys.columns col
 ON ic.object_id=col.object_id AND ic.column_id=col.column_id
 ORDER BY Countcolumn DESC