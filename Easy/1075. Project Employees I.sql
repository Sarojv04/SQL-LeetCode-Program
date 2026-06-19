select p.project_id,  round(sum(e.experience_years) / count(p.employee_id),2) as average_years 
from Project as p
left join Employee as e
on e.employee_id = p.employee_id  
group by project_id;

-- another way 

select p.project_id,  round(avg(e.experience_years),2) as average_years 
from Project as p
left join Employee as e
on e.employee_id = p.employee_id  
group by project_id;