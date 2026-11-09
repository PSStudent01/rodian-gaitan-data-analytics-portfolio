/*
3H3: List faculty name and the average progress of their all their courses.
Write queries that return the following resultsets:
Faculty are awarded bonuses based on the progress made by students in their courses.
Write a query that outputs the << faculty First Name, Last Name, and the Average Progress made over all of their courses >>.  
The << Average Progress displayed should be rounded to one decimal place >>.  
The output should be << sorted by Average Progress in descending order >>, then by << First Name in ascending order >>, 
then by << Last Name in ascending order >>.
*/

-- Faculty
-- FacultyCourse
-- Course
-- studentCourse

-- Working off of one of previous exmaples:
SELECT C.name, ROUND(AVG(SC.progress), 1) AS avg_progress
FROM Course C
JOIN StudentCourse SC ON C.id = SC.courseid
-- GROUP BY C.name
GROUP BY C.id
ORDER BY ROUND(AVG(SC.progress), 1) DESC, C.name ASC;

SELECT F.firstname, F.lastname, ROUND(AVG(SC.progress), 1) AS avg_progress
FROM Faculty F
JOIN FacultyCourse FC ON F.id = FC.facultyid
JOIN Course C ON FC.courseid = C.id
JOIN StudentCourse SC ON C.id = SC.courseid
GROUP BY F.id
ORDER BY ROUND(AVG(SC.progress), 1) DESC,  F.firstname ASC, F.lastname ASC;
/*It passed per HR and AI*/

/*
What This Exercise Demonstrates:
- Joining multiple related tables using primary and foreign keys.
- Understanding faculty-to-course relationships.
- Connecting courses to student enrollment records.
- Calculating average progress using AVG().
- Grouping aggregate results by individual faculty member.
- Rounding calculated averages using ROUND().
- Sorting results using multiple ORDER BY criteria.
- Using column aliases for calculated values.

Key Takeaway:
Joining Faculty, FacultyCourse, Course, and StudentCourse connects
faculty members to the progress records of students enrolled in
their courses. AVG() calculates the average progress across those
enrollment records, while GROUP BY produces a separate result for
each faculty member. ROUND() controls decimal precision, and
ORDER BY sorts faculty members by average student progress.

This exercise demonstrates something useful for ERP and Application Support 
reporting: tracing relationships across several database tables to produce a 
meaningful business metric.
Your progression is also worth recognizing:
- 3H1: Average progress by course.
- 3H2: Identify the course with the highest average progress.
- 3H3: Average progress across all courses assigned to each faculty member.
{RG}
*/