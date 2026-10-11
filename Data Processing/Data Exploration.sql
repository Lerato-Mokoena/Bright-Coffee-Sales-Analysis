--Data Exploration
SELECT*
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
LIMIT 100;

------------------------------------- ITEMS---------------------------------------------
--How many items where sold by each store
SELECT store_location,
COUNT(transaction_qty) AS units_sold
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY store_location;

--Category with the most transactions
SELECT product_category,
COUNT(*) AS units_sold
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY product_category
ORDER BY units_sold DESC;

--Number of sales we made from each product category, product detail & product type
SELECT
    product_category,
    product_detail,
    product_type,
    COUNT(*) AS number_of_sales
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY
    product_category,
    product_detail,
    product_type
ORDER BY number_of_sales DESC;

--Highest price by product category 
SELECT product_category,
    MAX(unit_price*transaction_qty) AS highest_price
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY product_category
ORDER BY highest_price DESC;

---Average price category
SELECT product_category,
    AVG(unit_price*transaction_qty) AS average_price
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY product_category
ORDER BY average_price DESC;

--Lowest price
SELECT product_category,
    MIN(unit_price*transaction_qty) AS lowest_price
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY product_category
ORDER BY lowest_price DESC;

SELECT
    MIN(transaction_qty) AS minimum_quantity,
    MAX(transaction_qty) AS maximum_quantity,
    AVG(transaction_qty) AS average_quantity
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset;
---------------------------------REVENUE-----------------------------
--Total revenue for product
SELECT product_category,
       product_type,
       product_detail,
SUM(unit_price*transaction_qty) AS total_sales
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY product_category,
         product_type,
         product_detail;

-- Which product category sold most
--Top 5 product categories"
SELECT 
    product_category,
    SUM(unit_price * transaction_qty) AS total_sales
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
WHERE product_category IN (
    'Coffee',
    'Tea',
    'Drinking Chocolate',
    'Bakery',
    'Coffee beans',
    'Loose Tea',
    'Branded',
    'Packaged Chocolate',
    'Flavours'
)
GROUP BY product_category
ORDER BY total_sales DESC
LIMIT 5;


--Average revenue 
SELECT product_category,
    product_type,
    product_detail,
    AVG(unit_price*transaction_qty) AS average_revenue
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY
    product_category,
    product_type,
    product_detail;
---------------------------------------------------------------------------------------------------------------
--Time intervals
--Busiest hour of the day
SELECT
     HOUR(transaction_time) AS hour_day,
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY HOUR(transaction_time)
ORDER BY hour_day DESC;

----------------------------------------------------------------------------------------------------------------

  SELECT 
    transaction_date,
    DAYNAME(transaction_date) AS Day_name,
    MONTHNAME(transaction_date) AS Month_name,
     COUNT(transaction_id) AS number_of_sales,
     SUM(transaction_qty) AS units_sold,
     COUNT(DISTINCT product_id) AS unique_products,
     COUNT(store_id) AS number_of_stores,
     SUM(transaction_qty * unit_price) AS revenue,

    CASE 
        WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'Weekend'
        WHEN DAYNAME(transaction_date) IN ('Mon','Tue','Wed','Thu','Fri') THEN 'Weekday'
    END AS day_classification,

    CASE 
        WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
        WHEN transaction_time BETWEEN '18:00:00' AND '20:59:59' THEN 'Evening'
    END AS time_classification,  

    CASE
         WHEN transaction_date BETWEEN '2023-01-01' AND '2023-03-31' THEN 'first_quarter_revenue'
         WHEN transaction_date BETWEEN '2023-04-01' AND '2023-06-30' THEN 'second_quarter_revenue'
         END AS revenue_by_quarter,

    store_location
    product_category,
    product_type,
    product_detail
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset

GROUP BY 
    transaction_date,
    month_name,
    store_location,
    product_category,
    product_type,
    product_detail,

    CASE 
        WHEN DAYNAME(transaction_date) IN ('Saturday','Sunday') THEN 'Weekend'
        WHEN DAYNAME(transaction_date) IN ('Monday','Tuesday','Wednesday','Thursday','Friday') THEN 'Weekday'
    END,

    CASE 
        WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59'  THEN 'Afternoon'
        WHEN transaction_time BETWEEN '18:00:00' AND '20:59:59' THEN 'Evening'
    END;
