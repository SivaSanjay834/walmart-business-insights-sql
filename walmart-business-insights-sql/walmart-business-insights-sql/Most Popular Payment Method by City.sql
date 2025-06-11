


with Payment_count as(
select City,Payment,Count(*) as Payment_count,
rank() over(partition by City order by count(*) desc ) as ran
from walmartsales
group by City,Payment
)
select City,Payment,Payment_Count
from payment_count
where ran=1;