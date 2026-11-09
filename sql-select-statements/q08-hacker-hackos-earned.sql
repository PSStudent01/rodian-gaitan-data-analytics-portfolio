
/* 
8)
Counting Hackos:
- Find all hackers who have earned more than 100 hackos in less than 10 months.
- Print the names in ascending order of their ID.
[Ernest Thomas
Joe Garza
Anne Harris]*/

-- Create table
CREATE TABLE HACKER (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    MONTHS INTEGER NOT NULL,
    HACKOS INTEGER NOT NULL
);

-- Insert sample data
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (1, 'Frances White', 5, 20);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (2, 'Carolyn Bradley', 2, 10);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (3, 'Annie Fernandez', 10, 5);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (4, 'Ruth Hanson', 5, 15);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (5, 'Paula Fuller', 6, 15);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (6, 'Bonnie Johnston', 8, 12);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (7, 'Ruth Gutierrez', 7, 10);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (8, 'Ernest Thomas', 4, 30);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (9, 'Joe Garza', 5, 25);
INSERT INTO HACKER (ID, NAME, MONTHS, HACKOS) VALUES (10, 'Anne Harris', 7, 15);

-- Verify table was created
SELECT *
FROM Hacker;

-- Queries to address the question at hand
-- a)
SELECT name
FROM Hacker
WHERE hackos > 100
	AND months < 10
ORDER BY id;

-- b) 
SELECT name
FROM Hacker
WHERE (hackos * months) > 100
	AND months < 10
ORDER BY id;

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Filtering records using multiple WHERE conditions.
- Performing arithmetic calculations within a SQL query.
- Multiplying numerical column values to calculate totals.
- Combining calculated values with conditional filtering.
- Sorting results by ID using ORDER BY.

Key Takeaway:
SQL allows arithmetic calculations to be performed directly
within a query. Calculated values can then be used in WHERE
conditions to filter records based on business rules. This is
useful for calculating totals, evaluating performance, and
identifying records that meet specific numerical thresholds.
{RG}
*/