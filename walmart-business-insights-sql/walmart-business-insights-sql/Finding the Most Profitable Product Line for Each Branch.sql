
WITH Profit_Calculation AS (
SELECT Branch,
       `Product line`,
       SUM(`gross income`) AS Total_Profit
FROM walmartsales
GROUP BY Branch, `Product line`
),

Rank_Profit AS (
SELECT Branch,
       `Product line`,
       Total_Profit,
       RANK() OVER (PARTITION BY Branch ORDER BY Total_Profit DESC) AS RankValue
FROM Profit_Calculation
)

SELECT Branch,
       `Product line` AS Most_Profitable_Product_Line,
       Total_Profit
FROM Rank_Profit
WHERE RankValue = 1;
