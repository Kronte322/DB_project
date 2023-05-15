-- игроки отсортированные по среднему месту в мировом рейтинге по странам
select f.user_id, f.country_nm, s.world_placement, avg(s.world_placement) over (partition by f.country_nm) as avg_placement
from (st.user as f left join st.player as s on f.user_id = s.user_id)
order by avg_placement;