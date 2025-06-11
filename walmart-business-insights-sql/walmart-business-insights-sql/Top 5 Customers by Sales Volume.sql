SELECT `Customer ID`,
       SUM(Total) AS total
FROM walmartsales
GROUP BY `Customer ID`
ORDER BY total DESC
LIMIT 5;
