select round(temp * 100/(select count(delivery_id)from Delivery),2) as immediate_percentage 
from (select count(delivery_id)as temp
from Delivery 
where order_date = customer_pref_delivery_date)t;

-- second method

select round(
    100 * sum(order_date = customer_pref_delivery_date)/count(delivery_id),2
) as immediate_percentage
from Delivery;