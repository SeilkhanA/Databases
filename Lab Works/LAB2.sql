CREATE DATABASE lab2
    OWNER postgres;



CREATE TABLE countries (
  country_id SERIAL CONSTRAINT country_pkey PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INTEGER,
  population INTEGER

);

--SELECT * FROM countries;
INSERT INTO countries
    (country_name, region_id, population) VALUES
    ('Kazakhstan', 2525, 1000000),
    ('Japan', 6721, 500000);
--SELECT * FROM countries;

INSERT INTO countries
    (country_id, country_name) VALUES
    (DEFAULT , 'China');
--SELECT * FROM countries;

INSERT INTO countries
    (region_id) VALUES
    (NULL);


INSERT INTO countries(country_name, region_id, population) VALUES
    ('Korea', 2232, 200000),
    (DEFAULT, 5200, 50000),
    ('Romania', NULL, 101000);

--SELECT * FROM countries;



ALTER TABLE countries
    ALTER COLUMN country_name
    SET DEFAULT 'Kazakhstan';

--SELECT * FROM countries;


INSERT INTO countries (country_name, region_id, population) VALUES (DEFAULT, 2121, 180000);
--SELECT * FROM countries;

INSERT INTO countries DEFAULT VALUES;
--SELECT * FROM countries;

CREATE TABLE countries_new(
  LIKE countries
);

--SELECT * FROM countries;


INSERT INTO countries_new SELECT * FROM countries;
SELECT * FROM countries_new;

--INSERT INTO countries_new (country_id, country_name, region_id, population)
--SELECT country_id, country_name, region_id, population FROM countries;

UPDATE countries --AS con
SET region_id = 1
WHERE region_id IS NULL;

UPDATE countries --AS con
SET population = population + (population* 0.1)
RETURNING country_name, population AS "New population";



DELETE FROM countries WHERE population < 100000;


DELETE FROM countries_new WHERE country_id NOTNULL
RETURNING *;


DELETE FROM countries
RETURNING *;


