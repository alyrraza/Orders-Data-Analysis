# Data Analysis Project

This project involves data cleaning using `Python` and data analysis using `SQL` to gain insights from e-commerce sales data. Below are the detailed descriptions of the SQL queries used for analysis.

## Table of Contents

- [Data Cleaning](#data-cleaning)
- [SQL Queries and Analysis](#sql-queries-and-analysis)
  - [Query 1: Top 10 Highest Revenue Generating Products](#query-1-top-10-highest-revenue-generating-products)
  - [Query 2: Top 5 Selling Products in Each Region](#query-2-top-5-selling-products-in-each-region)
  - [Query 3: Month Over Month Comparison](#query-3-month-over-month-comparison)
  - [Query 4: Month with Highest Sales Each Category](#query-4-month-with-highest-sales-each-category)
  - [Query 5: Subcategory with Highest Profit](#query-5-subcategory-with-highest-profit)

## Data Cleaning

Data cleaning was performed using Python to prepare the dataset for analysis. This involved handling missing values, normalizing data formats, and ensuring data consistency.

## SQL Queries and Analysis

### Query 1: Top 10 Highest Revenue Generating Products

This query identifies the top 10 products that have generated the highest revenue. It sums the sale prices for each product and orders them in descending order of revenue.

### Query 2: Top 5 Selling Products in Each Region

This query finds the top 5 selling products in each region. It uses a common table expression (CTE) to calculate the revenue for each product by region, and then ranks the products within each region to get the top 5.

### Query 3: Month Over Month Comparison

This query compares sales month over month for the years 2022 and 2023. It extracts the year and month from the order dates and sums the sales for each month. The results are displayed side by side for both years to facilitate comparison.

### Query 4: Month with Highest Sales Each Category

This query determines the month with the highest sales for each product category. It uses a CTE to sum the sales for each category by month and then ranks the months to find the highest sales month for each category.

### Query 5: Subcategory with Highest Profit

This query identifies the subcategory with the highest profit growth. It calculates the sales for each subcategory for the years 2022 and 2023, computes the growth percentage, and then selects the subcategory with the highest growth.

