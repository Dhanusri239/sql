SELECT
*,
COUNT(*) OVER() TotalCustomers,
COUNT(1) OVER() TotalCustomersOne,
COUNT(Score) OVER() TotalScore,
COUNT(Country) OVER() TotalCountry,
COUNT(LastName) OVER() TotalLastnames
FROM Sales.Customers