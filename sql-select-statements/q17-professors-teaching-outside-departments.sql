/* 
17)
Scheduling Errors:
- Find all professors who teach courses outside of their departments. Return a list with professor names and their associated courses. No duplicate rows should appear in the results.
- The output should contain two columns: professor.name, course.name.
- Schema — four tables: PROFESSOR, DEPARTMENT, COURSE, SCHEDULE
[Tyler Rodriguez Astronomy
Jordan Myers Earth Sciences
Alex Daniels Materials Science and Metallurgy <---{dup mistake by hackerrank confirmed}
Ellis Vasquez Materials Science and Metallurgy
Tyler Rodriguez Geography
Riley Gilbert Earth Sciences
Peyton Stevens Applied Mathematics and Theoretical Physics
Alex Daniels Pure Mathematics and Mathematical Statistics
Alex Daniels Applied Mathematics and Theoretical Physics
Alex Daniels Materials Science and Metallurgy <---{dup mistake by hackerrank confirmed}]
*/

-- Create tables
CREATE TABLE DEPARTMENT_II (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL
);

CREATE TABLE PROFESSOR_II (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    DEPARTMENT_ID INTEGER NOT NULL,
    SALARY INTEGER NOT NULL,
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT_II(ID)
);

CREATE TABLE COURSE_II (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(150) NOT NULL,
    DEPARTMENT_ID INTEGER NOT NULL,
    CREDITS INTEGER NOT NULL,
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENT_II(ID)
);

CREATE TABLE SCHEDULE_II (
    PROFESSOR_ID INTEGER NOT NULL,
    COURSE_ID INTEGER NOT NULL,
    SEMESTER INTEGER NOT NULL,
    YEAR INTEGER NOT NULL,
    FOREIGN KEY (PROFESSOR_ID) REFERENCES PROFESSOR_II(ID),
    FOREIGN KEY (COURSE_ID) REFERENCES COURSE_II(ID)
);

-- Insert DEPARTMENT_II
INSERT INTO DEPARTMENT_II (ID, NAME) VALUES (3, 'Biological Sciences');
INSERT INTO DEPARTMENT_II (ID, NAME) VALUES (5, 'Technology');
INSERT INTO DEPARTMENT_II (ID, NAME) VALUES (6, 'Humanities & Social Sciences');
INSERT INTO DEPARTMENT_II (ID, NAME) VALUES (2, 'Clinical Medicine');
INSERT INTO DEPARTMENT_II (ID, NAME) VALUES (4, 'Arts and Humanities');
INSERT INTO DEPARTMENT_II (ID, NAME) VALUES (1, 'Physical Sciences');

-- Insert PROFESSOR_II
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (1, 'Alex Daniels', 4, 7169);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (2, 'Drew Knight', 1, 9793);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (3, 'Jordan Myers', 4, 25194);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (4, 'Tyler Rodriguez', 3, 9686);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (5, 'Blake Gome', 2, 30860);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (6, 'Spencer George', 5, 10487);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (7, 'Ellis Vasquez', 4, 6353);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (8, 'Morgan Flores', 1, 25796);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (9, 'Riley Gilbert', 5, 35678);
INSERT INTO PROFESSOR_II (ID, NAME, DEPARTMENT_ID, SALARY) VALUES (10, 'Peyton Stevens', 2, 26648);

-- Insert COURSE_II
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (9, 'Clinical Biochemistry', 2, 3);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (4, 'Astronomy', 1, 6);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (10, 'Clinical Neuroscience', 2, 5);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (1, 'Pure Mathematics and Mathematical Statistics', 1, 3);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (6, 'Geography', 1, 7);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (8, 'Chemistry', 1, 1);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (5, 'Physics', 1, 8);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (3, 'Earth Science', 1, 7);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (7, 'Materials Science and Metallurgy', 1, 5);
INSERT INTO COURSE_II (ID, NAME, DEPARTMENT_ID, CREDITS) VALUES (2, 'Applied Mathematics and Theoretical Physics', 1, 5);

-- Insert SCHEDULE_II
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (4, 4, 3, 2003);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (3, 3, 1, 2011);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (1, 7, 5, 2011);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (7, 7, 1, 2010);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (4, 6, 1, 2001);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (9, 3, 1, 2012);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (10, 2, 4, 2009);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (1, 1, 3, 2014);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (1, 2, 3, 2008);
INSERT INTO SCHEDULE_II (PROFESSOR_ID, COURSE_ID, SEMESTER, YEAR) VALUES (1, 7, 5, 2007);

-- Verify table was created
SELECT *
FROM DEPARTMENT_II;

SELECT *
FROM PROFESSOR_II;

SELECT *
FROM COURSE_II ;

SELECT *
FROM SCHEDULE_II;

-- Queries to address the question at hand
# Pending Practice
SELECT DISTINCT p.name, c.name
FROM Professor_II p 
JOIN Schedule_II s ON  p.id = s.professor_id
JOIN Course_II c ON c.id = s.course_id
WHERE p.department_id != c.department_id;

-- //////////////////////////////////////////////////
DROP TABLE DEPARTMENT_II;

DROP TABLE PROFESSOR_II;

DROP TABLE COURSE_II ;

DROP TABLE SCHEDULE_II;

/*
What This Exercise Demonstrates:
- Creating related tables using primary and foreign keys.
- Joining multiple tables to retrieve related information.
- Using table aliases to simplify SQL queries.
- Comparing columns across joined tables.
- Filtering records using the not-equal (!=) operator.
- Identifying mismatched relationships between records.
- Eliminating duplicate results using DISTINCT.

Key Takeaway:
SQL can be used to identify inconsistencies between related
database records. By joining tables and comparing their values,
a query can identify relationships that do not meet expected
conditions, such as professors teaching courses outside their
assigned departments. DISTINCT ensures that duplicate
professor/course combinations appear only once.

This exercise reinforces:
- Multiple JOINs: Connecting professors, schedules, and courses.
- Column comparisons: Comparing department IDs from two different tables.
- WHERE with !=: Filtering records where two values don't match.
- DISTINCT: Preventing duplicate combinations in query results.
{RG}
*/