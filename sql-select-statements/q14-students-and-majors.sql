/* 
14)
Student's Major
A university maintains data on students and their majors in three tables: STUDENTS, MAJORS, and REGISTER.
Write a query to display STUDENT_NAME and MAJOR_NAME. Sort the results by STUDENT_ID and return the first 20 records.
[Alex Biology
Chris Computer Science
Robin Physics]
*/

-- Create tables
CREATE TABLE STUDENTS (
    STUDENT_ID INTEGER PRIMARY KEY,
    STUDENT_NAME VARCHAR(100) NOT NULL,
    STUDENT_AGE INTEGER NOT NULL
);

CREATE TABLE MAJORS (
    MAJOR_ID INTEGER PRIMARY KEY,
    MAJOR_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE REGISTER (
    STUDENT_ID INTEGER,
    MAJOR_ID INTEGER,
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STUDENT_ID),
    FOREIGN KEY (MAJOR_ID) REFERENCES MAJORS(MAJOR_ID)
);

-- Insert STUDENTS
INSERT INTO STUDENTS (STUDENT_ID, STUDENT_NAME, STUDENT_AGE) VALUES (1, 'Alex', 20);
INSERT INTO STUDENTS (STUDENT_ID, STUDENT_NAME, STUDENT_AGE) VALUES (2, 'Chris', 21);
INSERT INTO STUDENTS (STUDENT_ID, STUDENT_NAME, STUDENT_AGE) VALUES (3, 'Robin', 21);

-- Insert MAJORS
INSERT INTO MAJORS (MAJOR_ID, MAJOR_NAME) VALUES (1000, 'Computer Science');
INSERT INTO MAJORS (MAJOR_ID, MAJOR_NAME) VALUES (2000, 'Biology');
INSERT INTO MAJORS (MAJOR_ID, MAJOR_NAME) VALUES (3000, 'Physics');

-- Insert REGISTER
INSERT INTO REGISTER (STUDENT_ID, MAJOR_ID) VALUES (2, 1000);
INSERT INTO REGISTER (STUDENT_ID, MAJOR_ID) VALUES (3, 3000);
INSERT INTO REGISTER (STUDENT_ID, MAJOR_ID) VALUES (1, 2000);


-- Verify table was created
SELECT *
FROM Majors;

SELECT *
FROM Students;

SELECT *
FROM Register;

-- Queries to address the question at hand
# Pending Practice

SELECT student_name, major_name
FROM Students S 
JOIN Register R ON S.student_id = R.student_id
JOIN Majors M ON R.major_id = M.major_id
ORDER BY S.student_id
LIMIT 20;

/*
What This Exercise Demonstrates:
- Creating related tables using primary and foreign keys.
- Inserting and verifying records across multiple tables.
- Joining three tables using matching key columns.
- Using table aliases to simplify SQL queries.
- Retrieving selected columns from related tables.
- Sorting results using ORDER BY.
- Limiting the number of returned records using LIMIT.

Key Takeaway:
SQL JOIN operations combine related information stored across
multiple tables. By following the relationships between primary
and foreign keys, queries can retrieve meaningful information
from a relational database without duplicating data across tables.

This exercise reinforces several important database concepts:
- Primary keys: Uniquely identify records in the STUDENTS and MAJORS tables.
- Foreign keys: Connect records across related tables.
- Table relationships: REGISTER acts as a link between students and their majors.
- Multiple JOINs: Allow you to retrieve information from three separate tables in one query.
- Aliases: Make queries easier to read and write.
- ORDER BY and LIMIT: Control the order and number of returned records.
{RG}
*/