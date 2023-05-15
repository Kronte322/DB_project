create view st.USERS as
select user_id, substring(email_nm from 1 for 3) || '*********' as email_masked, country_nm, city_nm
from st.user;

create view st.SERVERS as
select server_id, substring(ip_address from 1 for 3) || '*********' as ip_address,
country, state, max_players_cnt, players_cnt, game_id
from st.server;

create view st.LEADER_BOARD as 
select user_id, nick_nm, rating_points
from st.player
order by rating_points desc;

create view st.RANKS as
select f.user_id, f.nick_nm, s.title 
from st.player as f left join st.rank as s on s.rating_points = (select div(f.rating_points, 100));

create view st.ACHIVMENTS as 
select f.user_id, f.nick_nm, t.achivment_nm, t.achivment_desc
from st.player as f left join st.player_achivment as s on f.user_id = s.user_id left join st.achivment as t
on s.achivment_id = t.achivment_id;

create view st.KDA as 
select f.user_id, f.nick_nm, sum(s.num_of_kills) as kills, sum(s.num_of_deaths) as deaths
from st.player as f left join st.history_of_game as s on f.user_id = s.user_id
group by f.user_id, f.nick_nm
order by sum(s.num_of_kills) / sum(s.num_of_deaths);