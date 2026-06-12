update salary
set sex = CASE  when sex = 'm' THEN 'f'
                when sex = 'f' THEN 'm'
           
           END