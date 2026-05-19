-- 613. Shortest Distance in a Line


select abs (p1.x -p2.x) as shortest 
from Point as p1  
join Point as p2 
on p1.x != p2.x
order by shortest 
limit 1;