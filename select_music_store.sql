-- Задание 2

-- Название и продолжительность самого длительного трека.
SELECT name, duration FROM Track ORDER BY duration DESC LIMIT 1;
-- или
SELECT name, duration
FROM Track
WHERE
    duration = (
        SELECT MAX(duration)
        FROM Track
    );

-- Название треков, продолжительность которых не менее 3,5 минут.
SELECT name FROM Track WHERE duration > 3.3;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title
FROM Collection
WHERE
    collection_year BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова.
SELECT singer_name FROM Singer WHERE singer_name NOT LIKE '% %';

-- Название треков, которые содержат слово «мой» или «my».
SELECT name
FROM Track
WHERE
    LOWER(name) LIKE '%моя%'
    OR LOWER(name) LIKE '%мой%'
    OR LOWER(name) LIKE '%my%';

-- Задание 3

-- Количество исполнителей в каждом жанре.
SELECT G.genre_name, COUNT(singer_id) AS singer_count
FROM SingerGenre SG
    JOIN Genre G ON SG.genre_id = G.id
GROUP BY
    genre_name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
-- Общее количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(T.album_id) AS count_track
FROM Track T
    JOIN Album A ON T.album_id = A.id
WHERE
    A.album_year BETWEEN 2019 AND 2020;

-- Вошло в каждый альбом 2019–2020 годов
SELECT A.name AS album_name, COUNT(T.album_id) AS count_track
FROM Track T
    JOIN Album A ON T.album_id = A.id
WHERE
    A.album_year BETWEEN 2019 AND 2020
GROUP BY
    album_name;

-- Средняя продолжительность треков по каждому альбому.
SELECT A.name AS album_name, AVG(T.duration)
FROM Track T
    JOIN Album A ON T.album_id = A.id
GROUP BY
    album_name;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT S.singer_name, A.name AS album_name, A.album_year
FROM
    Singer S
    JOIN SingerAlbum SG ON S.id = SG.singer_id
    JOIN Album A ON SG.album_id = A.id
WHERE
    A.album_year != 2020;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT S.singer_name, C.title
FROM
    Collection C
    JOIN TrackCollection TC ON C.id = TC.collection_id
    JOIN Track T ON T.id = TC.track_id
    JOIN Album A ON A.id = T.album_id
    JOIN SingerAlbum SA ON A.id = SA.album_id
    JOIN Singer S ON S.id = SA.singer_id
WHERE
    S.singer_name = 'Три дня дождя';

-- Задание 4(необязательное)

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT A.name AS album_name, S.singer_name, COUNT(G.genre_name) AS genre_count
FROM
    Album A
    JOIN SingerAlbum SA ON A.id = SA.album_id
    JOIN Singer S ON S.id = SA.singer_id
    JOIN SingerGenre SG ON S.id = SG.singer_id
    JOIN Genre G ON G.id = SG.genre_id
GROUP BY
    A.name,
    S.singer_name
HAVING
    COUNT(G.genre_name) > 1;

-- Наименования треков, которые не входят в сборники.
SELECT T.name AS track_name
FROM Track T
    LEFT JOIN TrackCollection TC ON T.id = TC.track_id
WHERE
    TC.id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT S.singer_name, T.name AS track_name, T.duration
FROM
    Track T
    JOIN Album A ON A.id = T.album_id
    JOIN SingerAlbum SA ON A.id = SA.album_id
    JOIN Singer S ON S.id = SA.singer_id
WHERE
    T.duration = (
        SELECT MIN(T.duration)
        FROM
            Track T
            JOIN Album A ON A.id = T.album_id
            JOIN SingerAlbum SA ON A.id = SA.album_id
            JOIN Singer S ON S.id = SA.singer_id
    );

-- Названия альбомов, содержащих наименьшее количество треков.
SELECT A.name AS album_name, COUNT(*) AS count_track
FROM Album A
    JOIN Track T ON T.album_id = A.id
GROUP BY
    A.name
HAVING
    COUNT(*) = (
        SELECT COUNT(*) AS count_track
        FROM Album A
            JOIN Track T ON T.album_id = A.id
        GROUP BY
            A.name
        ORDER BY count_track
        LIMIT 1
    );