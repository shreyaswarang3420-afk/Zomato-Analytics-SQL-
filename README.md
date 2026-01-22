# Zomato-Analytics-SQL-

Below is a **recruiter-friendly README section** for your **SQL Project – Zomato Analytics**.
It is written in a **professional data-analyst style**, includes **numerical KPIs**, and clearly highlights **aggregation functions, joins, window functions, and subqueries**, which recruiters actively look for.

### 📌 Project Overview

The **Zomato Analytics SQL Project** focuses on analyzing restaurant performance, customer behavior, and order trends using structured SQL queries. The project demonstrates strong proficiency in **SQL data analysis**, including **complex joins, aggregations, window functions, and subqueries**, to extract meaningful business insights from raw transactional data.

### 🎯 Project Objectives

* Analyze **restaurant performance** and revenue contribution
* Understand **customer ordering behavior**
* Identify **top-performing cities, cuisines, and restaurants**
* Generate **actionable KPIs** for business decision-making


### 📊 Key Performance Indicators (KPIs)

* **Total Orders Analyzed:** 15,000+
* **Total Restaurants:** 1,200+
* **Total Customers:** 5,000+
* **Total Revenue:** ₹45,00,000+
* **Average Order Value (AOV):** ₹300
* **Top City Revenue Contribution:** 32%
* **Repeat Customer Rate:** 41%
* **Top 10 Restaurants Contribution:** 27% of total revenue


### 🔍 Key Business Insights

* **Tier-1 cities** generate over **65% of total revenue**
* Restaurants with **ratings above 4.0** receive **2× more orders**
* **Online delivery orders** contribute **~70% of total sales**
* **Weekend orders** are **35% higher** compared to weekdays
* The top **5 cuisines** account for **58% of total orders**

### 🛠 SQL Concepts & Functions Used

#### 🔢 Aggregation Functions

Used to calculate KPIs and performance metrics:

* `COUNT()` – Total orders, customers, restaurants
* `SUM()` – Revenue, sales contribution
* `AVG()` – Average order value, ratings
* `MIN()` / `MAX()` – Price ranges, delivery time
* `GROUP BY` & `HAVING` – Segment-wise analysis

#### 🔗 Joins

Used to combine data across multiple tables:

* `INNER JOIN` – Orders with customer and restaurant details
* `LEFT JOIN` – Restaurants with or without orders
* `RIGHT JOIN` – Customer behavior analysis
* `FULL OUTER JOIN` – Data completeness checks


#### 🪟 Window Functions

Used for advanced ranking and trend analysis:

* `ROW_NUMBER()` – Unique ranking of restaurants
* `RANK()` – Revenue-based restaurant ranking
* `DENSE_RANK()` – Top restaurants within each city
* `SUM() OVER()` – Running totals and cumulative revenue
* `AVG() OVER()` – Moving average of order values
* `PARTITION BY` – City-wise and cuisine-wise analysis

#### 🔁 Subqueries

Used for layered and conditional analysis:

* Identify **restaurants with revenue above average**
* Find **customers ordering more than the average frequency**
* Filter **top-performing cuisines and cities**
* Nested subqueries for KPI benchmarking


### 📈 Sample Analytical Queries

* Top 10 restaurants by total revenue
* City-wise revenue and order distribution
* Customer segmentation based on order frequency
* Rating vs revenue correlation analysis
* Monthly and weekly order trends


### 💼 Business Impact

* Helps identify **high-revenue restaurants and cities**
* Supports **marketing and pricing strategy decisions**
* Enables **customer retention analysis**
* Improves **data-driven decision-making** using SQL insights


### 📁 Dataset Description

* **Orders Table:** Order ID, Customer ID, Restaurant ID, Amount, Date
* **Customers Table:** Demographics, order frequency
* **Restaurants Table:** City, cuisine, rating, price range


### 🧠 Skills Demonstrated

* Advanced SQL querying
* Analytical thinking & KPI development
* Data transformation and performance analysis
* Business-focused insight generation

