select project_id from Project 
group by project_id  
having count(employee_id) =
(select count(employee_id) as final
from Project 
group by project_id
order by final desc
limit 1);