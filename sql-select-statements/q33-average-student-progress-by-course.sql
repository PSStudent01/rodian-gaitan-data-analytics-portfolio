/*3H1: list Course Name and Students Average  
Write queries that return the following resultsets:  
Faculty are awarded bonuses based on the progress made by students in their courses.  
Write a query to << list each 'Course Name' and the 'Average Progress' of 'students' in that 'course' >>.  
The << Average Progress displayed should be rounded to one decimal place. >>  
The output should be << sorted first by Average Progress in descending order >>, then by << Course Name in ascending order. >>*/

SELECT C.name, ROUND(AVG(SC.progress), 1) AS avg_progress
FROM Course C
JOIN StudentCourse SC ON C.id = SC.courseid
-- GROUP BY C.name
GROUP BY C.id
ORDER BY ROUND(AVG(SC.progress), 1) DESC, C.name ASC;
/*Per AI and HR, this query passes.*/

/*
What This Exercise Demonstrates:
- Joining Course and StudentCourse using primary and foreign keys.
- Calculating average progress using AVG().
- Grouping enrollment records by course.
- Rounding calculated averages using ROUND().
- Specifying decimal precision in aggregate results.
- Sorting aggregate results using multiple ORDER BY criteria.
- Using column aliases to improve output readability.

Key Takeaway:
Joining Course to StudentCourse connects each course to its
enrollment records. AVG() calculates the average student progress
for each course, while GROUP BY separates the calculations by
course. ROUND() controls the displayed decimal precision, and
ORDER BY sorts courses by average progress and course name.
{RG}
*/