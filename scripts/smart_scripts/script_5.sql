-- номера игроков в соответствии с мировым ретингом
select user_id, rating_points, row_number() over (order by rating_points) as placement
from st.player;