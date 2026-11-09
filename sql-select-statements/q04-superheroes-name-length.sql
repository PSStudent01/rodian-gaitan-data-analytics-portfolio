/* 
4)
The Superheroes Name:
- The information of the superheroes have been stored in the SUPERHERO table. 
- Write a query to print the names, i.e., SUPERHERO.NAME, of the superheroes whose NAME has fewer than 7 characters. 
- Sort the output in increasing order of their IDs.
[Batman
Thor
Hulk]
*/

-- Create table
CREATE TABLE SUPERHERO (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    LATITUDE FLOAT NOT NULL,
    LONGITUDE FLOAT NOT NULL
);

-- Insert sample data
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (1, 'Batman', 50.0, 85.0);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (2, 'Spiderman', 65.0, 65.0);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (3, 'Thor', 45.0, 30.0);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (4, 'Deadpool', 25.0, 69.0);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (5, 'Hulk', 30.0, 20.0);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (6, 'Captain America', 70.0, 75.0);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (7, 'Superman', 85.0, 45.0);

-- Verify table was created
SELECT *
FROM Superhero;

-- Query to address the question at hand
SELECT name
FROM Superhero
-- WHERE WIDTH(name) < 7
 WHERE LENGTH(name) < 7
ORDER BY id;

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Filtering records using the WHERE clause.
- Using the LENGTH() string function to evaluate character counts.
- Sorting query results using ORDER BY.
- Returning results in ascending order.

Key Takeaway:
SQL string functions can be used to evaluate text values and filter
records based on characteristics such as character length. The
ORDER BY clause controls the sequence in which query results are
displayed, making it easier to organize and review retrieved data.
{RG}
*/