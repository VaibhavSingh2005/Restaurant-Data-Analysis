use swiggy;
SELECT * FROM restaurants;

-- FINDING THE RESTAURANT_ID FROM THE LINK
SELECT *, SUBSTRING_INDEX(link,"-",-1) AS "id" FROM restaurants;

-- UPDATE THE RESTAURANT_ID IN ORIGINAL TABLE

CREATE TABLE IF NOT EXISTS rest_1 AS (
 SELECT *, SUBSTRING_INDEX(link,"-",-1) AS "UID" FROM restaurants
 );
 SELECT * FROM rest_1;


-- CLEAN THE NAME COLUMN AND UPDATE IT ON THE TABLE

CREATE TABLE IF NOT EXISTS rest_2 AS (
 SELECT *, LOWER(TRIM(name))  AS new_name FROM restaurants
 );
 SELECT * FROM rest_2;
 
 -- CLEAN THE CITY AND CUISINE COLUMN AND UPDATE IT ON THE TABLE
 CREATE TABLE IF NOT EXISTS rest_3 AS (
 SELECT new_id,new_name, LOWER(TRIM(city)) AS clean_city,rating,rating_count,LOWER(TRIM(cuisine)) AS clean_cuisine,cost FROM rest_2
 );
 SELECT * FROM swiggy.rest_3;
 
 
 -- REMOVE ODD CUISINES FROM THE TABLE
 
 SELECT DISTINCT clean_cuisine FROM rest_3;
 
 
 CREATE TABLE IF NOT EXISTS rest_4 AS (
 SELECT new_id,new_name,clean_city,rating,rating_count,clean_cuisine,cost FROM rest_3 WHERE clean_cuisine NOT IN("combo","na","tex-mex");
 );
 SELECT * FROM swiggy.rest_4;
