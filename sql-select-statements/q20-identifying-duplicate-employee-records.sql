/* 
20)
Clumsy Administrator:
- Your company maintains employee records in a database. Due to some administrative issues, employee records have been inserted multiple times into the employee table. A record is considered a duplicate only when all columns (fields) of that record are exactly the same.
- Write a query to find the names of employees whose complete records appear more than once in the table. Each name should appear only once in your results. The order of results does not matter.
[returns
Chris
Sam]
*/

-- Create table
CREATE TABLE EMPLOYEE (
    NAME VARCHAR(100),
    PHONE VARCHAR(20),
    AGE INTEGER
);

-- Insert sample data
INSERT INTO EMPLOYEE (NAME, PHONE, AGE) VALUES ('Sam', '1000040000', 30);
INSERT INTO EMPLOYEE (NAME, PHONE, AGE) VALUES ('Alex', '1000020000', 60);
INSERT INTO EMPLOYEE (NAME, PHONE, AGE) VALUES ('Alex', '1000020012', 65);
INSERT INTO EMPLOYEE (NAME, PHONE, AGE) VALUES ('Sam', '1000040000', 30);
INSERT INTO EMPLOYEE (NAME, PHONE, AGE) VALUES ('Chris', '1000012000', 34);
INSERT INTO EMPLOYEE (NAME, PHONE, AGE) VALUES ('Chris', '1000012000', 34);

-- Verify table was created
SELECT *
FROM Employee;

-- Queries to address the question at hand
# Pending Practice
SELECT DISTINCT name
FROM Employee
GROUP BY name, phone, age
HAVING COUNT(*) > 1;

/*
What This Exercise Demonstrates:
- Creating and populating a database table.
- Grouping records using multiple columns.
- Identifying duplicate records using GROUP BY.
- Counting occurrences using COUNT(*).
- Filtering grouped results using HAVING.
- Eliminating duplicate names using DISTINCT.

Key Takeaway:
Duplicate records can be identified by grouping records
across all relevant columns and using COUNT(*) to determine
which combinations appear more than once. HAVING filters
those duplicate groups, while DISTINCT ensures that each
employee name appears only once in the final results.

This exercise reinforces:
- GROUP BY multiple columns: Identifies records where every specified field matches.
- COUNT(*): Counts how many times each complete record occurs.
- HAVING: Filters groups based on their occurrence count.
- DISTINCT: Prevents duplicate employee names in the final output.
{RG}
*/