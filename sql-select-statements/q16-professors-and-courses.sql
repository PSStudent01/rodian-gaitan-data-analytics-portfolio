/* 
16)
List the Course Names
Write a query to return a list of professor names and the courses they teach or have taught. The results can be in any order but must not contain duplicate rows.
Schema — four tables: PROFESSOR, DEPARTMENT, COURSE, SCHEDULE
[Tyler Matthews Clinical Biochemistry
Tyler Matthews Clinical Neuroscience
Drew Hicks Clinical Biochemistry
Morgan Lee Clinical Biochemistry
Morgan Lee Clinical Neuroscience
Morgan Lee Earth Science
Riley Peterson Earth Science
Riley Peterson Geography
Riley Peterson Materials Science and Metallurgy
Riley Peterson Pure Mathematics and Mathematical Statistics]
*/

-- Create tables
CREATE TABLE DEPARTMENT (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL
);

CREATE TABLE PROFESSOR (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    DEPARTMENT_ID INTEGER NOT NULL,
    SALARY INTEGER NOT NULL,
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(ID)
);

CREATE TABLE COURSE (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(150) NOT NULL,
    DEPARTMENT_ID INTEGER NOT NULL,
    CREDITS INTEGER NOT NULL,
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT(ID)
);

CREATE TABLE SCHEDULE (
    PROFESSOR_ID INTEGER NOT NULL,
    COURSE_ID INTEGER NOT NULL,
    SEMESTER INTEGER NOT NULL,
    YEAR INTEGER NOT NULL,
    FOREIGN KEY (PROFESSOR_ID) REFERENCES PROFESSOR(ID),
    FOREIGN KEY (COURSE_ID) REFERENCES COURSE(ID)
);

-- Insert DEPARTMENT
INSERT INTO DEPARTMENT (ID, NAME) VALUES (3, 'Biological Sciences');
INSERT INTO DEPARTMENT (ID, NAME) VALUES (5, 'Technology');
INSERT INTO DEPARTMENT (ID, NAME) VALUES (6, 'Humanities & Social Sciences');
INSERT INTO DEPARTMENT (ID, NAME) VALUES (2, 'Clinical Medicine');
INSERT INTO DEPARTMENT (ID, NAME) VALUES (4, 'Arts and Humanities');
INSERT INTO DEPARTMENT (ID, NAME) VALUES (1, 'Physical Sciences');

-- Insert PROFESSOR
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (1, 'Alex Burton', 5, 7340);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (8, 'Jordan Diaz', 1, 17221);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (9, 'Drew Hicks', 5, 16613);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (2, 'Tyler Matthews', 2, 14521);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (10, 'Blake Foster', 4, 28526);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (3, 'Spencer Peters', 1, 10487);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (4, 'Ellis Marshall', 3, 6353);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (7, 'Morgan Lee', 2, 25796);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (5, 'Riley Peterson', 1, 35678);
INSERT INTO PROFESSOR (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (6, 'Peyton Fields', 5, 26648);

-- Insert COURSE
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (9, 'Clinical Biochemistry', 2, 3);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (4, 'Astronomy', 1, 6);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (10, 'Clinical Neuroscience', 2, 5);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (1, 'Pure Mathematics and Mathematical Statistics', 1, 3);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (6, 'Geography', 1, 7);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (8, 'Chemistry', 1, 1);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (5, 'Physics', 1, 8);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (3, 'Earth Science', 1, 7);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (7, 'Materials Science and Metallurgy', 1, 5);
INSERT INTO COURSE (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (2, 'Applied Mathematics and Theoretical Physics', 1, 5);

-- Insert SCHEDULE
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (5, 3, 6, 2012);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (7, 3, 1, 2013);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (5, 7, 6, 2010);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (2, 10, 2, 2004);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (5, 1, 1, 2011);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (2, 9, 4, 2005);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (7, 10, 6, 2009);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (5, 6, 4, 2007);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (7, 9, 1, 2014);
INSERT INTO SCHEDULE (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (9, 9, 5, 2011);

-- Verify table was created
SELECT *
FROM Department;

SELECT *
FROM Professor;

SELECT *
FROM Course;

SELECT *
FROM Schedule;

-- Queries to address the question at hand
# Pending Practice
SELECT DISTINCT p.name, c.name
FROM Professor p 
JOIN Schedule s ON p.id = s.professor_id
JOIN Course c ON s.course_id = c.id
ORDER BY p.name;

/*
What This Exercise Demonstrates:
- Creating related tables using primary and foreign keys.
- Inserting and verifying records across multiple tables.
- Joining three tables to retrieve related information.
- Using table aliases to simplify SQL queries.
- Selecting specific columns from joined tables.
- Eliminating duplicate rows using DISTINCT.
- Sorting results using ORDER BY.

Key Takeaway:
SQL JOIN operations retrieve related information from multiple
tables. DISTINCT eliminates duplicate combinations from the
result set, which is especially useful when the same relationship
appears in multiple records, such as a professor teaching the
same course across different semesters or years.

This exercise reinforces:
- Multiple JOINs: Connecting information across three related tables.
- Primary and foreign keys: Understanding how database relationships connect records.
- DISTINCT: Removing duplicate combinations from query results.
- Table aliases: Making queries easier to read.
- ORDER BY: Organizing results alphabetically.
{RG}
*/