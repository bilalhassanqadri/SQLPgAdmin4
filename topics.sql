------------Select Section------------
select first_name,last_name from actor;

select * from country;

select first_name,last_name,email from customer;

------------Distinct Section------------

select * from film;

select distinct release_year from film; 

select distinct rental_rate from film;
-- Excersise
-- An Australian visitor isn't familiar with
-- MPAA movie rating
-- we want to know the types of ratings we have in our database
-- what ratings do we have available
--ANSWER
select distinct rating from film;

------------COUNT KEYWORD------------
-- count how many rows are avialble
select count(distinct rating) from film;

select count(*) from payment;

select amount from payment;

select count(distinct amount) from payment;

------------WHERE KEYWORD------------
-- select all the rental_rate that are higher than 4$
select * from film;
select rental_rate from film where rental_rate>4;

-- select all the rental_rate that are higher than 
-- 4$ and replacement_cost greater thanor eqal to 19.99

select * from film 
where rental_rate>4 and replacement_cost>=19.99;

--Challenge No. 1 of where excersise
-- A csutomer forget their wallet at our store! we need to track down 
-- their email to inform them 
--what is the email for the customer with name 'Nancy Thomas'?

select email from customer where first_name='Nancy' and last_name='Thomas';

-- Challenge No.2
-- A customer wants to know what the movie 'Outlaw Hanky' is about.
--could you give them the description for the movie 'Outlaw Hanky'

select description from film where title='Outlaw Hanky';

--Challenge No.3
-- Acustomer is late on their movie return , and we've mailed them a letter
-- to their address at '259 Ipoh Drive'.We should also call them on the phone
-- to let then know

-- can you get the phonr number for the customer who lives at '259 Ipoh Drive'


select phone from address where address='259 Ipoh Drive';


------------ORDER BY ASC or DESC------------
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.

-- The ORDER BY keyword sorts the records in ascending order by default. 
-- To sort the records in descending order, use the DESC keyword.

select * from customer;

select * from customer order by first_name DESC;

select store_id,first_name,last_name 
from customer order by store_id DESC,first_name ASC;

---------LIMIT KEYWORD--------

-- The LIMIT clause is used to specify the number of records to return.
-- The LIMIT clause is useful on large tables with thousands of records. 
-- Returning a large number of records can impact performance.
 
select * from payment 
order by payment_date DESC limit 5;

-- Challenge Task
-- we want to reward our first 10 paying customers.
-- what are the customer ids of the first 10 customers who created a payment?

select * from payment;

select customer_id from payment order by payment_date asc limit 10;

-- A customer wants to quickly rent a video to watch over their short lunch break
-- what are the title of the 5 shortest (in length of runtime)movies
select * from film;

select title,length from film order by (length) asc limit 5; 

-- if the previous customer can watch any movie that is 50 minutes
-- or less in run time , how many options dose she have ?
select count(length) from film where length<=50;

------------BETWEEN KEYWORD------------

--The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- The BETWEEN operator is inclusive: begin and end values are included.
-- the not between operator is the same as:
-- value < low OR value > high
-- value NOT BETWEEN low AND high
-- the between keyword is useful for date. note that you need to formate
-- dates in the ISO standard format,which is YYYY-MM-DD
select count(*) from payment where amount between 8 and 9;
-- all the payments that happens on the first half of Feburary of 2007
select * from payment where payment_date between '2007-02-01' and '2007-02-15';

------------IN Operator------------
--The IN operator allows you to specify multiple values in a WHERE clause.

--The IN operator is a shorthand for multiple OR conditions.

select count(*) from payment where amount in ( 0.99,1.98,1.99); 
select count(*) from payment where amount not in ( 0.99,1.98,1.99); 

------------LIKE and ILIKE------------

-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
-- There are two wildcards often used in conjunction with the LIKE operator:
--The percent sign (%) represents zero, one, or multiple characters
--The underscore sign (_) represents one, single character
--The percent sign and the underscore can also be used in combinations!

select * from customer where first_name LIKE 'J%' and last_name LIKE 'S%';
select * from customer where first_name LIKE '%er%';

-- LIKE is case sesative but ILIKE is not
select * from customer where first_name ILIKE 'j%' and last_name LIKE 'S%';

-- Tasks
-- how many payments transactions wre greater than %5.0?
select count(*) from payment where amount>5;
-- how many actors have a first name that starts with the letter P?
select count(*) from actor where first_name like 'P%';
-- how many unique districts are our customers from?
select count(distinct district) from address;
-- Retrive the list of names for those distinct district from the previous
-- question
select distinct district from address;

