-- все игроки у которых > 5 собранных ачивок
select user_id, count(achivment_id) as num_of_achivments
from st.player_achivment
group by user_id
having count(achivment_id) > 5;