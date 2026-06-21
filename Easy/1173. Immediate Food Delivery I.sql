select round(temp * 100/(select count(delivery_id)from Delivery),2) as immediate_percentage 
from (select count(delivery_id)as temp
from Delivery 
where order_date = customer_pref_delivery_date)t;