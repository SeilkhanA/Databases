CREATE DATABASE lab1
OWNER postgres;

CREATE TABLE users(
  id SERIAL CONSTRAINT users_pkey PRIMARY KEY,
  firstname VARCHAR (50),
  lastname  VARCHAR (50)
);

INSERT INTO users (firstname, lastname) VALUES ('Sam', 'Smith');


ALTER TABLE users ADD COLUMN isadmin INTEGER;

ALTER TABLE users
  ALTER COLUMN isadmin SET DATA TYPE BOOLEAN USING isadmin::boolean;

ALTER TABLE users
  ALTER COLUMN isadmin SET DEFAULT FALSE;

CREATE TABLE tasks(
  id SERIAL,
  name VARCHAR(50),
  user_id INTEGER
);


DROP TABLE tasks;

DROP DATABASE lab1;
