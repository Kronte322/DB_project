SELECT * FROM st.user;

SELECT * FROM st.game;

SELECT * FROM st.server_online;

SELECT * FROM st.player;

SELECT * FROM st.rank;

SELECT * FROM st.history_of_game;

SELECT * FROM st.achivment;

SELECT * FROM st.player_achivment;

DELETE FROM st.user;

DELETE FROM st.game;

DELETE FROM st.server_online;

DELETE FROM st.player;

DELETE FROM st.rank;

DELETE FROM st.history_of_game;

DELETE FROM st.achivment;

DELETE FROM st.player_achivment;

SELECT start_dt, end_dt FROM st.game WHERE end_dt = NULL;

UPDATE st.game SET end_dt = start_dt + INTERVAL '25 minutes' WHERE end_dt IS NULL;