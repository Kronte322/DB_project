-- топ игроков в пордке места в мировом рейтинге
select user_id, world_placement
from st.player
order by world_placement;