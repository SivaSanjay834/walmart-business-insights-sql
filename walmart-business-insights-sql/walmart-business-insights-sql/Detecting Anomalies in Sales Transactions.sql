
select * from walmartsales;
WITH Product_Avg AS (
    SELECT `Product line`,
           AVG(Total) AS Avg_Sales,
           STDDEV(Total) AS Std_Sales
    FROM walmartsales
    GROUP BY `Product line`
),
Anomalies AS (
    SELECT w.`Invoice ID`, w.`Product line`, w.Total,
    CASE 
        WHEN w.Total > p.Avg_Sales + p.Std_Sales THEN 'High Anomaly'
        WHEN w.Total < p.Avg_Sales - p.Std_Sales THEN 'Low Anomaly'
        ELSE 'Normal'
    END AS Anomaly_Type
    FROM walmartsales w
    JOIN Product_Avg p ON w.`Product line` = p.`Product line`
)
SELECT `Invoice ID`, `Product line`, Total, Anomaly_Type
FROM Anomalies
WHERE Anomaly_Type != 'Normal'
ORDER BY `Product line`, Total DESC;
