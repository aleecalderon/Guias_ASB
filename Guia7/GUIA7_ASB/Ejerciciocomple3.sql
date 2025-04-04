SELECT c.first_name AS customer_name, f.title AS film_title, r.return_date, p.amount, cat.name AS category_name, lang.name AS original_language
FROM sakila.customer AS c
JOIN sakila.rental AS r ON c.customer_id = r.customer_id
JOIN sakila.inventory AS i ON r.inventory_id = i.inventory_id
JOIN sakila.film AS f ON i.film_id = f.film_id
JOIN sakila.payment AS p ON r.rental_id = p.rental_id
JOIN sakila.film_category AS fc ON f.film_id = fc.film_id
JOIN sakila.category AS cat ON fc.category_id = cat.category_id
JOIN sakila.language AS lang ON f.original_language_id = lang.language_id
ORDER BY p.amount DESC;
