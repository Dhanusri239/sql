SELECT
name
FROM SalesPerson
WHERE sales_id NOT IN(
    SELECT sales_id
    FROM Orders o
    JOIN Customer c
    ON o.com_id= c.com_id
    WHERE c.Country='RED'
)