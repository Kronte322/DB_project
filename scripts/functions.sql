-- считает количество игр, в которых игрок с user_id участвовал за период from_dt - to_dt
CREATE OR REPLACE FUNCTION st.count_games_of_player(user_id integer, from_dt TIMESTAMP, to_dt TIMESTAMP)
RETURNS integer AS $$
DECLARE
    game_count integer;
	intermediate numeric;
BEGIN
	SELECT t.user_id INTO intermediate FROM st.user AS t WHERE t.user_id = $1;
	IF intermediate IS NULL THEN
        RAISE EXCEPTION 'there is no such user_id' USING ERRCODE = '02000';
    END IF;
    SELECT COUNT(*) INTO game_count FROM st.history_of_game AS h
    WHERE h.user_id = $1 AND game_id IN (
        SELECT game_id FROM st.game AS t
        WHERE t.start_dt >= $2 AND t.start_dt <= $3
    );

    RETURN game_count;
END;
$$ LANGUAGE plpgsql;


-- считает средний placement игрока с user_id в играх с from_dt по to_dt
CREATE OR REPLACE FUNCTION st.avg_placement_of_player(user_id integer, from_dt TIMESTAMP, to_dt TIMESTAMP)
RETURNS numeric AS $$
DECLARE
    total_placement numeric;
    game_count integer;
	intermediate numeric;
BEGIN
	SELECT t.user_id INTO intermediate FROM st.user AS t WHERE t.user_id = $1;
	IF intermediate IS NULL THEN
        RAISE EXCEPTION 'there is no such user_id' USING ERRCODE = '02000';
    END IF;

    SELECT SUM(placement) INTO total_placement FROM st.history_of_game AS t
    WHERE t.user_id = $1 AND game_id IN (
        SELECT game_id FROM st.game AS h
        WHERE h.start_dt >= $2 AND h.start_dt <= $3
    );

    SELECT COUNT(*) INTO game_count FROM st.history_of_game AS t
    WHERE t.user_id = $1 AND game_id IN (
        SELECT game_id FROM st.game AS h
        WHERE h.start_dt >= $2 AND h.start_dt <= $3
    );

    RETURN total_placement/game_count;
END;
$$ LANGUAGE plpgsql;

-- считает популярность ранга, то есть процент игроков, которые обладают им
CREATE OR REPLACE FUNCTION st.rank_popularity(rating_points integer)
RETURNS numeric AS $$
DECLARE
    total_players integer;
    players_with_rank integer;
	intermediate numeric;
    percent numeric;
BEGIN
	SELECT t.rating_points INTO intermediate FROM st.rank AS t WHERE t.rating_points = $1;
    IF intermediate IS NULL THEN
        RAISE EXCEPTION 'there is no such rating_points' USING ERRCODE = '02000';
    END IF;

    SELECT COUNT(*) INTO total_players FROM st.player;

    SELECT COUNT(*) INTO players_with_rank FROM st.player AS h
    WHERE h.rating_points >= $1 AND h.rating_points < $1 + 100;

    percent := (players_with_rank::numeric/total_players::numeric)*100;

    RETURN percent;
END;
$$ LANGUAGE plpgsql;