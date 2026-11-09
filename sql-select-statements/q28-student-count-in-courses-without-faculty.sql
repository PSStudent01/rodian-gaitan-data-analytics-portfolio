/*
3C2: List # of students in courses without faculty.
Write queries that return the following resultsets:
Quite a few students have been complaining that the professors are absent from some of their courses.
Write a query to list the << Course Names and the Number of Students in those courses>> for << all courses where there are no 
assigned faculty>>.
<< The output should be sorted first by the Number of Students>> <<in descending order>>, <<then by Course Name in ascending order.>>
*/

-- Building on the previous excercise
SELECT C.name AS 'Course_Name'
FROM Course C
LEFT JOIN FacultyCourse FC ON C.id = FC.courseid
WHERE FC.facultyid IS NULL
ORDER BY C.name ASC;

SELECT *
FROM student;

SELECT CONCAT( firstname , ' ',  lastname) as 'student_name'
FROM student;

-- Attempt 1 to join by subquery failed:
SELECT CONCAT( firstname , ' ',  lastname) as 'student_name'
FROM Student S
WHERE S.id = ( SELECT C.name AS 'Course_Name'
FROM Course C
LEFT JOIN FacultyCourse FC ON C.id = FC.courseid
WHERE FC.facultyid IS NULL
ORDER BY C.name ASC);

-- AI answer:
SELECT C.name AS 'Course_Name', COUNT(SC.studentid) AS 'Number_Students' -- <--{adding COUNT(SC.studentid)}
FROM Course C
LEFT JOIN FacultyCourse FC ON C.id = FC.courseid
LEFT JOIN StudentCourse SC ON C.id = SC.courseid  -- <--{joining StudentCourse to the previous query }
WHERE FC.facultyid IS NULL
GROUP BY C.id, C.name  -- <--{grouping by 'C.name' and for best practice by 'C.id'}
ORDER BY COUNT(SC.studentid) DESC, C.name ASC;  -- <--{implementing sorting based on instructions}
/* VIP Observations:
- FacultyCourse can be joined to StudentCourse via Course
- While C.name is just a descriptive attribute, grouping by both is either required by SQL or considered good practice.*/

/*
What This Exercise Demonstrates:
- Joining multiple related tables using primary and foreign keys.
- Using LEFT JOIN to identify records with missing relationships.
- Filtering unmatched records using IS NULL.
- Connecting course records to student enrollment records.
- Counting related records using COUNT().
- Grouping results using GROUP BY.
- Sorting aggregate results using multiple ORDER BY criteria.

Key Takeaway:
Multiple LEFT JOIN operations can be used to examine different
relationships associated with the same primary table. By joining
Course to FacultyCourse and StudentCourse, SQL can identify courses
without assigned faculty while calculating their student enrollment
counts. COUNT() excludes NULL values, allowing courses with no
enrolled students to remain in the results with a count of zero.

This exercise combines two important SQL techniques:
- Anti-join logic: Find courses without faculty assignments.
- Aggregate logic: Count the students enrolled in those courses.

It builds naturally on 3C1 and demonstrates that you can combine 
missing-relationship detection with aggregation.
{RG}
*/