-- how many films have a rating of R and a replacment cost between $5 and %15
select count(*) from film where rating='R' and replacement_cost between 5 and 15;
-- how many films have the word Truman somehwre in the title
select count(*) from film where title='%Truman%';

------------GROUP BY SECTION------------

-- The GROUP BY statement groups rows that have the same values into summary rows, 
-- like "find the number of customers in each country".

-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) 
-- to group the result-set by one or more columns.
-- Aggregate function calls happens only with the select clause or the having

select min(replacement_cost) from film;
select max(replacement_cost) from film;

-- round use to reduces the decimal places
select ROUND(avg(replacement_cost),2) from film;

select sum(replacement_cost) from film;

-- VVVV IMPORTANT---
-- When you use group by only for a part of columns in select, 
-- you must have an aggregate function for remaining columns 
-- in the select clause,

select customer_id from payment group by customer_id order by customer_id;

-- question which customer is sepnding most money

select customer_id,SUM(amount) from payment group by customer_id order by SUM(amount) limit 1;

select customer_id,staff_id,sum(amount) from payment group by staff_id,customer_id;

-- group by on date for example to check how much spends on each day
select DATE(payment_date),sum(amount) from payment group by DATE(payment_date) order by sum(amount);

-- Challenge --

-- we have two staff members, with staff IDs 1 and 2. we want to give a bonus
-- to staff member that habdled the most payments.
-- how many payments did each staff memebr handle and who gets the bonus

select staff_id,count(amount) from payment where (staff_id=1 or staff_id=2) group by staff_id;

-- Challenge
-- Corporate HQ is conducting a study on the relationship between replacment 
-- cost and movie MPAA rating (e.g G,PG,R, etc...)

-- what is the average replacment cost per MPAA rating 

select rating,AVG(replacement_cost) from film group by rating;

-- challenge 
-- we are running a promotion to reward our top 5 customers with coupons
-- what are the customers by total sepends

select customer_id,sum(amount) from payment group by customer_id order by sum(amount) desc limit 5;

------------HAVING CLAUSE------------
-- The HAVING clause was added to SQL because the WHERE 
-- keyword cannot be used with aggregate functions.
-- we can not use where to filter base of aggregate results,bcz those 
-- happen after the where is executed
-- having only use on aggregation function

select customer_id,sum(amount) from payment
where customer_id not in (184,87,477) 
group by customer_id having sum(amount)>100;

select store_id,count(*) from customer 
group by store_id having count(*)>300;

-- Challenge
-- 1. Return the customer IDs of customers who have spent at least $110 with the 
-- staff member who has an ID of 2.

select staff_id,customer_id,sum(amount) from payment 
where staff_id=2 group by staff_id,customer_id having sum(amount)>110;

-- How many films begin with the letter J?
select count(*) from film where title like 'J%';

-- What customer has the highest customer ID number whose name starts 
-- with an 'E' and has an address ID lower than 500?

select first_name,last_name from customer 
where first_name like 'E%' and address_id<500 
group by customer_id order by sum(customer_id) desc limit 1;

------------AS KEYWORD------------
-- SQL aliases are used to give a table, or a column in a table, a temporary name.

-- Aliases are often used to make column names more readable.

-- An alias only exists for the duration of that query.

-- AS only should use in select statement anywhere else its not valid
select amount as rental_price from payment;

------------JOIN KEYWORD------------
--A JOIN clause is used to combine rows from two or more tables, based on a related column between them.


------------INNER JOIN KEYWORD------------

-- The INNER JOIN keyword selects records that have matching values in both tables.

select payment.payment_id,customer.customer_id from payment
INNER JOIN customer on  payment.customer_id=customer.customer_id;


------------FULL OUTER JOIN KEYWORD------------
--The FULL OUTER JOIN keyword returns all records when there is a match in 
-- left (table1) or right (table2) table records.
-- mean it returns both the table values either its match or not
-- and fill the null values where the values are not matyched
-- usassly we use this outre join to get the data that is not matched in both 
-- tables with the help of where clause
-- Tip: FULL OUTER JOIN and FULL JOIN are the same.

select *
from payment FULL OUTER JOIN customer on customer.customer_id=payment.customer_id
where payment.customer_id is null and customer.customer_id is null;


------------LEFT OUTER JOIN KEYWORD------------
-- The LEFT JOIN keyword returns all records from the left table (table1),
-- and the matching records from the right table (table2). 
-- The result is 0 records from the right side, if there is no match.

-- A left outer join results in the sets of records that are in the left table
-- of there no match with the left table, the results are null

-- later on we will learn how to add where satemnet toi future modify 
-- a left join 


select * from inventory ;







