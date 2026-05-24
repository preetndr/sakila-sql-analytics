
USE sakila;

-- Question 1
SELECT c.first_name , c.last_name, r.rental_date
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id;

-- Question 2
SELECT c.first_name, c.last_name, a.address
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE a.district IN ('Alberta', 'Texas');

-- Question 3
SELECT f.title, c.name AS category_name
FROM film f
LEFT JOIN film_category fc
ON f.film_id = fc.film_id
LEFT JOIN category c
ON fc.category_id = c.category_id
ORDER BY c.name;

-- Question 4
SELECT s.store_id, COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN store s
ON i.store_id = s.store_id
GROUP BY s.store_id;

-- Question 5
SELECT c.name, COUNT(fc.film_id) AS total_films
FROM category c
JOIN film_category fc
ON c.category_id = fc.category_id
GROUP BY c.category_id
HAVING COUNT(fc.film_id) > 50;

-- Question 6
SELECT f.title
FROM film f
JOIN inventory i
ON f.film_id = i.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
WHERE r.customer_id = (
	SELECT customer_id
    FROM customer
    WHERE first_name = 'Mary'
    AND last_name = 'Smith'
);

-- Question 7
SELECT f.title, SUM(p.amount) AS total_income
FROM payment p
JOIN rental r
ON p.rental_id = r.rental_id
JOIN inventory i
ON r.inventory_id = i.inventory_id
JOIN film f
ON i.film_id = f.film_id
GROUP BY f.film_id;

-- Question 8
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(fa.film_id) AS total_films
FROM actor a
JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY total_films DESC;

-- Question 9
SELECT rental_id, customer_id,
	CASE
		WHEN customer_id > 300 THEN 'New Customer'
        ELSE 'Regular Customer'
        END AS customer_type
FROM rental;

-- Question 10
SELECT DISTINCT f.title, f.release_year
FROM film f
JOIN inventory i
ON f.film_id = i.film_id
WHERE SUBSTRING(f.title, 1, 1) = 'A';

-- Question 11
CREATE DATABASE student_db;

USE student_db;

CREATE TABLE students(
	Student_ID INT PRIMARY KEY,
	Marks INT
);

INSERT INTO students (Student_ID, Marks)
VALUES
	(1, 90),
	(2, 65);

ALTER TABLE students
RENAME COLUMN Marks TO Score;

DROP TABLE students;

DROP DATABASE student_db;


