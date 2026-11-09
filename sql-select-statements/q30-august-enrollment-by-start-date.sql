/*3E: lists Start Date and # of Students enrolled in August of each year
Write queries that return the following resultsets:
The enrollment team is gathering analytics about student enrollment and they now want to know about <<August admissions 
specifically>>.
Write a query that lists the << Start Date >> and << Total Number of Students >> who enrolled in classes in << August of each 
year >>.
The output should be << ordered first by Start Date in ascending order >> and then by << Total Number of Students in ascending 
order>>.*/

-- Queries to address the question at hand

SELECT * 
FROM StudentCourse;

SELECT studentId, startDate
FROM StudentCourse;

SELECT COUNT(studentId), startDate
FROM StudentCourse
GROUP BY startDate;
-- total number of students enrolled per startDate,

SELECT studentId, MONTH(startDate) AS 'Month_Enrolled'
FROM StudentCourse;

SELECT COUNT(studentId), MONTH(startDate) AS 'Month_Enrolled'
FROM StudentCourse
GROUP BY MONTH(startDate);

SELECT COUNT(studentId) AS 'Total Students Enrolled', MONTH(startDate) AS 'Month Enrolled'
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY MONTH(startDate);

SELECT COUNT(studentId) AS 'Total Students Enrolled', YEAR(startDate) AS 'Year Enrolled'
FROM StudentCourse
GROUP BY YEAR(startDate);

SELECT COUNT(studentId) AS 'Total Students Enrolled', YEAR(startDate) AS 'Year Enrolled'
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY YEAR(startDate);

SELECT COUNT(studentId) AS 'Total Students Enrolled', startDate
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY startDate
ORDER BY startDate ASC, COUNT(studentId) ASC;

SELECT COUNT(studentId) AS 'Students', startDate
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY startDate
ORDER BY startDate ASC, COUNT(studentId) ASC;

SELECT COUNT(studentId), startDate
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY startDate
ORDER BY startDate ASC, COUNT(studentId) ASC;

SELECT startDate, COUNT(studentId) AS 'Students'
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY startDate
ORDER BY startDate ASC, COUNT(studentId) ASC;
/* Works for AI, but HR complains */
/*Logic is 100% correct but fucking HR refuses to accept it*/

SELECT YEAR(startDate), COUNT(studentId) AS 'Students'
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY YEAR(startDate)
ORDER BY YEAR(startDate) ASC, COUNT(studentId) ASC;

SELECT YEAR(startDate) AS 'Year', COUNT(studentId) AS 'Students'
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY YEAR(startDate)
-- ORDER BY YEAR(startDate) ASC, COUNT(studentId) ASC;
ORDER BY 'Year' ASC, 'Students';
/*Logic is 100% correct but fucking HR refuses to accept it*/

SELECT YEAR(startDate) AS 'Year', COUNT(DISTINCT studentId) AS 'Students'
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY YEAR(startDate)
-- ORDER BY YEAR(startDate) ASC, COUNT(studentId) ASC;
ORDER BY 'Year' ASC, 'Students';
/*Uses DISTINCT, so output a bit different*/


SELECT startDate, COUNT(studentId) AS Students
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY startDate
ORDER BY startDate ASC, COUNT(studentId) ASC;
/*Logic is 100% correct but fucking HR refuses to accept it*/

SELECT startDate, COUNT(studentId) AS Students
FROM StudentCourse
WHERE MONTH(startDate) = 8
GROUP BY startDate
-- ORDER BY startDate ASC, COUNT(studentId) ASC;
ORDER BY startDate ASC, Students ASC;
/*Logic is 100% correct but fucking HR refuses to accept it*/

/*
What This Exercise Demonstrates:
- Filtering date records using the MONTH() function.
- Identifying August enrollment records across multiple years.
- Grouping records by their complete start date using GROUP BY.
- Counting unique students using COUNT(DISTINCT).
- Sorting results using multiple ORDER BY criteria.
- Using column aliases in ORDER BY.

Key Takeaway:
MONTH() extracts the month from a date, allowing SQL to filter
records for a particular month across multiple years. GROUP BY
organizes enrollment records by their complete start date, while
COUNT(DISTINCT) calculates the number of unique students in each
group. ORDER BY sorts the results by start date and student count.

It demonstrates date filtering, aggregation, grouping, distinct counting, and 
multi-column sorting.
{RG}
*/



