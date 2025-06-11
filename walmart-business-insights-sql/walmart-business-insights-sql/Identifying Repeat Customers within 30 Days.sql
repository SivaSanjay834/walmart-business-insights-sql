WITH Repeat_Customers AS (
    SELECT `Customer ID`,
           `Invoice ID`,
           str_to_date(Date, '%d-%m-%Y') AS Purchase_Date,
           LEAD(str_to_date(Date, '%d-%m-%Y')) OVER (PARTITION BY `Customer ID` ORDER BY str_to_date(Date, '%d-%m-%Y')) AS Next_Purchase_Date
    FROM walmartsales
),
Customer_Repeats AS (
    SELECT `Customer ID`, Purchase_Date, Next_Purchase_Date,
           DATEDIFF(Next_Purchase_Date, Purchase_Date) AS Days_Difference
    FROM Repeat_Customers
    WHERE Next_Purchase_Date IS NOT NULL
)
SELECT `Customer ID`, Purchase_Date, Next_Purchase_Date, Days_Difference
FROM Customer_Repeats
WHERE Days_Difference <= 30
ORDER BY `Customer ID`, Purchase_Date;
