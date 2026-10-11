--SQL Code
SELECT 
    transaction_date,
    DAYNAME(transaction_date) AS Day_name,
    MONTHNAME(transaction_date) AS Month_name,
     COUNT(transaction_id) AS number_of_sales,
     SUM(transaction_qty) AS units_sold,
     COUNT(DISTINCT product_id) AS unique_products,
     COUNT(store_id) AS number_of_stores,
     MAX(unit_price*transaction_qty) AS highest_price,
     AVG(unit_price*transaction_qty) AS average_price,
     MIN(unit_price*transaction_qty) AS lowest_price,
     AVG(unit_price*transaction_qty) AS average_revenue,
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

         SUM(transaction_qty * unit_price) AS total_revenue,

    store_location,
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
        WHEN DAYNAME(transaction_date) IN ('Sat','Sun') THEN 'Weekend'
        WHEN DAYNAME(transaction_date) IN ('Mon','Tue','Wed','Thu','Fri') THEN 'Weekday'
    END,

    CASE 
        WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
        WHEN transaction_time BETWEEN '12:00:00' AND '17:59:59'  THEN 'Afternoon'
        WHEN transaction_time BETWEEN '18:00:00' AND '20:59:59' THEN 'Evening'
        END,

        CASE
         WHEN transaction_date BETWEEN '2023-01-01' AND '2023-03-31' THEN 'first_quarter_revenue'
         WHEN transaction_date BETWEEN '2023-04-01' AND '2023-06-30' THEN 'second_quarter_revenue'
    END;
