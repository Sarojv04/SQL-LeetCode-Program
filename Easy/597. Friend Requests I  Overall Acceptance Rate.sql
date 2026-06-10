-- 597. Friend Requests I: Overall Acceptance Rate


select (
        round(
            ifnull(
                (select count(distinct requester_id, accepter_id) from RequestAccepted)
                /
                (select count(distinct sender_id,send_to_id)  from FriendRequest)  
            ,0)
            ,2)   
) as accept_rate;


-- Second method

select(
    round(
        case 
            when (select count(distinct requester_id ,accepter_id ) from RequestAccepted) = 0
            then 0
            else
            (select count(distinct requester_id ,accepter_id ) from RequestAccepted) 
            /
            (select count(distinct sender_id ,send_to_id  ) from FriendRequest )
        end
        ,2)
) as accept_rate;