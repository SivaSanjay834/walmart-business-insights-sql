
With Monthly_revenue As (
Select Branch,
Month(str_to_date(date, '%d-%m-%y')) As Month_number,
Sum(total) As Total_rev
From walmartsales
Group By Branch, Month_number),

Growth_Rate As (
Select Branch, Month_number, Total_rev,
(Total_rev - Lag(total_rev) Over (Partition By Branch Order By Month_number))/Lag(total_rev) 
Over (Partition By Branch Order By Month_number) * 100 As growth_rate
From Monthly_revenue)

Select Branch, Round(sum(total_rev),2) As Total_rev, round(sum(growth_rate),2) As Growth_rate
From Growth_Rate
Group By Branch;
