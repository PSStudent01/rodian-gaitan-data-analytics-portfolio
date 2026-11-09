/* 
15)
Trip Query:
- Write a query to print the maximum number of discounted tours any single family in the FAMILIES table can choose from.
[returns...3]
*/

-- Create tables
CREATE TABLE FAMILIES (
    ID VARCHAR(36) PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    FAMILY_SIZE INTEGER NOT NULL
);

CREATE TABLE COUNTRIES (
    ID VARCHAR(36) PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    MIN_SIZE INTEGER NOT NULL
);

-- Insert FAMILIES
INSERT INTO FAMILIES (ID, NAME, FAMILY_SIZE) VALUES ('c00dac11bde74750b4d207b9c182a85f', 'Alex Thomas', 9);
INSERT INTO FAMILIES (ID, NAME, FAMILY_SIZE) VALUES ('eb6f2d34266946667ae3e79d6274114a4', 'Chris Gray', 2);

-- Insert COUNTRIES
INSERT INTO COUNTRIES (ID, NAME, MIN_SIZE) VALUES ('023fd23615bd4ff4b2ae0a13ed7efec9', 'Bolivia', 2);
INSERT INTO COUNTRIES (ID, NAME, MIN_SIZE) VALUES ('be247f73de0f4b2d810367cb26941fb9', 'Cook Islands', 4);
INSERT INTO COUNTRIES (ID, NAME, MIN_SIZE) VALUES ('3e85ab80a6f84ef3b9068b21dbcc54b3', 'Brazil', 4);


-- Verify table was created
SELECT *
FROM Families;

SELECT *
FROM Countries;

-- Queries to address the question at hand
# Pending Practice
SELECT MAX(tour_count) AS Tours
FROM (
    SELECT 
        F.ID,
        F.NAME,
        COUNT(C.ID) AS tour_count
    FROM FAMILIES F
    JOIN COUNTRIES C 
        ON F.FAMILY_SIZE >= C.MIN_SIZE
    GROUP BY F.ID, F.NAME
) AS family_tours;

/*
What This Exercise Demonstrates:
- Creating and working with related database tables.
- Joining tables using a conditional comparison.
- Using table aliases to simplify queries.
- Counting matching records with COUNT().
- Grouping records using GROUP BY.
- Using a subquery to create an intermediate result.
- Applying MAX() to find the highest calculated value.

Key Takeaway:
SQL can perform calculations at multiple levels. A subquery
can first calculate a value for each group, such as the number
of eligible tours per family. An outer query can then apply
an aggregate function like MAX() to identify the highest
value across those groups.

This exercise reinforces several useful SQL skills:
- Conditional JOIN: Matches records based on a comparison rather than simply checking whether two IDs are equal.
- COUNT(): Counts qualifying records.
- GROUP BY: Calculates a separate count for each family.
- Subqueries: Allow one query to use the results produced by another.
- MAX(): Finds the highest value from a set of calculated results.
{RG}
*/