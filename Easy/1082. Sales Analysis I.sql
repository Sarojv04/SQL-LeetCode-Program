select seller_id 
from Sales 
group by seller_id 
having sum(price) = (select sum(price) as total from Sales 
group by seller_id 
order by total desc
limit 1 );