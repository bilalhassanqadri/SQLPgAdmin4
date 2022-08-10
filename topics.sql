-- Select Section
select first_name,last_name from actor;

select * from country;

select first_name,last_name,email from customer;

-- Distinct Section

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

-- count
-- count how many rows are avialble
select count(distinct rating) from film;

select count(*) from payment;

select amount from payment;

select count(distinct amount) from payment;

-- WHERE
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


-- Topic
-- ORDER BY
-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.

-- The ORDER BY keyword sorts the records in ascending order by default. 
-- To sort the records in descending order, use the DESC keyword.



















