DROP TABLE collector;
DROP TABLE albums;

CREATE TABLE collector (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)

);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255)

)
