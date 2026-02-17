--Inserting Datas

INSERT INTO Sales.Orders_Partitioned VALUES(1,'2023-05-15',100);
INSERT INTO Sales.Orders_Partitioned VALUES(1,'2024-07-20',50);
INSERT INTO Sales.Orders_Partitioned VALUES(1,'2025-12-31',20);
INSERT INTO Sales.Orders_Partitioned VALUES(1,'2026-06-24',110);
--Checking

SELECT*FROM Sales.Orders_Partitioned
 
 --Or

 SELECT
 p.partition_number AS PartitionNumber,
 f.name AS PartitionFilegroup,
 p.rows AS NumberOfRows
 FROM sys.partitions p
 JOIN sys.destination_data_spaces dds
 ON p.partition_number=dds.destination_id
 JOIN sys.filegroups f
 ON dds.data_space_id=f.data_space_id
 WHERE OBJECT_NAME(p.object_id)='Orders_Partition