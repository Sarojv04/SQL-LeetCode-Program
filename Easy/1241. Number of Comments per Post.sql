select
    p.sub_id as post_id,
    count(distinct s.sub_id) as number_of_comments
from Submissions as p
left join Submissions as s
on p.sub_id = s.parent_id
where p.parent_id  is NULL
group by p.sub_id
order by p.sub_id;