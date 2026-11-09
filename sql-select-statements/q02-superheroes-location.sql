/* 
2)
The Superheroes Location:
- Find 'superheroes' whose 'latitude' and 'longitude' coordinates are BOTH less than '50'. 
-- {I'm assuming both values to be < 50 }
- Print their IDs in any order.
- Their locations are stored in the SUPERHERO table.
[ returns...
3
6
7 ]*/

-- Create table
CREATE TABLE SUPERHERO (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    LATITUDE FLOAT NOT NULL,
    LONGITUDE FLOAT NOT NULL
);

-- Insert sample data
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (1, 'Batman', 50.23, 85.45);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (2, 'Spiderman', 65.43, 65.66);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (3, 'Thor', 45.34, 30.89);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (4, 'Iron Man', 85.34, 80.98);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (5, 'Deadpool', 25.12, 69.21);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (6, 'Hulk', 30.34, 20.98);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (7, 'Doctor Strange', 40.45, 40.56);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (8, 'Captain America', 70.00, 75.32);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (9, 'Avengers', 81.32, 90.84);
INSERT INTO SUPERHERO (ID, NAME, LATITUDE, LONGITUDE) VALUES (10, 'Superman', 85.32, 45.78);

-- Verify table was created:
SELECT *
FROM Superhero;

-- Query to address the question at hand
SELECT id
FROM Superhero
WHERE latitude < 50
	AND longitude < 50;

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Filtering records using the WHERE clause.
- Applying multiple conditions using the AND operator.
- Returning specific columns from a table.

Key Takeaway:
The WHERE clause filters records based on specified conditions.
The AND operator ensures that all conditions must be true for a
record to be included in the results. This is useful when querying
databases for records that meet multiple criteria.
{RG}
*/
