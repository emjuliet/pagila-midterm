/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 */

SELECT DISTINCT first_name, last_name FROM actor a
WHERE a.actor_id in
(
    SELECT actor_id
    FROM actor
    JOIN film_actor using (actor_id)
    JOIN film using (film_id)
    JOIN film_category using (film_id)
    JOIN category using (category_id)
    WHERE category.name IN ('Children' ))

AND a.actor_id  NOT IN
(
    SELECT DISTINCT actor_id
    FROM actor
    JOIN film_actor using (actor_id)
    JOIN film using (film_id)
    JOIN film_category using (film_id)
    JOIN category using (category_id)
    WHERE category.name IN ('Horror'))
    ORDER BY last_name;
