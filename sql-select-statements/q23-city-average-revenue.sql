/* 
23)
City Revenue:
Write a query to print the floor of the average revenue for each city. The average revenue is defined as the average of all agencies' estimates of revenue for a city. The output should be in the format: CITY_NAME AVERAGE_REVENUE. Row order is not important.
Schema — two tables: CITIES, and REVENUE
[returns
New York 10
London 7
Paris 15]
*/


-- Create tables
CREATE TABLE CITIES_II (
    CITY_CODE INTEGER PRIMARY KEY,
    CITY_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE REVENUE (
    CITY_CODE INTEGER NOT NULL,
    REVENUE INTEGER NOT NULL,
    FOREIGN KEY (CITY_CODE) REFERENCES CITIES_II(CITY_CODE)
);

-- Insert CITIES_II
INSERT INTO CITIES_II (CITY_CODE, CITY_NAME) VALUES (1, 'New York');
INSERT INTO CITIES_II (CITY_CODE, CITY_NAME) VALUES (2, 'London');
INSERT INTO CITIES_II (CITY_CODE, CITY_NAME) VALUES (3, 'Paris');

-- Insert REVENUE
INSERT INTO REVENUE (CITY_CODE, REVENUE) VALUES (1, 10);
INSERT INTO REVENUE (CITY_CODE, REVENUE) VALUES (2, 5);
INSERT INTO REVENUE (CITY_CODE, REVENUE) VALUES (2, 10);
INSERT INTO REVENUE (CITY_CODE, REVENUE) VALUES (3, 15);

-- Verify tables were created
SELECT *
FROM Cities_II ;

SELECT *
FROM Revenue ;

-- Queries to address the question at hand
# Pending Practice
SELECT city_name, FLOOR(AVG(revenue)) AS average_revenue
FROM Cities_II c
JOIN Revenue r ON c.city_code = r.city_code
GROUP BY city_name;

/*
What This Exercise Demonstrates:
- Joining related tables using a common key.
- Using table aliases to simplify SQL statements.
- Calculating averages with the AVG() aggregate function.
- Grouping records with GROUP BY.
- Rounding numerical results down using FLOOR().
- Assigning a column alias to a calculated result.

Key Takeaway:
SQL can combine related data from multiple tables and calculate
aggregated results for each group. AVG() calculates the average
value, while FLOOR() rounds that result down to the nearest
whole number. These techniques are useful for generating
summaries and reports from relational databases.

Important SQL concepts:
- JOIN: Retrieve related information from multiple tables.
- AVG(): Calculate the average of a group of numerical values.
- GROUP BY: Perform calculations separately for each city.
- FLOOR(): Round a decimal result down to a whole number.
- AS: Give a calculated column a meaningful output name.
{RG}
*/