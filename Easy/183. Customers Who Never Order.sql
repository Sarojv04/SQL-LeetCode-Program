-- 183. Customers Who Never Order

select c.name as Customers 
from Customers as c
left join Orders as o
on c.id = o.customerId 
where o.customerId is NULL;

-- Second way 

select c.name as Customers
from  Customers as c
where Id not in (select customerId from Orders);

-- finished