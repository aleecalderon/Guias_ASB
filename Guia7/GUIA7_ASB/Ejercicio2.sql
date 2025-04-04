SELECT f.film_id, f.title, c.category_id, c.name AS category_name
FROM sakila.film f
RIGHT JOIN sakila.film_category fc ON f.film_id = fc.film_id
RIGHT JOIN sakila.category c ON fc.category_id = c.category_id
ORDER BY c.category_id;

SELECT film.film_id, film.title, cat.category_id, cat.name AS category_name
FROM sakila.film AS film
RIGHT JOIN sakila.film_category AS fc ON film.film_id = fc.film_id
RIGHT JOIN sakila.category AS cat ON fc.category_id = cat.category_id
ORDER BY cat.category_id;