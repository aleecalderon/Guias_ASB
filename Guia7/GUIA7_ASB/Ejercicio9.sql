SELECT customer_id, first_name, last_name
FROM sakila.customer
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM sakila.rental
    WHERE rental_date >= '1998-01-01'
);

SELECT customer_id, first_name, last_name
FROM sakila.customer
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM sakila.rental
    WHERE rental_date >= '1998-01-01'
);

SELECT customer_id, first_name, last_name
FROM sakila.customer
WHERE EXISTS (
    SELECT *
    FROM sakila.rental
    WHERE customer_id = sakila.customer.customer_id
    AND rental_date >= '1998-01-01'
);

SELECT customer_id, first_name, last_name
FROM sakila.customer
WHERE NOT EXISTS (
    SELECT *
    FROM sakila.rental
    WHERE customer_id = sakila.customer.customer_id
    AND rental_date >= '1998-01-01'
);

SELECT o.order_id, o.order_date,
       (SELECT MAX(unit_price)
        FROM order_details
        WHERE order_details.order_id = o.order_id) AS max_unit_price
FROM orders AS o;