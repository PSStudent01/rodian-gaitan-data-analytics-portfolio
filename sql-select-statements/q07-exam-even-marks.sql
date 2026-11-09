/* 
7)
Examination Data:
- There is a database with exam scores. 
- Write a query to print the names of the students who scored an even number of marks. 
- The names should be listed in uppercase, alphabetically ascending. 
- The result should be in the following format: NAME MARKS
[JULIA 10
SAMANTHA 6]
*/

-- Create table
CREATE TABLE exam (
    NAME VARCHAR(100) PRIMARY KEY,
    MARKS INTEGER NOT NULL
);

-- Insert sample data
INSERT INTO exam (NAME, MARKS) VALUES ('Julia', 10);
INSERT INTO exam (NAME, MARKS) VALUES ('Samantha', 6);
INSERT INTO exam (NAME, MARKS) VALUES ('Jack', 15);

-- Verify table was created
SELECT * 
FROM Exam;

-- Queries to address the question at hand
-- a)
SELECT name, marks
FROM Exam
WHERE marks % 2 = 0;

-- b)
SELECT UPPER(name), marks
FROM Exam
WHERE marks % 2 = 0
ORDER BY name ASC;

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Filtering records using the WHERE clause.
- Using the modulo operator (%) to identify even numbers.
- Formatting text using the UPPER() string function.
- Sorting results alphabetically using ORDER BY.
- Using column aliases to label query results.

Key Takeaway:
SQL supports arithmetic and string functions that can be combined
with conditional filtering and sorting. The modulo operator (%)
can identify even-numbered values, while UPPER() standardizes text
formatting. These techniques are useful for filtering numerical
data and producing consistently formatted reports.
{RG}
*/

