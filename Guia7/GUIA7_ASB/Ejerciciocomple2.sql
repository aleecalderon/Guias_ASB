SELECT c.first_name AS customer_name, f.title AS film_title, r.return_date, p.amount
FROM sakila.customer AS c
JOIN sakila.rental AS r ON c.customer_id = r.customer_id
JOIN sakila.inventory AS i ON r.inventory_id = i.inventory_id
JOIN sakila.film AS f ON i.film_id = f.film_id
JOIN sakila.payment AS p ON r.rental_id = p.rental_id
ORDER BY p.amount DESC;