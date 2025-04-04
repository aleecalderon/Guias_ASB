--a. Mostrar el nombre del staff manager, dirección, ciudad y país de la tienda
CREATE VIEW vista_manager_tienda AS
SELECT s.first_name AS nombre, s.last_name AS apellido, a.address, ci.city, co.
FROM store st
JOIN staff s ON st.manager_staff_id = s.staff_id
JOIN address a ON st.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

--b. Mostrar todas las películas por su nombre y agrupadas las categorías y actores que aparecen en la película
CREATE VIEW vista_peliculas_categorias_actores AS
SELECT f.title AS pelicula, GROUP_CONCAT(DISTINCT c.name SEPARATOR ', ') AS categorias, GROUP_CONCAT(DISTINCT CONCAT(a.first_name, ' ', a.last_name) SEPARATOR ', ') AS actores
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
GROUP BY f.film_id;

--c. Mostrar el nombre de las películas y su ubicación (dirección, ciudad y país de la tienda)
CREATE VIEW vista_peliculas_ubicacion AS
SELECT f.title AS pelicula, a.address, ci.city, co.country
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY f.title, a.address, ci.city, co.country;

--d. El número de películas en cada tienda
CREATE VIEW vista_num_peliculas_tienda AS
SELECT s.store_id, COUNT(i.inventory_id) AS total_peliculas
FROM store s
JOIN inventory i ON s.store_id = i.store_id
GROUP BY s.store_id;

--e. El número de películas rentadas en cada tienda
CREATE VIEW vista_num_peliculas_rentadas AS
SELECT s.store_id, COUNT(r.rental_id) AS total_rentas
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN store s ON i.store_id = s.store_id
GROUP BY s.store_id;


