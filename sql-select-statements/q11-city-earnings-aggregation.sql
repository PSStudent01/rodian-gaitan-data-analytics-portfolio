
/* 
11)
Least Earning Locations:
- A ride hailing company has their DB structured in 3 major tables as described in SCHEMA below.
- Write a query to fetch the city names along with earnings from each city. 
- 'Earnings' are calculated as the sum of fares of all the rides taken in that city. 
- The output should be structured as: cities.name earnings
- The output is sorted ascending by earnings, then ascending by the city name.
[South Suzanne 1050
Cooktown 1710]
 */

-- Create tables
CREATE TABLE CITIES (
    id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE USERS (
    id VARCHAR(36) PRIMARY KEY,
    city_id VARCHAR(36) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    FOREIGN KEY (city_id) REFERENCES CITIES(id)
);

CREATE TABLE RIDES (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    distance INTEGER NOT NULL,
    fare INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USERS(id)
);

-- Insert CITIES
INSERT INTO CITIES (id, name) VALUES ('1', 'Cooktown');
INSERT INTO CITIES (id, name) VALUES ('2', 'South Suzanne');

-- Insert USERS
INSERT INTO USERS (id, city_id, name, email) VALUES ('1', '2', 'Robert Delgado', 'robertdelgado@hotmail.com');
INSERT INTO USERS (id, city_id, name, email) VALUES ('2', '2', 'Thomas Williams', 'thomaswilliams@bradley.org');
INSERT INTO USERS (id, city_id, name, email) VALUES ('3', '1', 'Michele Peterson', 'michelepeterson@hotmail.com');
INSERT INTO USERS (id, city_id, name, email) VALUES ('4', '1', 'Bill Wheeler', 'billwheeler@gmail.com');
INSERT INTO USERS (id, city_id, name, email) VALUES ('5', '1', 'David Lloyd', 'davidlloyd@gmail.com');
INSERT INTO USERS (id, city_id, name, email) VALUES ('6', '1', 'Morgan Powers', 'morganpowers@hansen.biz');

-- Insert RIDES
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('1', '1', 21, 200);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('2', '3', 6, 55);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('3', '2', 30, 230);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('4', '2', 16, 125);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('5', '2', 11, 110);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('6', '6', 30, 285);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('7', '3', 18, 170);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('8', '1', 6, 50);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('9', '2', 4, 40);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('10', '1', 10, 90);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('11', '6', 11, 95);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('12', '5', 16, 140);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('13', '3', 24, 220);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('14', '6', 17, 160);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('15', '2', 23, 205);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('16', '3', 11, 90);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('17', '6', 5, 50);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('18', '3', 19, 180);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('19', '5', 22, 205);
INSERT INTO RIDES (id, user_id, distance, fare) VALUES ('20', '4', 6, 60);

-- Verify table was created
SELECT * 
FROM Cities
ORDER By id;

SELECT * 
FROM Users
ORDER By id;

SELECT * 
FROM Rides
ORDER By id;
-- ORDER BY id;
/*so tell me why when I run the following query it ignores the sort by id?  
- That's almost certainly a data type issue, not the ORDER BY actually being ignored.
- Looking back at the schema, the id column in RIDES is defined as a String*/

-- Queries to address the question at hand

-- a) tells rider to city
SELECT C.name, C.id, U.name, U.id
FROM Cities C
JOIN Users U ON C.id = U.city_id;

-- b) tells total spent per rider
SELECT user_id, SUM(fare)
FROM Cities C
JOIN Users U ON C.id = U.city_id
JOIN Rides R ON U.id = R.user_id
GROUP BY user_id;

-- c)
SELECT C.name, SUM(R.fare) AS earnings
FROM Cities C
JOIN Users U ON C.id = U.city_id
JOIN Rides R ON U.id = R.user_id
GROUP BY C.name
ORDER BY earnings ASC, C.name ASC;
/*it was simple...
- the aggregate function was correct, you making sure you have the right prefix
- then rather than grouping by user_name, you were supposed to group by city_name */

/*
What This Exercise Demonstrates:
- Creating relational tables with primary and foreign keys.
- Inserting and verifying data across multiple tables.
- Establishing relationships between tables using JOIN.
- Using table aliases to simplify SQL queries.
- Calculating totals using the SUM() aggregate function.
- Grouping records using GROUP BY.
- Aggregating numerical data at the city level.
- Sorting aggregated results using ORDER BY.
- Applying secondary sorting criteria.

Key Takeaway:
SQL JOIN operations allow related data stored across multiple
tables to be combined into a single result set. Aggregate
functions such as SUM(), combined with GROUP BY, can calculate
business metrics at different levels, such as per customer or
per city. These techniques are fundamental to relational
database reporting, financial analysis, and operational reporting.
{RG}
*/
