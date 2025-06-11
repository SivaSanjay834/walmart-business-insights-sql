
with customer_spending as (
select `Customer ID`,sum(Total) as total_spent
from walmartsales
group by `Customer ID`
),
spending_category as
 (
select `Customer ID`,total_spent,
case 
when total_spent >(select avg(total_spent) from customer_spending) then 'HIGH'
when total_spent = (select avg(total_spent) from customer_spending) then 'MEDIUM'
else 'LOW' 
end as Spending_Category
from customer_spending
)
select `Customer ID`,total_spent,spending_category
from Spending_Category;
