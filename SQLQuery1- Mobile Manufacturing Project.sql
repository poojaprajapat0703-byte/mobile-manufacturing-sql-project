Select top 1  * from DIM_customer
Select top 1  * from DIM_date
Select top 1   * from DIM_location
Select top 1  * from DIM_manufacturer
Select top 1  * from DIM_model
Select top 1  * from Fact_Transactions

---Question: 1 List all the states in which we have customers who have bought cellphones from 2005 till today.

--- Here , we need States,customerId , Id Model
--- we need to join transaction table with Location because state is there
--- we just need states

select distinct State from(
select (T1.state), SUM(Quantity) as CNT,Year(T2.Date)as Year from DIM_LOCATION as T1
join FACT_TRANSACTIONS as T2
on T1.IDLocation=T2.IDLocation
where Year(T2.Date)>=2005
group by  T1.state,Year(T2.Date)
) as RESULT

---Question:2  What state in the US is buying the most 'Samsung' cell phones?

--- we need State,country Manufacturer_name
--- we need location, manufacturer aand transaction table, IDmodel

--- Solution for better understanding of Joins
select state,country,Manufacturer_Name from DIM_LOCATIOn as t1
join FACT_TRANSACTIONs as t2
on t1.IDLocation=t2.IDLocation
join DIM_MODEL as t3
on t2.IDModel=t3.IDModel
join DIM_MANUFACTURER as t4
on t3.IDManufacturer=t4.IDManufacturer
where country='US'and Manufacturer_name='samsung'

---Final solution 

select  state , count(*) as CNT from DIM_LOCATIOn as t1
join FACT_TRANSACTIONs as t2
on t1.IDLocation=t2.IDLocation
join DIM_MODEL as t3
on t2.IDModel=t3.IDModel
join DIM_MANUFACTURER as t4
on t3.IDManufacturer=t4.IDManufacturer
where country='US'and Manufacturer_name='samsung'
group by state
order by CNT desc

---Question:3  Show the number of transactions for each model per zip code per state.

select IDModel , state,Zipcode,count(*) as No_of_Transaction
from Fact_Transactions as t1
join DIM_Location as t2
on t1.IDLocation=t2.IDLocation
group by IDModel ,state,Zipcode

--- Question: 4 Show the cheapest cellphone (Output should contain the price also) 
Select  * from DIM_model

select Model_name , min(Unit_price) as Min_Price from DIM_Model
group by Model_Name
order by Min_Price asc

--- Question: 5 Find out the average price for each model in the top5 manufacturers in  terms of sales quantity and order by average price.   

--- 1. FInd average price of each Model

select IDmodel,avg(TotalPrice) as AVG_Price ,sum(quantity) as Total_Qty 
from Fact_Transactions 
group by IDmodel

--- 2. find top 5 manufacturer
select manufacturer_name , sum(totalprice) as sales from FACT_Transactions as t1
join DIM_Model  as t2
on t1.IDModel =t2.IDModel
join DIM_Manufacturer as t3
on t2 .IDManufacturer = t3.IDManufacturer
group by  Manufacturer_Name
order by Sales Desc

---merging to have a final output 

select t1.IDmodel,avg(TotalPrice) as AVG_Price ,sum(quantity) as Total_Qty 
from Fact_Transactions as t1
join DIM_Model  as t2
on t1.IDModel =t2.IDModel
join DIM_Manufacturer as t3
on t2 .IDManufacturer = t3.IDManufacturer
where manufacturer_name in (select top 5 manufacturer_name from FACT_Transactions as t1
                           join DIM_Model  as t2
                           on t1.IDModel =t2.IDModel
                           join DIM_Manufacturer as t3
                           on t2 .IDManufacturer = t3.IDManufacturer
                           group by  Manufacturer_Name
                           order by sum(TotalPrice) Desc )

group by t1.IDmodel
order by AVG_Price desc

---Question:6 List the names of the customers and the average amount spent in 2009,  where the average is higher than 500  

select Customer_name , avg(totalprice) as AVG_Price ,year(date) as Year from DIM_Customer as t1
join Fact_transactions as t2
on t1.IDcustomer=t2.IDcustomer
where year(date)=2009 
group by Customer_Name,year(date)
having avg(totalprice)>500

/*-- Order of execution of SQL Query At the Backend
      FROM
	    WHERE
		GROUP BY
		HAVING
		SELECT
		ORDER BY 
		LIMIT/TOP */


/*--Syntax of SQL Query 
      SELECT
      FROM
	    WHERE
		GROUP BY
		HAVING
		ORDER BY 
		LIMIT/OFFSET
		             */

--- QUestion :7	List if there is any model that was in the top 5 in terms of quantity, simultaneously in 2008, 2009 and 2010?

select * from (
select  top 5 IDmodel from FACT_Transactions 
where year(date)= 2008
group by IDmodel,year(date)
order by Sum(quantity) desc) as A
intersect
Select * from (
select top 5 IDmodel from FACT_Transactions 
where year(date)= 2009
group by IDmodel,year(date)
order by Sum(quantity) desc) as B
intersect
Select * from (
select top 5 IDmodel from FACT_Transactions 
where year(date)= 2010
group by IDmodel,year(date)
order by Sum(quantity) desc) as C

--- Question:8 Show the manufacturer with the 2nd top sales in the year of 2009 and the manufacturer with the 2nd top sales in the year of 2010.   

select * from (
select top 1 * from (
select top 2 manufacturer_name,year(date) as Year, sum(totalprice) as Sales from Fact_transactions as t1
join DIm_model as t2
on t1.Idmodel=t2.Idmodel
join DIM_manufacturer as t3
on t2.IDmanufacturer=t3.IDmanufacturer
where year(date)=2009
group by manufacturer_name,year(date)
order by sales desc) as A
order by SAles asc) as C

UNION
select * from(
select top 1 * from (
select top 2 manufacturer_name,year(date) as Year, sum(totalprice) as Sales from Fact_transactions as t1
join DIm_model as t2
on t1.Idmodel=t2.Idmodel
join DIM_manufacturer as t3
on t2.IDmanufacturer=t3.IDmanufacturer
where year(date)=2010
group by manufacturer_name,year(date)
order by sales desc) as B
order by Sales asc
) as D

--- Question: 9  Show the manufacturers that sold cellphones in 2010 but did not in 2009.   

select manufacturer_name from Fact_transactions as t1
join DIm_model as t2
on t1.Idmodel=t2.Idmodel
join DIM_manufacturer as t3
on t2.IDmanufacturer=t3.IDmanufacturer
where year(date)=2010 
group by manufacturer_name
except 
select manufacturer_name from Fact_transactions as t1
join DIm_model as t2
on t1.Idmodel=t2.Idmodel
join DIM_manufacturer as t3
on t2.IDmanufacturer=t3.IDmanufacturer
where year(date)=2009
group by manufacturer_name

--- Question:10 Find top 10 customers and their average spend, average quantity by each year. Also find the percentage of change in their spend. 

--- Top 10 customer
select  top 10 IDcustomer, sum(totalprice) as spend from fact_transactions
group by IDcustomer
order by sum(totalprice) desc 

---Average spend
select * , ((avg_price-lag_price)/lag_price) as percentage_change  from (
select *, lag(avg_price,1) over (partition by IDcustomer order by year) as lag_price from (
select IDcustomer, year(date ) as Year, avg(totalprice) as avg_price, sum(quantity) as qty from fact_transactions
where Idcustomer in (select  top 10 IDcustomer from fact_transactions
                     group by IDcustomer
                     order by sum(totalprice) desc )
group by IDcustomer, year(date) 
) as A
)as B