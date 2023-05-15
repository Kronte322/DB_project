-- топ 10 игроков
select user_id, rating_points
from st.player
order by rating_points desc
limit 10 offset 10;