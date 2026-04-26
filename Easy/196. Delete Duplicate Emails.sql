-- 196. Delete Duplicate Emails

delete p1
from Person as p1
join Person as p2
on p1.email = p2.email
and p1.id > p2.id;

-- 2nd way

delete from Person
where id not in (
    select id from
    (
    select min(id) as id
    from Person
    group by email
    ) as temp
);