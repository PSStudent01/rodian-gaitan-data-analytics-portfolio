
/* 
9)
Scoring System:
- Write a query to print the ID and NAME of each of the three highest scoring students.
- Print the records in descending order by SCORE. For matching scores, sort by ID in ascending order.
[6 Sid
7 Tom
4 Dick] */

-- Create table
CREATE TABLE STUDENT (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    SCORE FLOAT NOT NULL
);

-- Insert sample data
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (1, 'Bob', 50);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (2, 'John', 65.5);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (3, 'Harry', 45);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (4, 'Dick', 85);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (5, 'Dev', 25);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (6, 'Sid', 98);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (7, 'Tom', 90);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (8, 'Julia', 70.5);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (9, 'Erica', 81);
INSERT INTO STUDENT (ID, NAME, SCORE) VALUES (10, 'Jerry', 85);

-- Verify table was created
SELECT * 
FROM Student;

-- Queries to address the question at hand
-- a) displaying score here to verify sorting
SELECT id, name, score
FROM Student
ORDER BY score DESC
LIMIT 3;

-- b) for matching scores, sort by ID in ascending order. 
SELECT id, name
FROM Student
ORDER BY score DESC, id ASC
LIMIT 3;

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Sorting numerical values using ORDER BY DESC.
- Applying secondary sorting using ORDER BY ASC.
- Limiting query results using LIMIT.
- Retrieving the top records based on ranking criteria.

Key Takeaway:
SQL can rank records using ORDER BY and restrict the number
of returned records using LIMIT. Multiple sorting criteria
can be combined to establish consistent rankings when values
are tied. This is useful for performance reporting, rankings,
leaderboards, and identifying top-performing records.
{RG}
*/