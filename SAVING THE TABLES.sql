USE swiggy;
 SELECT * FROM restaurants;
 
 -- SELECT ALL COLUMNS FROM THE RESTAURANTS TABLE WITH ALIAS "R"
 DROP TABLE IF EXISTS sirsa_restaurants;
 CREATE TABLE IF NOT EXISTS sirsa_restaurants AS  SELECT * FROM restaurants WHERE city= "sirsa";
 
 SELECT * FROM sirsa_restaurants;
 
 -- CREATE A NEW TABLE NAMED "CITY_STATISTICS" CONTAINING AGGREGATED STATICS FOR EACH CITY
 
 DROP TABLE IF EXISTS city_statistics;
 CREATE TABLE IF NOT EXISTS city_statistics AS  SELECT city,avg(rating) AS "average rating",COUNT(*) AS "num_of_restaurants" FROM restaurants GROUP BY city;
 
 SELECT * FROM city_statistics;
 
 -- CREATE A NEW TABLE NAMED "EXPENSIVE_RESTAURANTS" CONTAINING RESTAURANTS WITH COST GREATER THAN $50
  DROP TABLE IF EXISTS expensive_restaurants;
 CREATE TABLE IF NOT EXISTS expensive_restaurants AS  SELECT * FROM restaurants WHERE cost>500;
  SELECT * FROM expensive_restaurants ;
  
  --
SELECT * FROM restaurants AS rest;
--
SELECT rest.city,AVG(rest.cost) AS "average_cost"  FROM  restaurants AS rest GROUP BY rest.city;

-- 
SELECT rest.*   FROM  restaurants AS rest WHERE rest.rating>(SELECT AVG(rating) FROM restaurants WHERE city=rest.city);

--
DROP TABLE IF EXISTS temp_restaurants;
CREATE TEMPORARY TABLE temp_restaurants AS SELECT * FROM restaurants WHERE  city="sirsa"; 
SELECT * FROM temp_restaurants;

--
DROP TABLE IF EXISTS city_statistics;
 CREATE TEMPORARY TABLE IF NOT EXISTS city_statistics AS  SELECT city,avg(rating) AS "average rating",COUNT(*) AS "num_of_restaurants" FROM restaurants GROUP BY city;

SELECT * FROM city_statistics;
--
 DROP TABLE IF EXISTS expensive_restaurants;
 CREATE  TEMPORARY TABLE IF NOT EXISTS expensive_restaurants AS  SELECT * FROM restaurants WHERE cost>500;
  SELECT * FROM expensive_restaurants ;
 
 