
--Išveskite visus filmus (visus stulpelius) nuo 520 id iki 700, kurie turi rating R

SELECT f.film_id,f.rating
FROM film f
WHERE f.film_id >=520 AND f.film_id<=700 AND f.rating='R';

--Grąžinite filmų pavadinimus, kurie yra išleisti 2006 metais bei jų nuomos kaina yra lygi 4.99 (išleidimo metai = release_year, nuomos kaina = rental_rate)

SELECT f.title
FROM film f
WHERE f.release_year=2006 AND f.rental_rate=4.99;

--Grąžinkite filmų id, kurie turi ARBA didesnį nei defaultinis rental_rate (4.99), ARBA didesnį nei defaultinis replacement_cost (19.99)

SELECT f.film_id
FROM film f
WHERE f.replacement_cost > 19.99 OR f.rental_rate > 4.99;

--Grąžinkite filmų pavadinimą ir aprašymą, kurių reitingas yra “PG-13”, o trukmė (length) mažesnė nei 110
SELECT f.title, f.description 
FROM film f
WHERE f.rating = 'PG-13' AND f.length <110;

--Grąžinkite visus filmus, kurie tarp special_features turi “Trailers”. Lygybės tam neužteks, reikia naudoti SQL LIKE
SELECT f.title
FROM film f
WHERE f.special_features LIKE 'Trailers';

--Grąžinkite visus filmus, kurių rental rate yra daugiau nei 1.99 bei savo special_features stulpelyje turi “Deleted Scenes”
SELECT f.title, special_features, rental_rate
FROM film f 
WHERE f.special_features LIKE 'Deleted Scenes'AND f.rental_rate > 1.99;

--Grąžinkite visus aktorius(-es) su pirmu vardu “Scarlett”

SELECT a.first_name,a.last_name
FROM actor a
WHERE a.first_name = 'Scarlett';

--Grąžinkite visus aktorius(-es) su pavarde “Johansson”

SELECT a.first_name,a.last_name
FROM actor a
WHERE a.last_name = 'Johansson';

--Grąžinkite kiek skirtingų aktorių pavardžių yra iš viso

SELECT COUNT(*) AS aktoriai_skirtingomis_pavardemis   --121
FROM
(SELECT  COUNT(*)  
FROM actor 
GROUP BY last_name) a;

--Grąžinkite pavardes, kurios yra unikalios (t.y. Tik vienas aktorius turi tokią pavardę)

SELECT DISTINCT(last_name)  --121
FROM actor;

SELECT last_name            --66
FROM actor
GROUP BY last_name
HAVING COUNT(last_name)=1;

SELECT last_name            --121
FROM actor
GROUP BY last_name
HAVING COUNT(last_name)>=1;

--Grąžinkite pavardes, kurios yra neunikalios

SELECT a.last_name             --55
FROM actor a
GROUP BY a.last_name
HAVING COUNT(a.last_name) >1;

--Grąžinkite kiek kiekvienoje parduotuvėje yra neaktyvių klientų

SELECT c.active AS neaktyvus ,c.store_id, COUNT(*)    
FROM customer c
WHERE c.active=0
GROUP BY c.store_id;

--  kuriu klientu ir aktoriu pavardes sutampa sutampa

SELECT c.first_name, c.last_name,actor.first_name,actor.last_name
FROM customer c
JOIN actor ON c.last_name=actor.last_name;

-- miestas sujungtas su salim

SELECT city.city,country.country
FROM city
JOIN country ON city.country_id=country.country_id;

-- filmas su kalba

SELECT film.title,language.name
FROM film
JOIN language ON film.language_id=language.language_id;

--filmo trukme nuo 100 iki 120

SELECT film.title, film.description, film.length
FROM film
WHERE length BETWEEN 100 AND 120;

--kas vaidino filmuose su reitingu pg-13

SELECT f.title, a.last_name, f.rating 
FROM film f
JOIN film_actor ON f.film_id=film_actor.film_id
JOIN actor a ON a.actor_id=film_actor.actor_id
WHERE f.rating='PG-13';
--stulpeliu sandauga

SELECT film.rental_duration * film.rental_rate AS total
FROM film;

SELECT film.title,  film.length, film.rental_duration * film.rental_rate AS total_rental_cost
FROM film
WHERE length BETWEEN 100 AND 120;
--paskutine
SELECT staff.first_name,staff.last_name,address.address,city.city
FROM staff
JOIN address ON staff.staff_id=address.address_id
JOIN city ON address.address_id=city.city_id;




