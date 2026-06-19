select p.product_id , p.product_name 
from Product as p
left join Sales as s
on p.product_id = s.product_id 
where s.sale_date between '2019-01-01' and '2019-03-31'
and p.product_id not in (select p.product_id from Product as p
left join Sales as s
on p.product_id = s.product_id 
where sale_date between '2019-04-1' and '2019-06-02');