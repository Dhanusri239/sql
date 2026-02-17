
--Adding .ndf files to each group

ALTER DATABASE SalesDB ADD FILE
(
NAME=P_2023,--Logical name
FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2023.ndf'
) TO FILEGROUP FG_2023;


ALTER DATABASE SalesDB ADD FILE
(
NAME=P_2024,--Logical name
FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2024.ndf'
) TO FILEGROUP FG_2024;


ALTER DATABASE SalesDB ADD FILE
(
NAME=P_2025,--Logical name
FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2025.ndf'
) TO FILEGROUP FG_2025;


ALTER DATABASE SalesDB ADD FILE
(
NAME=P_2026,--Logical name
FILENAME= 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\P_2026.ndf'
) TO FILEGROUP FG_2026;


--Checking metadata

SELECT
    fg.name,
    mf.name,
    mf.physical_name,
    mf.size / 128 AS SizeInMB
FROM sys.filegroups fg
JOIN sys.master_files mf
ON fg.data_space_id = mf.data_space_id
AND mf.database_id = DB_ID();

--or

SELECT
    fg.name AS FileGroupName,
    df.name AS LogicalName,
    df.physical_name,
    df.size / 128 AS SizeInMB
FROM sys.filegroups fg
JOIN sys.database_files df
ON fg.data_space_id = df.data_space_id;


