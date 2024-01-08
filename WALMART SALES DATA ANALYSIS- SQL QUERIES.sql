CREATE DATABASE WALMART_SALES;
USE WALMART_SALES;
CREATE TABLE IF NOT EXISTS sales (
invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
branch VARCHAR(5) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL, gender VARCHAR(10) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10, 2) NOT NULL,
quantity INT NOT NULL,
VAT FLOAT(6, 4) NOT NULL,
total DECIMAL(12, 4) NOT NULL,
date DATETIME NOT NULL,
time TIME NOT NULL,
payment_method VARCHAR(15) NOT NULL,
cogs DECIMAL(10, 2) NOT NULL,
gross_margin_pct FLOAT(11, 9),
gross_income DECIMAL(12, 4) NOT NULL,
rating FLOAT (2, 1)
);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------Feature Engineering ------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------time_of_day ------------------------------------------------

select time,
(case
when time between "00:00:00" and "12:00:00" then "Morning"
when time between "12:01:0" and "16:00:00" then "Afternoon"
else "Evening"
END
)
as time_of_date
from sales;
alter table sales 
drop column time_of_date;

ALTER TABLE SALES ADD column time_of_day varchar(20);
update sales
set time_of_day =
(case
when time between "00:00:00" and "12:00:00" then "Morning"
when time between "12:01:0" and "16:00:00" then "Afternoon"
else "Evening"
END
);
-- ---------------------------------------------------- day_name ---------------------------------------------------------------------------------------
alter table  sales add column day_name varchar(50);
UPDATE SALES
SET DAY_NAME= dayname(DATE);
-- ---------------------------------------------------- month_name --------------------------------------------------------------------------------------------
alter table sales add column month_name varchar(10);
update sales
set month_name = monthname(date);


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------- # GENERIC  --------------------------------------------------------------------------------------------------------------

-- ---- HOW MANY UNIQUE CITIES DOES THE DATA HAVE? --------------------
select distinct city
from sales;

-- ------ IN WHICH CITY IS EACH BRANCH? ----------------------------
select city, branch
from sales
group by
city, Branch;


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------- # PRODUCT --------------------------------------------------------------------------------------------------------------

-- ----- HOW MANY UNIQUE PRODUCT LINES DOES THE DATA HAVE? -------------------
select count(distinct product_line)  
as cnt_pro_line
from sales; 

-- ------WHAT IS THE MOST COMMON PAYMENT METHOD? -------------------------------
select (payment_method),
count(payment_method)
from sales
group by payment_method 
order by count(payment_method) desc;

-- -------WHAT IS THE MOST SELLING PRODUCT LINE? -----------------------------------
select product_line,
count(product_line)
from sales
group by product_line
order by count(product_line) desc
limit 1;

-- --------- WHAT IS THE REVENUE BY MONTH? --------------------------------------------
select month_name ,sum(total)
from sales
group by month_name
order by sum(total) desc;

-- ------------WHAT MONTH HAD THE LARGEST COGS? -----------------------------------------
select month_name, sum(cogs)
from sales
group by month_name
order by sum(COGS) desc;

-- ------------WHAT PRODUCT LINE HAS THE LARGEST REVENUE? --------------------------------
select product_line,sum(total)
from sales
group by product_line
order by sum(total) desc;

-- ------------WHAT IS THE CITY WITH THE LARGEST REVENUE? ---------------------------------
select sum(total), city
from sales
group by city
order by sum(total) desc
limit 1;

-- ------------WHAT PRODUCT LINE HAS THE LARGEST VAT? ---------------------------------------
select product_line, sum(VAT)
from sales
group by product_line
order by sum(VAT) desc;

-- ------------WHICH BRANCH SOLD MORE PRODUCTS THAN THE AVERGAE PRODUCT SOLD? -----------------
select branch, sum(quantity)
from sales 
group by branch
having sum(quantity) > (select avg(quantity) from sales);

-- -------------WHAT IS THE MOST COMMON PRODUCT LINE BY GENDER? ---------------------------------
select product_line, gender ,count(gender)
from sales
group by product_line, gender
order by count(gender) desc;

