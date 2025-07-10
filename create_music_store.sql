CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    genre_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
    id SERIAL PRIMARY KEY,
    singer_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS SingerGenre (
    id SERIAL PRIMARY KEY,
    singer_id INTEGER NOT NULL REFERENCES Singer (id),
    genre_id INTEGER NOT NULL REFERENCES Genre (id)
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    album_year INT
);

CREATE TABLE IF NOT EXISTS SingerAlbum (
    id SERIAL PRIMARY KEY,
    singer_id INTEGER NOT NULL REFERENCES Singer (id),
    album_id INTEGER NOT NULL REFERENCES Album (id)
);

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    duration DECIMAL(5, 2) NULL,
    album_id INTEGER REFERENCES Album (id)
);

CREATE TABLE IF NOT EXISTS Collection (
    id SERIAL PRIMARY KEY,
    title VARCHAR(60) NOT NULL,
    collection_year INT
);

CREATE TABLE IF NOT EXISTS TrackCollection (
    id SERIAL PRIMARY KEY,
    track_id INTEGER NOT NULL REFERENCES Track (id),
    collection_id INTEGER NOT NULL REFERENCES Collection (id)
);