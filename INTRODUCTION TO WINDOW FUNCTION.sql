CREATE DATABASE swiggy;
use swiggy;
SELECT * FROM restaurants;

-- CREATE NEW COLUMN CONTAINING AVERAGE RATING OF RESTAURANTS THROUGH THE DATASET
SELECT * , AVG(rating) OVER() FROM restaurants;
SELECT * , ROUND(AVG(rating) OVER(),2) AS "avg_rating" FROM restaurants;

-- CREATE NEW COLUMN CONTAINING AVERAGE RATING_COUNT OF RESTAURANTS THROUGHOUT THE DATASET
SELECT * , ROUND(AVG(rating_count) OVER(),2) AS "avg_rating_count" FROM restaurants;

-- CREATE A NEW COLUMN CONTAINING AVERAGE COST OF RESTAURANT THROUGHOUT THE DATASET
SELECT * , ROUND(AVG(cost) OVER(),2) AS "avg_cost" FROM restaurants;

-- CREATE COLUMN CONTAINING AVERAGE,MIN,MAX OF COST,RATING,RATING_COUNT OF RESTAURANTS THROUGHOUT THE DATASET

SELECT id,name,city,cuisine,rating,
ROUND(MAX(rating) over(),2) AS "max_rating" ,
ROUND(avg(rating) over(),2) AS "avg_rating" ,
ROUND(min(rating) over(),2) AS "min_rating" ,
ROUND(MAX(cost) over(),2) AS "max_cost" ,
ROUND(avg(cost) over(),2) AS "avg_cost" ,
ROUND(min(cost) over(),2) AS "min_cost" 



FROM restaurants;

-- CREATE COLUMN CONTAINING AVERAGE COST OF CITY WHERE THAT SPECIFIC RESTAURANT IS FROM
SELECT * ,ROUND(AVG(cost) over()) AS "avg_cost" FROM restaurants;

SELECT * ,ROUND(AVG(cost) over(PARTITION BY city)) AS "avg_cost" FROM restaurants;

-- CREATE COLUMN CONTAINING AVERAGE COST OF CUISINE WHICH THAT SPECIFIC RESTAURANT IS SERVING
SELECT * ,ROUND(AVG(cost) over(PARTITION BY cuisine)) AS "avg_cost" FROM restaurants;

-- CREATE BOTH COLUMN TOGETHER
SELECT *,
ROUND(AVG(cost) over(PARTITION BY city)) AS "avg_cost_city",
ROUND(AVG(cost) over(PARTITION BY cuisine)) AS "avg_cos_cuisine"
FROM restaurants;

-- LIST OF RESTAURANT WHOSE COST IS MORE THAN THE AVERAGE COST OF RESTAURANTS?
SELECT * FROM restaurants WHERE cost>(SELECT avg(cost) FROM restaurants);
SELECT * FROM
(SELECT *,AVG(cost) over() AS "avg_cost" FROM restaurants) t WHERE t.cost>t.avg_cost;

-- LIST THE RESTAURANT WHOSE CUISINE COST IS MORE THAN AVERAGE COST

SELECT * FROM
(SELECT *,AVG(cost) over(PARTITION BY cuisine) AS "avg_cost" FROM restaurants) t WHERE t.cost>t.avg_cost;

SELECT COUNT(*) FROM
(SELECT *,AVG(cost) over(PARTITION BY cuisine) AS "avg_cost" FROM restaurants) t WHERE t.cost>t.avg_cost;