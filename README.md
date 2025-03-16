# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: Retail_sales

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named 'Retail_sales'.
- **Table Creation**: A table named `Sales_db` is created to store the sales data. The table structure includes columns for transactions_id,	sale_date	,sale_time,	customer_id,	gender,	age	,category,quantiy,	price_per_unit,	cogs,	total_sale

```sql
CREATE DATABASE  Retail_sales

CREATE TABLE Sales_db
(
    transactions_id INT PRIMARY KEY,
    sale_date DATE,	
    sale_time TIME,
    customer_id INT,	
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,	
    cogs FLOAT,
    total_sale FLOAT
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT COUNT(*) FROM Sales_db;
SELECT COUNT(DISTINCT customer_id) FROM Sales_db;
SELECT DISTINCT category FROM Sales_db;

SELECT * FROM Sales_db
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM Sales_db
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

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


## Findings

- **Customer Demographics**: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
- **High-Value Transactions**: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
- **Sales Trends**: Monthly analysis shows variations in sales, helping identify peak seasons.
- **Customer Insights**: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

