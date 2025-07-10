INSERT INTO Singer (singer_name) VALUES ('Дуа Липа');

INSERT INTO Singer (singer_name) VALUES ('Мадонна');

INSERT INTO Singer (singer_name) VALUES ('Три дня дождя');

INSERT INTO Singer (singer_name) VALUES ('Билли Айлиш');

INSERT INTO Genre (genre_name) VALUES ('Рок');

INSERT INTO Genre (genre_name) VALUES ('Поп');

INSERT INTO Genre (genre_name) VALUES ('Электропоп');

INSERT INTO SingerGenre (singer_id, genre_id) VALUES (1, 2);

INSERT INTO SingerGenre (singer_id, genre_id) VALUES (2, 2);

INSERT INTO SingerGenre (singer_id, genre_id) VALUES (3, 1);

INSERT INTO SingerGenre (singer_id, genre_id) VALUES (4, 3);

INSERT INTO SingerGenre (singer_id, genre_id) VALUES (4, 2);

INSERT INTO
    Album (name, album_year)
VALUES (
        'When We All Fall Asleep, Where Do We Go?',
        2019
    );

INSERT INTO Album (name, album_year) VALUES ('Like a Virgin', 1984);

INSERT INTO
    Album (name, album_year)
VALUES ('Future Nostalgia', 2020);

INSERT INTO
    Album (name, album_year)
VALUES (
        'Когда ты откроешь глаза',
        2021
    );

INSERT INTO SingerAlbum (singer_id, album_id) VALUES (1, 1);

INSERT INTO SingerAlbum (singer_id, album_id) VALUES (2, 2);

INSERT INTO SingerAlbum (singer_id, album_id) VALUES (3, 4);

INSERT INTO SingerAlbum (singer_id, album_id) VALUES (4, 3);

INSERT INTO
    Track (name, duration, album_id)
VALUES ('Перезаряжай', 3.1, 4);

INSERT INTO
    Track (name, duration, album_id)
VALUES ('Вода', 3.13, 4);

INSERT INTO
    Track (name, duration, album_id)
VALUES ('Cool', 3.29, 1);

INSERT INTO
    Track (name, duration, album_id)
VALUES ('Material Girl', 4.04, 2);

INSERT INTO
    Track (name, duration, album_id)
VALUES ('Bad Guy', 3.14, 3);

INSERT INTO
    Track (name, duration, album_id)
VALUES ('The Last Time', 3.41, 5);

INSERT INTO
    Track (name, duration, album_id)
VALUES ('Моя оборона', 2.4, NULL);

INSERT INTO
    Track (name, duration, album_id)
VALUES ('Навылет', 3.35, NULL);

INSERT INTO
    Collection (title, collection_year)
VALUES ('Oldest Track', 1990);

INSERT INTO Collection (title, collection_year) VALUES ('Pop', 2020);

INSERT INTO
    Collection (title, collection_year)
VALUES ('Осеннее настроение', 2023);

INSERT INTO
    Collection (title, collection_year)
VALUES ('Русский рок', 2021);

INSERT INTO TrackCollection (track_id, collection_id) VALUES (1, 4);

INSERT INTO TrackCollection (track_id, collection_id) VALUES (2, 4);

INSERT INTO TrackCollection (track_id, collection_id) VALUES (3, 2);

INSERT INTO TrackCollection (track_id, collection_id) VALUES (4, 3);

INSERT INTO TrackCollection (track_id, collection_id) VALUES (5, 2);

INSERT INTO TrackCollection (track_id, collection_id) VALUES (9, 1);

INSERT INTO TrackCollection (track_id, collection_id) VALUES (10, 4);