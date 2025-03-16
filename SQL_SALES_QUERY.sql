-- SQL Project on Retail Sales--
create database Retail_Sales;
USE Retail_Sales;
select * from Sales_db;

-- DATA CLEANING--
Select count(*) from Sales_db;

-- DATA EXPLORATION --
-- 1. Find the total sales amount for each category?
Select SUM(total_sale) as sum_total_sales,category from Sales_db 
GROUP BY
category
ORDER BY SUM(total_sale) DESC;

-- 2. Count the number of transactions for each category?
Select COUNT(*) as No_transactions,category 
From Sales_db 
GROUP BY category;

-- 3. Find the average price per unit for all products?
Select AVG(price_per_unit) as avg_price_per_unit
From Sales_db;


-- 4.List the top 5 most frequently purchased products?
Select SUM(total_sale) as total_sales,category,ROW_NUMBER() OVER (ORDER BY SUM(total_sale) DESC ) AS RN
From Sales_db
GROUP BY category;

-- 5.Calculate the total revenue generated from clothing sales?
Select SUM(total_sale) as total_sales,category From Sales_db
WHERE category='Clothing'
GROUP BY category;

-- 6.Find the total cost of goods sold (COGS) for beauty products?
Select SUM(cogs*quantiy) as Total_cost,category From Sales_db
WHERE category='Beauty'
GROUP BY category;

-- 7. Identify the youngest and oldest customers who made a purchase.
Select MIN(age) as Youngest_customer,MAX(age) as Oldest_customer
From Sales_db;

-- 8. List the number of male and female customers?
Select COUNT(*) as no_of_customers,gender
From Sales_db
GROUP BY gender;

-- 9.Find the total sales amount for each month?
  SELECT
    MONTH(sale_date) AS sale_month,
    SUM(total_sale) AS total_sales
FROM
    sales_db
GROUP BY
    MONTH(sale_date)
ORDER BY
    sale_month;
    
-- 10.Calculate the total profit for each category?
Select SUM(total_sale-cogs) as total_profit,category
From Sales_db
GROUP BY category;



-- END OF PROJECT--






















