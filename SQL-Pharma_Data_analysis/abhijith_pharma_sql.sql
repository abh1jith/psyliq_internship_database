-- 1
SELECT * 
FROM pharma;

-- 2
SELECT COUNT(DISTINCT country) 
FROM pharma;

-- 3
SELECT customer_name 
FROM pharma 
WHERE channel = 'Retail';

-- 4 
SELECT SUM(quantity) 
FROM pharma 
WHERE product_class = 'Antibiotics';

-- 5
SELECT DISTINCT month 
FROM pharma;
-- 6
SELECT year, SUM(sales) 
FROM pharma 
GROUP BY year;

-- 7
SELECT customer_name 
FROM pharma 
ORDER BY sales DESC LIMIT 1;

-- 8
-- IRRELEVANT DATASET
SELECT employee_name 
FROM employees 
WHERE role = 'Sales Representative' AND CurrManager = 'James Goodwill';


-- 9
SELECT city, SUM(sales) AS total_sales 
FROM pharma 
GROUP BY city 
ORDER BY total_sales DESC LIMIT 5;

-- 10
SELECT sub_channel, AVG(price) 
FROM pharma 
GROUP BY sub_channel;

-- 11
-- IRRELEVANT DATASET
SELECT e.employee_name, s.* 
FROM Employees e JOIN Sales s 
ON e.employee_id = s.sales_rep_id;


-- 12
-- IRRELEVANT DATASET
SELECT * 
FROM Sales 
WHERE employee_city = 'Rendsburg' AND year = 2018;

-- 13
SELECT year, month, product_class, SUM(sales) 
FROM pharma 
GROUP BY year, month, product_class 
ORDER BY year, month, product_class;

-- 14
-- IRRELEVANT DATASET
SELECT sales_rep_id, SUM(sales) AS total_sales 
FROM Sales 
WHERE year = 2019 
GROUP BY sales_rep_id 
ORDER BY total_sales DESC LIMIT 3;

-- 15 
SELECT sub_channel, AVG(monthly_sales) 
FROM (SELECT sub_channel, month, SUM(sales) AS monthly_sales 
	FROM pharma 
    GROUP BY sub_channel, month) 
GROUP BY sub_channel;

-- 16
SELECT product_class, SUM(sales) AS total_sales, AVG(price) AS average_price, SUM(quantity) AS total_quantity 
FROM pharma 
GROUP BY product_class;

-- 17
SELECT year, customer_name, SUM(sales) AS total_sales 
FROM pharma 
GROUP BY year, customer_name 
ORDER BY year, total_sales DESC LIMIT 5;

-- 18
SELECT country, year, (SUM(sales) - LAG(SUM(sales), 1, 0) 
OVER (PARTITION BY country 
	ORDER BY year)) / LAG(SUM(sales), 1, 1) 
    OVER (PARTITION BY country 
			ORDER BY year) AS growth 
FROM pharma 
GROUP BY country, year;

-- 19
SELECT year, month, MIN(sales) AS min_sales 
FROM pharma 
GROUP BY year, month 
ORDER BY year, min_sales;

-- 20
-- IRRELEVANT DATASET
WITH CountrySales AS (SELECT country, sub_channel, SUM(sales) AS total_sales 
					FROM pharma 
                    GROUP BY country, sub_channel) 
SELECT sub_channel, MAX(total_sales) AS max_sales, country 
FROM CountrySales 
GROUP BY sub_channel;