-- 181. Employees Earning More Than Their Managers

select e.name as Employee 
from Employee as e
join Employee as m
on e.managerId = m.id
where e.salary  > m.salary;

-- second solution

select e.name as Employee
from Employee as e
left join Employee as m
on  e.managerId = m.id
where e.salary > m.salary;