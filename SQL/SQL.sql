CREATE DATABASE retail_analysis;
USE retail_analysis;
ALTER TABLE `sample - superstore`
RENAME TO superstore;
SELECT COUNT(*) AS total_orders
FROM superstore;
SELECT SUM(Sales) AS total_sales
FROM superstore;
SELECT SUM(Profit) AS total_profit
FROM superstore;
SELECT `Customer Name`,
       SUM(Sales) AS revenue
FROM superstore
GROUP BY `Customer Name`
ORDER BY revenue DESC
LIMIT 5;
SELECT Category,
       SUM(Sales) AS total_sales
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;
SELECT State,
       SUM(Profit) AS total_profit
FROM superstore
GROUP BY State
ORDER BY total_profit DESC
LIMIT 10;
SELECT `Order Date`
FROM superstore
LIMIT 10;
ALTER TABLE superstore
ADD COLUMN order_date_clean DATE;
UPDATE superstore
SET order_date_clean =
STR_TO_DATE(`Order Date`, '%m/%d/%Y');
SET SQL_SAFE_UPDATES = 0;
UPDATE superstore
SET order_date_clean =
STR_TO_DATE(`Order Date`, '%m/%d/%Y');
SELECT `Order Date`,
       order_date_clean
FROM superstore
LIMIT 10;
SELECT MONTH(order_date_clean) AS month_no,
       SUM(Sales) AS total_sales
FROM superstore
GROUP BY month_no
ORDER BY month_no;
SELECT `Product Name`,
       SUM(Sales) AS total_sales
FROM superstore
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;
SELECT `Product Name`,
       SUM(Profit) AS total_profit
FROM superstore
GROUP BY `Product Name`
ORDER BY total_profit ASC
LIMIT 10;
SELECT Region,
       SUM(Sales) AS total_sales
FROM superstore
GROUP BY Region
ORDER BY total_sales DESC;
SELECT AVG(Sales) AS avg_order_value
FROM superstore;
SELECT Segment,
       SUM(Sales) AS total_sales,
       SUM(Profit) AS total_profit
FROM superstore
GROUP BY Segment;
SELECT `Customer Name`,
       SUM(Sales) AS total_sales,
       RANK() OVER(ORDER BY SUM(Sales) DESC) AS customer_rank
FROM superstore
GROUP BY `Customer Name`;
WITH category_sales AS (
    SELECT Category,
           SUM(Sales) AS total_sales
    FROM superstore
    GROUP BY Category
)

SELECT *
FROM category_sales
ORDER BY total_sales DESC;