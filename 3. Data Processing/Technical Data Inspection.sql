-Bright Coffee Shop Data Inspection
-Checking how many columns does the dataset how
SELECT *
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
LIMIT 50;

--Total record of the data
SELECT
COUNT(*) AS total_records
FROM  brightlearn.coffee_shop.bright_coffee_shop_sales_dataset;

--Store Location: How many stores do we have
SELECT DISTINCT store_location
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset;

--Time period: What is period of this data?
SELECT MIN(transaction_date) AS start_date,
       MAX(transaction_date) AS end_date
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset; 

--Trading hours: What are the business hours of the shop
brightlearn.coffee_shop.bright_coffee_shop_sales_datasetbrightlearn.coffee_shop.bright_coffee_shop_sales_datasetbrightlearn.coffee_shop.bright_coffee_shop_sales_dataset
--Number of products: How many different product are we selling in total?
SELECT COUNT(DISTINCT product_id) AS number_of_products
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset;

--How many products does each shop sell?
SELECT store_location,
COUNT(DISTINCT product_id) AS number_of_products
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY store_location;

--Product category: What are the different product category we have?
SELECT DISTINCT product_category
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset;

--Number of product types
SELECT COUNT(DISTINCT product_type) AS number_of_product_types
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset;


brightlearn.coffee_shop.bright_coffee_shop_sales_dataset


SELECT COUNT(DISTINCT product_type) AS number_of_product_types
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset;



SELECT product_category,
      COUNT(transaction_qty) as units_sold
FROM brightlearn.coffee_shop.bright_coffee_shop_sales_dataset
GROUP BY product_category;
