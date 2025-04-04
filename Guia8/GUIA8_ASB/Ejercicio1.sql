CREATE VIEW vista_ingresos_por_categoria AS
SELECT
 c.NAME AS CATEGORIA,
 COALESCE(SUM(p.AMOUNT), 0) AS TOTAL_INGRESOS
FROM CATEGORY c
JOIN FILM_CATEGORY fc ON c.CATEGORY_ID = fc.CATEGORY_ID
JOIN FILM f ON fc.FILM_ID = f.FILM_ID
JOIN INVENTORY i ON f.FILM_ID = i.FILM_ID
JOIN RENTAL r ON i.INVENTORY_ID = r.INVENTORY_ID
JOIN PAYMENT p ON r.RENTAL_ID = p.RENTAL_ID
GROUP BY c.NAME;

SELECT * FROM vista_ingresos_por_categoria;