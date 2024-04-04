-- 1.View the order_details table. What is the date range of the table?

SELECT MIN(order_date), MAX(order_date) FROM order_details

-- 2. How many orders were made within this date range? How many items were ordered within this date range?

SELECT COUNT(DISTINCT order_id) FROM order_details

SELECT COUNT(item_id) FROM order_details

-- 3.Which orders had the most number of items?

SELECT order_id,COUNT(item_id) AS num
FROM order_details
GROUP BY order_id
ORDER BY num DESC

-- 4.How many orders had more than 12 items?
WITH cte AS(
SELECT order_id,COUNT(item_id) AS num
FROM order_details
GROUP BY order_id
ORDER BY num DESC
)
SELECT COUNT(order_id) FROM cte
WHERE num>12