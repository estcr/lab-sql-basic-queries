-- 1 Display all available tables in the Sakila database.
USE sakila;
SHOW Tables;

-- 2 Retrieve all the data from the tables actor, film and customer.

SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.film;

SELECT *
FROM sakila.customer;

-- 3 Retrieve the following columns from their respective tables:
--  3.1 Titles of all films from the film table

SELECT sf.title as títulos
FROM sakila.film as sf;

--  3.2 List of languages used in films, with the column aliased as language from the language table

SELECT sl.name as language
FROM sakila.language as sl;

--  3.3 List of first names of all employees from the staff table

SELECT ssta.first_name as first_name
FROM sakila.staff as ssta;

-- 4 Retrieve unique release years.
SELECT distinct sf.release_year
FROM sakila.film as sf;



-- 5 Counting records for database insights:
--  5.1 Determine the number of stores that the company has.
SELECT COUNT(ssto.store_id) as number_of_stores
FROM sakila.store as ssto;

--  5.2 Determine the number of employees that the company has.
SELECT COUNT(ssta.staff_id) as number_of_employees
FROM sakila.staff as ssta;

--  5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(sr.rental_id) as rentadas,
		COUNT(sf.film_id) as para_rentar
FROM sakila.rental as sr, sakila.film as sf;

--  5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(distinct sac.last_name) as cantidad_apellidos
FROM sakila.actor as sac;

-- 6 Retrieve the 10 longest films.

SELECT sf.title as títulos,
		sf.length as duracion
FROM sakila.film as sf
ORDER BY length desc
LIMIT 10;

-- 7 Use filtering techniques in order to:
--  7.1 Retrieve all actors with the first name "SCARLETT".
SELECT *
FROM sakila.actor as sac
WHERE sac.first_name = "SCARLETT";

-- BONUS:
--  7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
--  Hint: use LIKE operator. More information here.
SELECT * 
FROM sakila.film as sf
WHERE (sf.title LIKE "%ARMAGEDDON%") AND length >100;

--  7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(film_id)
FROM sakila.film as sf
WHERE (sf.special_features LIKE "%Behind the Scenes%");