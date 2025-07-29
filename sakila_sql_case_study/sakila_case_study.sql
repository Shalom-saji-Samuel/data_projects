-- ================================================
-- Sakila Case Study | SQL Portfolio Project
-- ================================================
-- Description: This file contains multiple queries answering business questions
--              using joins, aggregations, CTEs, subqueries, indexing, and more.
-- =================================================
-- Query 1: Top 5 Spending Customers
-- =================================================
-- Purpose: Identify which customers have paid the most total rental fees
SELECT customer_id , 
       SUM(amount) AS total_paid
FROM payment			
GROUP BY customer_id							
ORDER BY SUM(amount) DESC
LIMIT 5;
-- How code works : the code adds the amounts paid ,
-- 					then groups them according to customer_ids .
-- 					Order by allows for highest total paid to come top ,
-- 					limit 5 , gives us top 5 customers who paid most.
-- =================================================
-- Query 2: Most Rented Categories Per Month
-- =================================================
-- Purpose: Show which film categories are most popular each month
WITH category_monthly_rentals AS (
  SELECT 
    MONTHNAME(p.payment_date) AS month_name,
    c.name AS category_name,
    COUNT(*) AS rentals
  FROM payment p
  JOIN rental r ON p.rental_id = r.rental_id 
  JOIN inventory i ON r.inventory_id = i.inventory_id
  JOIN film f ON i.film_id = f.film_id
  JOIN film_category fc ON f.film_id = fc.film_id
  JOIN category c ON fc.category_id = c.category_id
  GROUP BY month_name, category_name
),
ranked_categories AS (
  SELECT *,
         RANK() OVER (PARTITION BY month_name ORDER BY rentals DESC) AS rnk
  FROM category_monthly_rentals
)
SELECT *
FROM ranked_categories
WHERE rnk = 1;
-- How code works : the category_monthly.. cte gives monthname , category names and the rentals made on that 
-- 					specific category. Then the ranked_categories rank the rentals , inorder for us to get the 
-- 					highest rented category in the later select statement.
-- =================================================
-- Query 3: Films Rented More Than Average
-- =================================================
-- Purpose: List films that are rented more times than the average film
SELECT 
  COUNT(r.rental_id) AS times_rented,
  f.title 
FROM rental r 
JOIN inventory i ON r.inventory_id = i.inventory_id 
JOIN film f ON i.film_id = f.film_id 
GROUP BY f.title
HAVING times_rented > (
  SELECT AVG(rent_count)
  FROM (
    SELECT COUNT(r.rental_id) AS rent_count
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id 
    JOIN film f ON i.film_id = f.film_id 
    GROUP BY f.title
  ) AS avg_subquery
);
-- How code works : the main query finds number of rentals made on each film ,
-- 					the having clause compares this number to the average number 
-- 					of rentals made per film. 
-- =================================================
-- Query 4: Customers With Most Rentals Per Day
-- =================================================
-- Purpose: Identify customers who rent multiple films on the same day
SELECT c.first_name ,
	   c.last_name,
	   c.customer_id,
	   COUNT(r.rental_id) as number_of_rentals, 
       DATE(r.rental_date) as date_of_sale
FROM rental r 
JOIN customer c on r.customer_id = c.customer_id 
GROUP BY c.first_name , date_of_sale , c.customer_id , c.last_name
HAVING number_of_rentals > 2
ORDER BY number_of_rentals desc 
LIMIT 10;
-- How code works : select statements produces count of rentals and 
-- 					converts date_time to date only .
-- 					Join is used to get the names of customers
-- 					order by and limit gives us top 10 most rentals happened along with its date.
-- =================================================
-- Query 5: Overdue Rentals Not Yet Returned
-- =================================================
-- Purpose: List customers who currently have rentals not returned after 7+ days
SELECT customer_id , 
	   DATEDIFF(last_update , rental_date) as number_of_days
FROM rental
WHERE DATEDIFF(last_update , rental_date) > 7
AND return_date IS NULL;
-- How code works : here i used datediff to get number of days between 
-- 					the last update of this database ,I would've used current_date 
-- 					if the database was an updated one , but sakila database is from 2006 or so.
--                  then i used where clause to get customer_ids who all didnt return in less 
-- 					than 7 days and decided not to return (return date being null)    
-- =================================================
-- Query 6: Index Optimization Example
-- =================================================
-- Purpose: Show the use of indexing to optimize rental queries
ALTER TABLE customer 
DROP INDEX idx_last_name ; 

CREATE INDEX idx_first_last_name
ON customer(first_name , last_name);

SELECT * FROM customer 
WHERE last_name = 'JOHNSON' 
AND first_name = 'PATRICIA';
-- how code works : I first deleted an index ,via the drop clause .
--  				That index only checked for last name , and after dropping 
-- 					it I made an index for both first and last name . 
-- 					This will make queries faster and more efficient on big databases.
-- 					In this small table it wasn't a huge difference.







