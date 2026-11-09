
/* 
1)
Range of Marks Scored:
- Write a query to print the maximum and minimum marks of students.
- The result should be in the format: MAX_MARKS MIN_MARKS. 
- Note: marks = scores
[returns...
70 30]*/

-- Script to Create the DB
CREATE TABLE marks (
    ID VARCHAR(10) PRIMARY KEY,
    MARKS INTEGER NOT NULL
);

-- Script to insert sample data
INSERT INTO marks (ID, MARKS) VALUES ('abc123', 30);
INSERT INTO marks (ID, MARKS) VALUES ('def456', 70);
INSERT INTO marks (ID, MARKS) VALUES ('def123', 50);

-- SQL to verify table creation
SELECT *
FROM Marks;

-- Query to address the question at hand
SELECT MAX(marks), MIN(marks)
FROM Marks;

-- More polished version of the above
SELECT MAX(marks) As Max_Score, MIN(marks) AS Min_Score
FROM Marks;

/*
What This Exercise Demonstrates:
- Basic relational table creation.
- Data insertion.
- Data verification.
- Aggregate functions (MAX and MIN).
- Column aliases.

Key Takeaway:
SQL aggregate functions summarize numerical data without requiring
individual records to be retrieved and manually inspected. This is a
fundamental technique used in reporting, database queries, and data analysis.
{RG}
*/