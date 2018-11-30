DROP TABLE IF EXISTS collector;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE collector (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)

);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  collector_id INT4 REFERENCES collector(id)
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  albums_id INT4 REFERENCES albums(id)
);
