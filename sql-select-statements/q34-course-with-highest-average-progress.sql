/*3H2: Course with the highest Average Progress
Write queries that return the following resultsets:
Faculty are awarded bonuses based on the progress made by students in their courses.  
Write a query that shows the << Course Name and the Average Student Progress of the Course with the highest Average Progress >> in the 
system.  
The << Average Progress displayed should be rounded to one decimal place. >> */

-- Starting code from previous exercise:
SELECT C.name, ROUND(AVG(SC.progress), 1) AS avg_progress
FROM Course C
JOIN StudentCourse SC ON C.id = SC.courseid
-- GROUP BY C.name
GROUP BY C.id
ORDER BY ROUND(AVG(SC.progress), 1) DESC, C.name ASC;
/* Error Code: 1111. Invalid use of group function */

SELECT C.name, MAX(ROUND(AVG(SC.progress), 1)) AS avg_progress
FROM Course C
JOIN StudentCourse SC ON C.id = SC.courseid
-- GROUP BY C.name
GROUP BY C.id
ORDER BY ROUND(AVG(SC.progress), 1) DESC, C.name ASC;

SELECT C.name, ROUND(AVG(SC.progress), 1) AS avg_progress
FROM Course C
JOIN StudentCourse SC ON C.id = SC.courseid
-- GROUP BY C.name
GROUP BY C.id
ORDER BY ROUND(AVG(SC.progress), 1) DESC, C.name ASC
LIMIT 1;
/*It passed per HR and AI*/


/*
What This Exercise Demonstrates:
- Joining Course and StudentCourse using primary and foreign keys.
- Calculating average progress using AVG().
- Grouping enrollment records by course.
- Rounding calculated averages using ROUND().
- Sorting aggregate results using ORDER BY.
- Using LIMIT to restrict the number of returned records.
- Identifying the highest aggregate value without nesting aggregate functions.

Key Takeaway:
After calculating average progress for each course using AVG()
and GROUP BY, ORDER BY sorts the results from highest to lowest.
LIMIT 1 returns only the course with the highest average progress.
This avoids the need to nest aggregate functions such as MAX()
and AVG() within the same query level.

The last two exercises demonstrate complementary reporting skills:
- Q10: Calculate and report averages for every course.
- Q11: Identify the top-performing course based on those averages.
{RG}
*/
