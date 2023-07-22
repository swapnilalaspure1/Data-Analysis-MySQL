USE pizaadb;

SELECT 
    *
FROM
    pizaadb.pizza_sales;

-- Q) Find Total Revenue
SELECT 
    ROUND(SUM(`total_price`), 2) AS 'Total Revenue'
FROM
    pizza_sales;
    
-- Q) Find Average Order values
SELECT 
    SUM(`total_price`) / COUNT(DISTINCT (`order_id`)) AS "Average order values"
FROM
    pizza_sales;


-- Q) Total Pizzas Sold
SELECT 
    SUM(`quantity`)
FROM
    pizaadb.pizza_sales;

-- Q) Total Orders
SELECT 
    COUNT(DISTINCT (`order_id`)) AS 'Total orders'
FROM
    pizza_sales;

-- Q) Average Pizzas Per Orders
SELECT 
    ROUND(SUM(`quantity`) / COUNT(DISTINCT (`order_id`)),2) AS 'Average Pizzas Per Orders'
FROM
    pizza_sales;
    
-- Q) Daily Trends for Total Orders
SELECT 
    DAYNAME(`order_date`) AS 'Order Day',
    COUNT(DISTINCT (`order_id`)) AS 'Total Orders'
FROM
    pizza_sales
GROUP BY DAYNAME(`order_date`)
ORDER BY `Total Orders` DESC;

-- Q) Monthly Trends for Total Orders
SELECT 
    MONTHNAME(`order_date`) AS 'Month Name',
    COUNT(DISTINCT (`order_id`)) AS "Total Order"
FROM
    pizza_sales
GROUP BY MONTHNAME(`order_date`)
ORDER BY `Total Order` DESC;

-- Q) Percentage of Sales by Pizza Category
SELECT 
    `pizza_category` AS 'Pizaa Category',
    SUM(`total_price`) AS 'Total Sales',
    (ROUND(SUM(`total_price`) / (SELECT 
                    SUM(`total_price`)
                FROM
                    pizza_sales),
            4)) * 100 AS 'Percentage of Sales'
FROM
    pizza_sales
GROUP BY pizza_category;

-- Q) Percentage of sales by Pizza Size
SELECT 
    `pizza_size` AS 'Pizza Size',
    ROUND(SUM((`total_price`)),4) AS 'Total Price',
    (ROUND(SUM(`total_price`) / (SELECT 
                    SUM(`total_price`)
                FROM
                    pizza_sales),
            4)) * 100 AS 'Percentage of Sales'
FROM
    pizza_sales
GROUP BY `pizza_size`;

-- Q) Total pizza sold by pizza category
SELECT 
    `pizza_category` AS 'Pizza Category',
    ROUND(SUM(`total_price`),3) AS 'Total Price',
    COUNT(`total_price`) AS 'Pizza Sold'
FROM
    pizza_sales
GROUP BY `pizza_category`
ORDER BY `Pizza Sold` DESC;

-- Q) Top 5 best sellers by Revenue, Total Quantity and Total Orders
SELECT 
    `pizza_name` AS 'Pizza Name',
    SUM(`total_price`) AS 'Total Revenue'
FROM
    pizza_sales
GROUP BY `pizza_name`
ORDER BY `Total Revenue` DESC
LIMIT 5;

SELECT 
    `pizza_name` AS 'Pizza Name',
    SUM(`quantity`) AS 'Total Quantity'
FROM
    pizza_sales
GROUP BY `pizza_name`
ORDER BY `Total Quantity` DESC
LIMIT 5;

SELECT 
    `pizza_name` AS 'Pizza Name',
    COUNT(DISTINCT(`order_id`)) AS 'Total Orders'
FROM
    pizza_sales
GROUP BY `pizza_name`
ORDER BY `Total Orders` DESC
LIMIT 5;