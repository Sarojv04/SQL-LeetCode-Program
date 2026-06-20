select round(avg(session_count),2) as average_sessions_per_user from 
(select count(distinct session_id) as session_count
from Activity
where activity_date between '2019-06-27' and '2019-07-27'
group by user_id)t;
