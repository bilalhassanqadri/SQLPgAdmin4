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
select count(*) from film where title='%Truman%'