
--Išveskite visus filmus (visus stulpelius) nuo 520 id iki 700, kurie turi rating R

SELECT film_id,rating
FROM film 
WHERE film_id >=520 AND film_id<=700 AND rating='R';

--Grąžinite filmų pavadinimus, kurie yra išleisti 2006 metais bei jų nuomos kaina yra lygi 4.99 (išleidimo metai = release_year, nuomos kaina = rental_rate)

SELECT title
FROM film 
WHERE release_year=2006 AND rental_rate=4.99;

--Grąžinkite filmų id, kurie turi ARBA didesnį nei defaultinis rental_rate (4.99), ARBA didesnį nei defaultinis replacement_cost (19.99)

SELECT film_id
FROM film 
WHERE replacement_cost > 19.99 OR rental_rate > 4.99;

--Grąžinkite filmų pavadinimą ir aprašymą, kurių reitingas yra “PG-13”, o trukmė (length) mažesnė nei 110
SELECT title, description 
FROM film 
WHERE rating = 'PG-13' AND length <110;

--Grąžinkite visus filmus, kurie tarp special_features turi “Trailers”. Lygybės tam neužteks, reikia naudoti SQL LIKE
SELECT title
FROM film 
WHERE special_features LIKE 'Trailers';

--Grąžinkite visus filmus, kurių rental rate yra daugiau nei 1.99 bei savo special_features stulpelyje turi “Deleted Scenes”
SELECT title, special_features, rental_rate
FROM film 
WHERE special_features LIKE 'Deleted Scenes'AND rental_rate > 1.99;
