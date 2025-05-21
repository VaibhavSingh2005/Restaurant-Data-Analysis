USE swiggy;
SELECT * FROM restaurants;

-- CREATE THE VIEW
DROP VIEW IF EXISTS rest;
CREATE VIEW rest AS (SELECT name,city,rating,rating_count AS "orders",cuisine,cost,cost*rating_count AS "revenue" FROM restaurants);

SELECT * FROM rest;

-- CREATE VIEW FOR end_user

DROP VIEW IF EXISTS user_view;
CREATE VIEW user_view AS (SELECT name,city,rating,rating_count AS "orders",cuisine,cost FROM restaurants);
SELECT * FROM user_view;

-- CREATE A VIEW OF SWEET DISHES

DROP VIEW IF EXISTS user_view;
CREATE VIEW user_view AS (SELECT * FROM restaurants WHERE cuisine IN ("Sweets","Desserts","Bakery","Ice Cream"));
SELECT * FROM user_view;

SELECT DISTINCT cuisine FROM restaurants;

-- VIEW OF TOP 100 RESTAURANTS

DROP VIEW IF EXISTS user_view;
CREATE VIEW user_view AS (SELECT * FROM restaurants ORDER BY rating_count DESC LIMIT 100);
SELECT * FROM user_view;


-- VIEW OF LEAST 100 RESTAURANTS

DROP VIEW IF EXISTS user_view;
CREATE VIEW user_view AS (SELECT * FROM restaurants ORDER BY rating_count ASC LIMIT 100);
SELECT * FROM user_view;

-- CREATE A VIEW OF TOP 1000 MOST EXPENSIVE RESTAURANTS

DROP VIEW IF EXISTS user_view;
CREATE VIEW user_view AS (SELECT * FROM restaurants ORDER BY cost DESC  LIMIT 1000);
SELECT * FROM user_view;

-- CREATE A VIEW OF TOP-RATED RESTAURANT IN A CITY

DROP VIEW IF EXISTS user_view;
CREATE VIEW user_view AS (
SELECT * FROM (
SELECT *,ROW_NUMBER() OVER(PARTITION BY city  ORDER BY rating*rating_count DESC) AS "rank"
 FROM restaurants) 
 AS ranked_table 
 WHERE ranked_table.rank=1);
SELECT * FROM user_view;



