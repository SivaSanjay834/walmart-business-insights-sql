SELECT `Customer type`, `Product line`, COUNT(`Product line`) AS Product_Count
FROM walmartsales
GROUP BY `Customer type`, `Product line`
ORDER BY `Customer type`, Product_Count DESC;
