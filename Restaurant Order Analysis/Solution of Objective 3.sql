-- 1.Combine the menu_items and order_details tables into a single table

SELECT * 
FROM menu_items mi
JOIN order_details od
ON mi.menu_item_id=od.item_id

-- 2.What were the least and most ordered items? What categories were they in?


SELECT mi.menu_item_id,COUNT(mi.menu_item_id) AS total,mi.category 
FROM menu_items mi
JOIN order_details od
ON mi.menu_item_id=od.item_id
GROUP BY mi.menu_item_id
ORDER BY total DESC

-- 3.What were the top 5 orders that spent the most money?

SELECT order_id,SUM(price) AS price
FROM menu_items mi
JOIN order_details od
ON mi.menu_item_id=od.item_id
GROUP BY order_id
ORDER BY price DESC
LIMIT 5

-- 4. View the details of the highest spend order. Which specific items were purchased?

SELECT order_id,SUM(price) AS price
FROM menu_items mi
JOIN order_details od
ON mi.menu_item_id=od.item_id
GROUP BY order_id
ORDER BY price DESC
LIMIT 5

SELECT DISTINCT item_name
FROM menu_items mi
JOIN order_details od
ON mi.menu_item_id=od.item_id
WHERE order_id=440

-- 5. View the details of the top 5 highest spend orders

SELECT *
FROM menu_items mi
JOIN order_details od
ON mi.menu_item_id=od.item_id
WHERE order_id IN (440,2075,1957,330,2675)

-- 6. How much was the most expensive order in the dataset?

SELECT order_id,SUM(price) AS total
FROM menu_items mi
JOIN order_details od
ON mi.menu_item_id=od.item_id
GROUP BY order_id
ORDER BY total DESC