INSERT INTO st.user(email_nm, password, country_nm, city_nm) VALUES
('drachevdanila322@gmail.com', 'XvR4!M!3v32@', 'Belarus', 'Gomel'),
('vlad2@gmail.com', '1l4kXP&ys0#n', 'Belarus', 'Gomel'),
('staskidun@gmail.com', 'm&8OZ8Puev3!', 'Belarus', 'Gomel'),
('daniilkur@gmail.com', '65&X2@EA8Ol1', 'Belarus', 'Gomel'),
('ilyalegend@gmail.com', 'kLF0540Z0i&B', 'Belarus', 'Grodno'),
('antonGarr@gmail.com', '6$nb7#Y8CjH9', 'Russia', 'Moscow'),
('lover@gmail.com', 'm&8OZ8Puev3!', 'Belarus', 'Gomel'),
('enjoyer@gmail.com', '65&X2@EA8Ol1', 'Belarus', 'Minsk'),
('bananza@gmail.com', 'kLF0540Z0i&B', 'Russia', 'Vladivastok'),
('slotwithdogs@gmail.com', '6$nb7#Y8CjH9', 'Russia', 'Moscow'),
('user1@gmail.com', 'password1', 'USA', 'New York'),
('user2@gmail.com', 'password2', 'Canada', 'Toronto'),
('user3@gmail.com', 'password3', 'USA', 'Los Angeles'),
('user4@gmail.com', 'password4', 'Mexico', 'Mexico City'),
('user5@gmail.com', 'password5', 'USA', 'Chicago'),
('user6@gmail.com', 'password6', 'Canada', 'Vancouver'),
('user7@gmail.com', 'password7', 'USA', 'Miami'),
('user8@gmail.com', 'password8', 'Mexico', 'Guadalajara'),
('user9@gmail.com', 'password9', 'USA', 'Houston'),
('user10@gmail.com', 'password10', 'Canada', 'Montreal'),
('user11@gmail.com', 'password11', 'USA', 'Philadelphia'),
('user12@gmail.com', 'password12', 'Mexico', 'Tijuana'),
('user13@gmail.com', 'password13', 'USA', 'San Francisco'),
('user14@gmail.com', 'password14', 'Canada', 'Calgary'),
('user15@gmail.com', 'password15', 'USA', 'Seattle'),
('user16@gmail.com', 'password16', 'Mexico', 'Monterrey'),
('user17@gmail.com', 'password17', 'USA', 'Boston'),
('user18@gmail.com', 'password18', 'Canada', 'Ottawa'),
('user19@gmail.com', 'password19', 'USA', 'Dallas'),
('user20@gmail.com', 'password20', 'Mexico', 'Puebla'),
('user21@gmail.com', 'password21', 'USA', 'Washington D.C.'),
('user22@gmail.com', 'password22', 'Canada', 'Edmonton'),
('user23@gmail.com', 'password23', 'USA', 'Atlanta'),
('user24@gmail.com', 'password24', 'Mexico', 'Cancun'),
('user25@gmail.com', 'password25', 'USA', 'Denver'),
('user26@gmail.com', 'password26', 'Canada', 'Winnipeg'),
('user27@gmail.com', 'password27', 'USA', 'Austin'),
('user28@gmail.com', 'password28', 'Mexico', 'Guadalajara'),
('user29@gmail.com', 'password29', 'USA', 'San Diego'),
('user30@gmail.com', 'password30', 'Canada', 'Halifax');

INSERT INTO st.player(user_id, nick_nm) VALUES
(1, 'Aboba'),
(2, 'Boba');

INSERT INTO st.achivment(achivment_nm, achivment_desc) VALUES
('All I do is Win', 'Выиграйте 250 игр в режиме создания матчей.');

INSERT INTO st.player_achivment(user_id, achivment_id) VALUES
(2, 1);

INSERT INTO st.rank(rating_points, title) VALUES
(0, 'Незнакомец'),
(100, 'Бронза 1'),
(200, 'Бронза 2'),
(300, 'Бронза 3'),
(400, 'Бронза 4'),
(500, 'Бронза 5'),
(600, 'Серебро 1'),
(700, 'Серебро 2'),
(800, 'Серебро 3'),
(900, 'Серебро 4'),
(1000, 'Серебро 5'),
(1100, 'Золото 1'),
(1200, 'Золото 2'),
(1300, 'Золото 3'),
(1400, 'Золото 4'),
(1500, 'Золото 5'),
(1600, 'Алмаз 1'),
(1700, 'Алмаз 2'),
(1800, 'Алмаз 3'),
(1900, 'Алмаз 4'),
(2000, 'Алмаз 5'),
(2100, 'Охотник');

INSERT INTO st.server(ip_address, port) VALUES
('192.168.0.108', 5567),
('192.168.0.108', 5568),
('192.168.0.108', 5569);

INSERT INTO st.game(start_dt, end_dt) VALUES
('2020-01-01 14:25:58'::timestamp, '2020-01-01 14:35:58'::timestamp),
('2020-01-01 15:14:20'::timestamp, NULL);

INSERT INTO st.game (start_dt)
SELECT NOW() - INTERVAL '1 day' * (random() * 30)::int FROM generate_series(1, 30);

INSERT INTO st.history_of_game(game_id, user_id, num_of_kills, num_of_deaths, placement) VALUES
(1, 1, 100, 2, 1);
