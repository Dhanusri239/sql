SELECT*
INTO Sales.ordertest
FROM #orders
WHERE OrderStatus='Delivered'
