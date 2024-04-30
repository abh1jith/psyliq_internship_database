USE psyliq;
SELECT * 
FROM paytm;
-- 1
SELECT DISTINCT Category_Grouped 
FROM paytm;
-- This column seem to represent the generalised category of the samples in the dataset, and there seems to be 4 unique categories and one undefined category.

-- 2
SELECT COUNT(*) AS counts, Shipping_city
FROM paytm
GROUP BY Shipping_city
ORDER BY counts DESC
LIMIT 5;
-- another solution
SELECT shipping_city, COUNT(order_id) AS number_of_orders 
FROM paytm 
GROUP BY shipping_city 
ORDER BY number_of_orders 
DESC LIMIT 5;

-- 3
SELECT *
FROM paytm
WHERE Category = "Electronics";

-- 4
SELECT *
FROM paytm
WHERE Sale_Flag = "Yes";
-- The Sale_Flag column seems to have values of "On Sale" and "Not on Sale" only.
SELECT *
FROM paytm
WHERE Sale_Flag = "On Sale";

-- 5
SELECT *
FROM paytm
ORDER BY Item_Price 
DESC LIMIT 1;
-- The most expensive item seems to be of shoe category, and furniture categories.

-- All the other questions are answered in the ipynb file attached.
