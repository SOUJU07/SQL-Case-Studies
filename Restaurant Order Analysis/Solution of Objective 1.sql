-- 1. View the menu_items table and write a query to find the number of items on the menu

SELECT COUNT(distinct menu_item_id) 
FROM menu_items;  -- 32 items are present in the menu

-- 2. What are the least and most expensive items on the menu?

SELECT * FROM menu_items
WHERE price IN (SELECT MAX(price)  -- max price is 19.95 for shrimp scampi with id =130
FROM menu_items)
UNION
SELECT * FROM menu_items
WHERE price IN (SELECT MIN(price)  -- min price is 5.00 for edamame with id=113
FROM menu_items);

-- 3. How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?

SELECT COUNT(*)
FROM menu_items
WHERE category='Italian';  -- 9 italian dishes are present in the menu

WITH cte AS (SELECT *
FROM menu_items
WHERE category='Italian'
)  

SELECT * FROM cte
WHERE price IN (SELECT MAX(price)  -- max price is 19.95 for shrimp scampi with id =130
FROM cte)
UNION
SELECT * FROM cte
WHERE price IN (SELECT MIN(price)  -- min price is 14.50 for spaghetti and fettuccine alfredo with id=124 and 126
FROM cte);


-- 4.How many dishes are in each category? What is the average dish price within each category?

SELECT category,AVG(price),COUNT(menu_item_id)
FROM menu_items
GROUP BY category;


