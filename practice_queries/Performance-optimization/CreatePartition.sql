--Step 1:Creating Partition Function

CREATE PARTITION FUNCTION PartitionByYear(DATE)
AS RANGE LEFT FOR VALUES('2024-12-31','2025-12-31','2026-12-31')

--Checking Partition Function

SELECT
name,
function_id,
type,
type_desc,
boundary_value_on_right
From sys.partition_functions



