-- 1. Print details of shipments (sales) where amounts are > 2,000 and boxes are <100?

SELECT COUNT(*) FROM sales; -- Total number of sales is 7617

SELECT *
FROM sales
WHERE Amount>2000 AND Boxes<100;  -- We find only 125 sales done if amount is greater than 2000 and boxes are less than 100.


-- 2. How many shipments (sales) each of the sales persons had in the month of January 2022?

SELECT SPID,COUNT(*),Salesperson
FROM sales s
JOIN people p
USING(SPID)
WHERE YEAR(SaleDate)=2022 AND MONTHNAME(SaleDate)='January'
GROUP BY SPID
ORDER BY SPID;  -- this gives us the count of sales done by each salesperson


-- 3. Which product sells more boxes? Milk Bars or Eclairs?

SELECT PID,Product,SUM(Boxes) AS total_boxes_sold
FROM sales s
JOIN products p
USING(PID)
WHERE Product IN ('Milk Bars','Eclairs')
GROUP BY PID
ORDER BY total_boxes_sold DESC;  -- Milk Bars sold 130995 boxes and Eclais sold 144651 boxes


-- 4.Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs?

SELECT PID,Product,SUM(Boxes) AS total_boxes
FROM sales s
JOIN products p
USING(PID)
WHERE Product IN ('Milk Bars','Eclairs') AND (SaleDate BETWEEN '2022-02-01' AND '2022-02-07')
GROUP BY PID
ORDER BY total_boxes DESC


-- 5.Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?

SELECT *,DAYNAME(SaleDate)
FROM sales s
WHERE Customers<100 AND boxes<100 AND DAYNAME(SaleDate)='Wednesday'



-- 1. What are the names of salespersons who had at least one shipment (sale) in the first 7 days of January 2022? 

SELECT Salesperson
FROM sales s
JOIN people p
USING(SPID)
WHERE SaleDate BETWEEN '2022-01-01' AND '2022-01-07'
GROUP BY s.SPID
ORDER BY s.SPID ASC


-- 2. Which salespersons did not make any shipments in the first 7 days of January 2022?

SELECT Salesperson FROM people
WHERE Salesperson NOT IN (
SELECT DISTINCT(Salesperson)
FROM sales s
JOIN people p
USING(SPID)
WHERE SaleDate BETWEEN '2022-01-01' AND '2022-01-07'
);

WITH cte AS (
SELECT DISTINCT(Salesperson)
FROM sales s
JOIN people p
USING(SPID)
WHERE SaleDate BETWEEN '2022-01-01' AND '2022-01-07'
)
SELECT Salesperson FROM people
WHERE Salesperson NOT IN (
SELECT * FROM cte
);

-- 3. How many times we shipped more than 1,000 boxes in each month?

WITH cte AS(
SELECT *,YEAR(SaleDate) AS Years,MONTH(SaleDate) AS Months
FROM sales
WHERE Boxes>1000
)
SELECT Years,Months,COUNT(Boxes) AS num_times FROM cte
GROUP BY Years,Months;

-- 4. Did we ship at least one box of ‘After Nines’ to ‘New Zealand’ on all the months?

WITH cte AS (
SELECT YEAR(SaleDate) AS Years, MONTH(SaleDate) AS Months,s.Boxes,g.Geo
FROM sales s
JOIN products p
USING(PID)
JOIN geo g
ON g.GeoID=s.GeoID
WHERE Product ='After Nines' AND g.Geo='New Zealand' AND s.Boxes>=1 
)
SELECT Years,Months,COUNT(Boxes),
IF(SUM(Boxes)>=1,'YES','NO') AS Status
FROM cte
GROUP BY Years,Months
ORDER BY Years


-- 5. India or Australia? Who buys more chocolate boxes on a monthly basis?

WITH cte AS(
SELECT MONTH(SaleDate) AS Months, YEAR(SaleDate) AS Years, Boxes,Geo
FROM sales s
JOIN geo g
USING(GeoID)
WHERE Geo IN ('India','Australia')
)
SELECT Months,Years,Geo,SUM(Boxes),
	DENSE_RANK() OVER(partition by Months,Years Order by SUM(Boxes) DESC) AS Rank_Acquired
FROM cte
GROUP BY Months,Years,Geo
ORDER BY Years,Months  

-- here i have used dense rank to give rank to each geo location for each month.