-- ------------WHAT IS THE AVG  RATING OF EACH PRODUCT LINE? ---------------------------------
select product_line, avg(rating)
from sales
group by product_line
order by avg(rating) desc;


-- ------------------------------------------------------------------------------------------
-- -------------------------------------- #SALES ---------------------------------------------

-- -------------NUMBER OF SALES MADE EACH TIME OF THE DAY PER WEEKEND-------------------------
select time_of_day, count(total)
from sales
where day_name = "Monday"
group by time_of_day;

-- -------------WHICH OF THE CUSTOMER TYPES BRINGS THE MOST REVENUE? ------------------------------
select customer_type, sum(total)
from sales
group by customer_type
order by sum(total) desc;

-- -------------WHICH CITY HAS THE LARGEST TAX PERCENTAGE/VAT?--------------------------------------
select city, sum(VAT)
from sales
group by  city
order by sum(VAT) desc;

-- -------------WHICH CUSTOMER TYPES PAYS THE MOST IN VAT?--------------------------------------------
select customer_type, sum(VAT)
from sales
group by customer_type
order by sum(VAT) desc;



-- ------------------------------------------------------------------------------------------
-- -------------------------------------- #CUSTOMERS ---------------------------------------------

-- ---------------HOW MANY UNIQUE CUSTOMERS TYPES DOES THE DATA HAVE?------------------------------------
select distinct customer_type
from sales;

-- ---------------HOW MANY UNIQUE PAYMENT METHOD DOES THE DATA HAVE? -------------------------------------
select distinct payment_method
from sales;

-- ---------------WHAT IS THE MOST COMMON CUSTOMER TYPE?-------------------------------------------------
select customer_type, count(customer_type)
from sales
group by customer_type
order by count(customer_type) desc;

-- ---------------WHICH CUSTOMER TYPE BUYS THE MOST? -------------------------------------------------------
select customer_type,  count(total)
from sales
group by customer_type
order by count(total) desc;

-- ----------------	WHAT IS THE GENDER OF MOST OF THE CUSTOMERS?--------------------------------------------
select  gender, count(gender)
from sales
group by  gender
order by count(gender) desc;

-- -----------------WHAT IS THE GENDER DISTRIBUTION PER BRANCH?-----------------------------------------------
select branch, gender , count(gender)
from sales
group by branch, gender
order by count(gender) desc;
-- --------------------------OR[SWITCH ACCORDINGLY]-----------------------------------------------
select  gender , count(gender)
from sales
where branch = "A"
group by gender
order by count(gender) desc;

-- -----------------WHICH TIME OF THE DAY DO CUSTOMERS GIVE MOST RATINGS?----------------------------
select time_of_day, avg(rating)
from sales
group by time_of_day
order by avg(rating) desc;

-- -----------------WHICH TIME OF THE DAY DO CUSTOMERS GIVE MOST RATINGS PER BRANCH? ----------------------------
select time_of_day, branch, avg(rating)
from sales
group by time_of_day, branch
order by avg(rating) desc;
-- -----------------------------------------OR[SWITCH ACCORDINGLY A,B,C]---------------------------------------------------------------------
select time_of_day, avg(rating)
from sales
where branch = "A"
group by time_of_day
order by avg(rating) desc;

-- -----------------WHICH DAY OF THE WEEK HAS THE BEST AVG RATING? ---------------------------------------------------------------------------
select day_name, avg(rating)
from sales
group by day_name
order by avg(rating) desc;

-- ------------------WHICH DAY OF THE WEEK HAS THE BEST AVG RATING PER BRANCH?----------------------------------------------------------------
select day_name,branch, avg(rating)
from sales
group by day_name, branch
order by avg(rating) desc;
-- ------------------OR SWITCH ACCORDINGLY BRANCH [A,B,C]------------------------------------------------------------------------------------------
select day_name, avg(rating)
from sales
where branch = "A"
group by day_name
order by avg(rating) desc;



-- ---------------------------------------------------#######-------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------THANKS ----------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------#######-----------------------------------------------------------------------------------------------------------







