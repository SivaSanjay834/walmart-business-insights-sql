with monthly_base as(
select sum(Total)as total,Gender, Month(str_to_date(Date,'%d-%m-%Y')) as Month_Wise
from walmartsales
group by Gender,Month_wise
)
select Month_Wise,Gender,round(total,2) as total
from monthly_base
order by Month_Wise,Gender;
