SELECT
w.id AS id
FROM Weather w
JOIN Weather y
ON w.recordDate = DATE_ADD(y.recordDate, INTERVAL 1 DAY)
WHERE w.temperature > y.temperature;    