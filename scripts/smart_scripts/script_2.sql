-- все игроки отсортированные по количеству набранных ачивок
select user_id, count(achivment_id) as num_of_achivments
from st.player_achivment
group by user_id
order by num_of_achivments desc;