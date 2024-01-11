CREATE DATABASE S;
USE S;
CREATE TABLE swiggy(
   restaurant_no   INTEGER  NOT NULL 
  ,restaurant_name VARCHAR(50) NOT NULL
  ,city            VARCHAR(9) NOT NULL
  ,address         VARCHAR(204)
  ,rating          NUMERIC(3,1) NOT NULL
  ,cost_per_person INTEGER 
  ,cuisine         VARCHAR(49) NOT NULL
  ,restaurant_link VARCHAR(136) NOT NULL
  ,menu_category   VARCHAR(66)
  ,item            VARCHAR(188)
  ,price           VARCHAR(12) NOT NULL
  ,veg_or_nonveg   VARCHAR(7)
);
SELECT * FROM swiggy;
#Q1
SELECT COUNT(DISTINCT restaurant_name) 
AS high_rated_restaurants
FROM swiggy
WHERE rating>4.5;

#Q2
SELECT city,count(DISTINCT restaurant_name) 
AS restaurant_count FROM swiggy
GROUP BY city
ORDER BY restaurant_count DESC
LIMIT 1;

#Q3
SELECT DISTINCT restaurant_name AS pizza_restaurants
FROM swiggy 
WHERE restaurant_name LIKE '%Pizza%';

#Q4
SELECT cuisine,count(*) AS cuisine_count
FROM swiggy
GROUP BY cuisine
ORDER BY  cuisine_count DESC
LIMIT 1;

#Q5
SELECT city, AVG(rating) AS average_rating
FROM swiggy GROUP BY city;

#Q6
SELECT DISTINCT restaurant_name,
menu_category,max(price) AS highestprice
FROM swiggy WHERE menu_category='Recommended'
GROUP BY restaurant_name,menu_category;

#Q7
SELECT DISTINCT restaurant_name,cost_per_person
FROM swiggy WHERE cuisine<>'Indian'
ORDER BY cost_per_person DESC
LIMIT 5;

#Q8
SELECT DISTINCT restaurant_name,cost_per_person
FROM swiggy WHERE cost_per_person>(
SELECT AVG(cost_per_person) 
FROM swiggy);

#Q9
SELECT DISTINCT t1.restaurant_name,t1.city,t2.city
FROM swiggy t1 JOIN swiggy t2 
ON t1.restaurant_name=t2.restaurant_name AND
t1.city<>t2.city;

#Q10
SELECT DISTINCT restaurant_name,menu_category
,count(item) AS no_of_items FROM swiggy
WHERE menu_category='Main Course' 
GROUP BY restaurant_name,menu_category
ORDER BY no_of_items DESC 
LIMIT 1;

#Q11
SELECT DISTINCT restaurant_name,
(count(CASE WHEN veg_or_nonveg='Veg' THEN 1 END)*100/
count(*)) AS vegetarian_percetage
FROM swiggy
GROUP BY restaurant_name
HAVING vegetarian_percetage=100.00
ORDER BY restaurant_name;

#Q12
SELECT DISTINCT restaurant_name,
AVG(price) AS average_price
FROM swiggy GROUP BY restaurant_name
ORDER BY average_price 
LIMIT 1;

#Q13
SELECT DISTINCT restaurant_name,
count(DISTINCT menu_category) AS no_of_categories
FROM swiggy
GROUP BY restaurant_name
ORDER BY no_of_categories DESC 
LIMIT 5;

#Q14
SELECT DISTINCT restaurant_name,
(count(CASE WHEN veg_or_nonveg='Non-veg' THEN 1 END)*100
/count(*)) AS nonvegetarian_percentage
FROM swiggy
GROUP BY restaurant_name
ORDER BY nonvegetarian_percentage DESC 
LIMIT 1;






