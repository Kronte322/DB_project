# Проект по курсу "Базы данных"
* Предметная область: обеспечить игру(другой проект) системой баз данных, которая сможет удовлетворить данные потребности:
    * игрок хочет иметь функционал: посмотреть игры в которых учавствовал, посмотреть счет в них, посмотреть таблицу лидеров, присоединится к игровой сессии друзей, посмотреть свои достижения.
    * со стороны разработчика: нужно выстроить связь user-player, иметь список активных серверов, иметь доступ к общим данным player-ов.
* Проект для которого будет разработана система баз данных: https://github.com/Kronte322/maze_builder .
* Пример геймплея: https://www.youtube.com/watch?v=FI-A-oo6_x0&ab_channel=%D0%94%D0%B0%D0%BD%D0%B8%D0%BB%D0%B0%D0%94%D1%80%D0%B0%D1%87%D1%91%D0%B2 .
* Концептуальная модель: ![My image](https://code.mipt.ru/db2023/drachevda-project/-/blob/main/concept_model.png) .
* Логическая модель: ![My image](https://code.mipt.ru/db2023/drachevda-project/-/blob/main/logical_model.png) .
* Физическаяя модель: https://docs.google.com/spreadsheets/d/1HWx8Mh9f3ufZASYcFHkrBHcl_pNuw7mGnmN5bEnKT8U/edit#gid=0 .

# Примечания: 

* основные сущности: user, player. server. game.
* все отношения находятся в 3-НФ
