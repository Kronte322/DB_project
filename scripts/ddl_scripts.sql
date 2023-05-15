CREATE SCHEMA IF NOT EXISTS st;
CREATE TYPE st.player_state_type AS ENUM('online', 'offline', 'was recently');
CREATE TYPE st.server_state_type AS ENUM('online', 'offline');

CREATE TABLE st.user (
	user_id SERIAL PRIMARY KEY,
	email_nm character varying(255) NOT NULL UNIQUE,
	password character varying(255) NOT NULL,
	country_nm character varying(255) DEFAULT NULL,
	city_nm character varying(255) DEFAULT NULL
);

CREATE TABLE st.game (
	game_id SERIAL NOT NULL PRIMARY KEY,
	start_dt TIMESTAMP NOT NULL,
	end_dt TIMESTAMP DEFAULT NULL
);

CREATE TABLE st.server (
	server_id SERIAL PRIMARY KEY,
	ip_address character varying(255) NOT NULL,
	port integer NOT NULL,
	country character varying(255) DEFAULT NULL,
	state st.server_state_type NOT NULL DEFAULT 'offline',
	max_players_cnt integer DEFAULT 8,
	players_cnt integer DEFAULT 0,
	game_id integer,
		 FOREIGN KEY (game_id) REFERENCES st.game(game_id)
);

CREATE TABLE st.player (
	user_id integer NOT NULL,
	nick_nm character varying(255) NOT NULL UNIQUE,
	rating_points integer DEFAULT 0,
	state st.player_state_type NOT NULL DEFAULT 'offline',
	server_id integer DEFAULT NULL,
	region_placement  integer UNIQUE DEFAULT NULL,
	world_placement integer UNIQUE DEFAULT NULL,
		FOREIGN KEY (user_id) REFERENCES st.user(user_id),
		FOREIGN KEY (server_id) REFERENCES st.server(server_id)
);

CREATE TABLE st.rank (
	rating_points integer NOT NULL UNIQUE CHECK (rating_points % 100 = 0),
	title character varying(255) NOT NULL UNIQUE
);

CREATE TABLE st.history_of_game (
	user_id integer,
	game_id integer,
	placement integer NOT NULL UNIQUE CHECK (placement >= 0),
	num_of_kills integer DEFAULT 0 CHECK (num_of_kills >= 0),
	num_of_deaths integer DEFAULT 0 CHECK (num_of_deaths >= 0),
		FOREIGN KEY (user_id) REFERENCES st.user(user_id),
		FOREIGN KEY (game_id) REFERENCES st.game(game_id)
);

CREATE TABLE st.achivment (
	achivment_id SERIAL PRIMARY KEY,
	achivment_nm character varying(255) NOT NULL UNIQUE,
	achivment_desc character varying(255) NOT NULL UNIQUE
);

CREATE TABLE st.player_achivment (
	user_id integer,
	achivment_id integer,
		FOREIGN KEY (user_id) REFERENCES st.user(user_id),
		FOREIGN KEY (achivment_id) REFERENCES st.achivment(achivment_id)
);



