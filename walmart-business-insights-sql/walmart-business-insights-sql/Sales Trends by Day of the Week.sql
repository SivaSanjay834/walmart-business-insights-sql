SELECT DAYNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS Day_Name,
       round(SUM(Total),2) AS Total_Sales
FROM walmartsales
GROUP BY Day_Name
ORDER BY Total_Sales DESC
LIMIT 1;
