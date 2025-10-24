This project demonstrates SQL queries for analyzing cellphone sales data using transactional, customer, model, manufacturer, and location tables. The queries cover key SQL concepts like joins, aggregation, filtering, ranking, and advanced window functions.



**Dataset Overview**



The database contains the following tables:



* FACT\_Transactions – Stores transaction details including IDTransaction, IDCustomer, IDModel, Quantity, TotalPrice, Date, and IDLocation.
* DIM\_Customer – Contains customer information like IDCustomer, Customer\_Name.
* DIM\_Location – Stores location details like IDLocation, State, Country, Zipcode.
* DIM\_Model – Stores cellphone model information including IDModel, Model\_Name, Unit\_Price, IDManufacturer.
* DIM\_Manufacturer – Stores manufacturer details including IDManufacturer, Manufacturer\_Name.



**SQL Concepts Used**



* **SELECT** – To choose columns from tables.
* **FROM \& JOIN** – To combine multiple tables based on relationships.
* **WHERE** – To filter records.
* **GROUP BY** – To aggregate data per group (e.g., per state, per model).
* **HAVING** – To filter aggregated results.
* **DISTINCT** – To remove duplicates.
* **ORDER BY** – To sort data ascending or descending.
* **TOP / LIMIT** – To fetch top N records.
* I**NTERSECT \& EXCEPT** – To compare datasets across queries.
* **Aggregate Functions –** SUM(), AVG(), COUNT(), MIN(), MAX() used for numerical summaries.
* **Window Functions** – LAG() to calculate changes over time.
* **Subqueries** – Used to simplify complex queries and fetch intermediate results.



**Objectives**



The main objectives of this project are to:



* Analyze sales data to identify trends in cellphone purchases across states, zip codes, and years.
* Identify top-performing manufacturers and models in terms of sales quantity and revenue.
* Evaluate customer behavior by calculating average spend, quantity, and year-on-year changes.
* Perform comparative analysis using SQL set operations (INTERSECT, EXCEPT) to find patterns over multiple years.
* Practice advanced SQL concepts including joins, aggregations, subqueries, window functions, and filtering with HAVING.
* Extract actionable insights for business decisions, like identifying high-demand regions and top-selling products.



**Key Queries Solved**



The project solves the following business questions:



* List all the states in which we have customers who have bought cellphones from 2005 till today.

* What state in the US is buying the most 'Samsung' cell phones? 
* Show the number of transactions for each model per zip code per state.
* Show the cheapest cellphone (Output should contain the price also)
* Find out the average price for each model in the top5 manufacturers in terms of sales quantity and order by average price. 
* List the names of the customers and the average amount spent in 2009, where the average is higher than 500
* List if there is any model that was in the top 5 in terms of quantity, simultaneously in 2008, 2009 and 2010
* Show the manufacturer with the 2nd top sales in the year of 2009 and the manufacturer with the 2nd top sales in the year of 2010. 
* Show the manufacturers that sold cellphones in 2010 but did not in 2009. 
* Find top 100 customers and their average spend, average quantity by each year. Also find the percentage of change in their spend. 

&nbsp;	



**Key Takeaways**



* **Joins** help combine related tables to extract meaningful insights.
* **Aggregations** (SUM, AVG, COUNT, MIN) summarize transactional data efficiently.
* **Window Functions** like LAG allow analyzing trends over time.
* **Subqueries \& Nested Querie**s simplify complex operations.
* **Set Operations** (INTERSECT, EXCEPT) help compare datasets.
* **Filtering \& Sorting** (WHERE, HAVING, ORDER BY) refine results for analysis.



**Tools \& Technologies**



The following tools and technologies were used in this project:



* **SQL Server / SSMS** – Used to write and execute SQL queries for data analysis.
* **SQL (Structured Query Language)** – For querying, aggregating, and analyzing data.
* **Concepts used:** SELECT, JOIN, WHERE, GROUP BY, HAVING, ORDER BY, DISTINCT, TOP, LAG, INTERSECT, EXCEPT.
* **Relational Database Management System (RDBMS)** – Organizes data into tables such as FACT\_Transactions, DIM\_Customer, DIM\_Location, DIM\_Model, and DIM\_Manufacturer.
* **Data Analysis \& Reporting** – Using SQL queries to extract business insights on sales, customers, and manufacturers.
* **Git \& GitHub** – Version control and project repository management.	
