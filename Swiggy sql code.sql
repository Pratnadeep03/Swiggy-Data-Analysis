SELECT * FROM swiggy;
USE swiggy;
select * from swiggy;

#1 HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
SELECT COUNT(distinct restaurant_name)
as high_rated_restaurant
FROM swiggy
WHERE rating > 4.5;

#2 WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
SELECT city, count(distinct restaurant_name)
as restaurant_count FROM swiggy
GROUP BY city
order by restaurant_count desc
limit 1;

#3 HOW MANY RESTAURANTS HAVE THE WORD "PIZZA" IN THEIR NAME?
SELECT count(distinct restaurant_name)
FROM swiggy
WHERE restaurant_name like "%Pizza%";

#4 WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS IN THE DATASET?
SELECT cuisine, count(*)
as cuisine_count FROM swiggy
group by cuisine
order by cuisine_count desc
limit 1;

#5 WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
SELECT city, AVG(rating)
FROM swiggy
GROUP BY city;

#6 WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU FOR EACH RESTAURANT?
SELECT distinct restaurant_name, menu_category, max(price)
as highestprice FROM swiggy
where menu_category='Recommended'
group by restaurant_name, menu_category;

#7 FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE?
SELECT distinct restaurant_name, cost_per_person
from swiggy
where not cuisine='Indian'
order by cost_per_person desc
limit 5;

#8 FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE AVERAGE COST OF ALL RESTAURANTS TOGETHER.
SELECT distinct restaurant_name, cost_per_person
from swiggy 
where cost_per_person >(
select avg (cost_per_person) from swiggy);

#9 WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' category?
SELECT distinct restaurant_name, menu_category, count(item)
as no_of_items from swiggy
where menu_category= 'main course'
group by restaurant_name, menu_category
order by no_of_items desc
limit 1;

#10 WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE OF ALL TIMES?
SELECT distinct restaurant_name, avg(price)
from swiggy
group by restaurant_name
order by avg(price)
limit 1;

