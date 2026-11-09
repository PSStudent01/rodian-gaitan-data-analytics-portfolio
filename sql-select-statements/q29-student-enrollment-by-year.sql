/*
3D: Lists total # of students enrolled each year.
Write queries that return the following resultsets:
The enrollment team is gathering analytics about student enrollment throughout the years.
Write a query that lists the << Total Number of Students >>  that were << enrolled in classes during each School Year >>.
<< The first column should have the header "Students" >> .
Provide << a second column showing the enrollment year with the header "Year">>.
The output should be << sorted first by the School Year in ascending order >>, then by <<Total Number of Students in descending order>>.
*/

-- Queries to address the question at hand

SELECT *
FROM studentCourse;

SELECT courseid, COUNT(studentId)
FROM studentCourse
GROUP BY courseid;

SELECT studentId, COUNT(YEAR(startDate))
FROM studentCourse
GROUP BY studentId;

SELECT courseid, COUNT(studentId) AS 'Students'
FROM studentCourse
GROUP BY courseid;

SELECT courseid, COUNT(studentId) AS 'Students'
FROM studentCourse
GROUP BY courseid;
/*You're grouping by the wrong column. The exercise is asking 'How many students enrolled in each year?'*/

/* AI Answer */
SELECT COUNT(studentId) AS 'Students', YEAR(startDate) AS 'Year'
FROM studentCourse
GROUP BY YEAR(startDate)
ORDER BY YEAR(startDate) ASC, COUNT(studentId) DESC;
/*HR did not like answer*/

/* AI Answer 2*/
SELECT COUNT(DISTINCT studentId) AS 'Students', YEAR(startDate) AS 'Year'
FROM studentCourse
GROUP BY YEAR(startDate)
ORDER BY YEAR(startDate) ASC, COUNT(studentId) DESC;
/*HR liked answer*/

/*
What This Exercise Demonstrates:
- Inspecting enrollment records in a relational table.
- Extracting the year from a DATE column using YEAR().
- Grouping records by year using GROUP BY.
- Counting unique students using COUNT(DISTINCT).
- Assigning column aliases for report output.
- Applying multiple sorting criteria using ORDER BY.

Key Takeaway:
COUNT(DISTINCT column) counts unique values rather than every
occurrence of a value. This is important when a student can have
multiple enrollment records during the same year. Combining
YEAR(), GROUP BY, and COUNT(DISTINCT) allows SQL to produce
yearly enrollment summaries without double-counting students.

The most important concept here is the difference between counting 
records and counting unique individuals.
{RG}
*/

