/*
3)
3B: Lists course and number of students in that course
Write queries that return the following results:
The recruiting department needs to know <which courses are most popular with the students>. 
Please provide them with a query which lists the <name of each course> and the <number of students in that course>.
The output should be <sorted by the Number of Students in descending order>, then <by Course Name in ascending order>.

College Management System Schema
Scoring
All queries must run in HackerRank.
All queries must produce the exact expected output.
You must pass all test cases in the question to receive full credit.
You must submit your queries by clicking the Submit button to ensure that your answer is saved.
*/

-- Queries to address the question at hand
# 1)
SELECT *
FROM Student S
JOIN Department D ON S.majorid = D.id
JOIN Course C ON D.id = C.deptid;

# 2)
SELECT S.id AS 'Student_ID', C.id AS 'Course_ID'
FROM Student S
JOIN Department D ON S.majorid = D.id
JOIN Course C ON D.id = C.deptid;

# 3)
SELECT S.id AS 'Student_ID', COUNT(C.id) AS 'Course_ID'
FROM Student S
JOIN Department D ON S.majorid = D.id
JOIN Course C ON D.id = C.deptid
GROUP BY S.id;

# 4)
-- SELECT S.id AS 'Student_ID', COUNT(C.id) AS 'Course_ID'
SELECT C.id AS 'Course_ID', COUNT(S.id) AS 'Student_ID'
FROM Student S
JOIN Department D ON S.majorid = D.id
JOIN Course C ON D.id = C.deptid
GROUP BY C.id
ORDER BY COUNT(S.id) DESC;

# 5)
SELECT C.id AS 'Course_ID', C.name AS 'Course_Name', COUNT(S.id) AS 'Student_ID'
FROM Student S
JOIN Department D ON S.majorid = D.id
JOIN Course C ON D.id = C.deptid
GROUP BY C.id, C.name
ORDER BY COUNT(S.id) DESC;

# 6)
SELECT C.name AS 'Course_Name', MAX(COUNT(S.id)) AS 'Student_ID'
FROM Student S
JOIN Department D ON S.majorid = D.id
JOIN Course C ON D.id = C.deptid
GROUP BY C.id, C.name
HAVING MAX(COUNT(S.id))
ORDER BY COUNT(S.id) DESC;


# 7)
SELECT C.name AS 'Course_Name', COUNT(S.id) AS 'Number_Students'
FROM Student S
JOIN Department D ON S.majorid = D.id
JOIN Course C ON D.id = C.deptid
GROUP BY C.id, C.name
ORDER BY COUNT(S.id) DESC, C.name ASC ;
/* there's a logic issue This counts how many students have a given department as their major, then attributes that count 
to any course offered by that department — not how many students are actually enrolled in each specific course. 
Q:
wtf is the difference between 'students in the department' and 'students enrolled in each course.'?
A:
- "Students in a department" = students whose major is that department. This is a property of the student — one value, set once 
(student.majorid), representing which department they belong to overall.
- "Students enrolled in a course" = students who are actually taking that specific course this term/semester. This is captured in a 
completely separate table, studentCourse, because one student can take many courses, and those courses don't have to be in their 
major's department.
Q:
- so what I did answered more like what major is most popular?
A:
- Yes, basically — though not quite that exactly either, so let's pin down precisely what your original query did measure.*/

-- ////////////////////////////////// SECOND APPROACH ATTEMPT //////////////////////////
SELECT *
FROM studentcourse;

SELECT firstname, lastname, C.name AS 'Course_Name'
FROM Student S
JOIN StudentCourse SC ON S.id = SC.studentid
JOIN Course C ON SC.courseid = C.id;

SELECT C.name AS 'Course_Name', COUNT(S.id) AS 'Student_ID' 
FROM Student S
JOIN StudentCourse SC ON S.id = SC.studentid
JOIN Course C ON SC.courseid = C.id
GROUP BY C.name
ORDER BY COUNT(S.id) DESC, C.name ASC;
-- Yes, this is correct — nice work fixing it. Let's walk through why it works now.

/*
What This Exercise Demonstrates:
- Joining multiple related tables using primary and foreign keys.
- Understanding many-to-many relationships between students and courses.
- Using an intermediate enrollment table to connect students to courses.
- Counting enrollment records with COUNT().
- Grouping results by course using GROUP BY.
- Applying multiple sorting criteria with ORDER BY.
- Sorting aggregate results in descending order and course names in ascending order.

Key Takeaway:
A student's major identifies their academic department, but it does
not identify the specific courses they are enrolled in. The
StudentCourse table establishes that relationship. Joining the
enrollment table to Student and Course allows SQL to calculate
the actual number of students registered for each course.

This exercise teaches something more important than just another aggregate 
query: understanding relationships between database tables.
{RG}
*/


