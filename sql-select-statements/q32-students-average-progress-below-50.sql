/*3G: 
List Name and Average of students with less than 50%
Write queries that return the following resultsets:
Students making average progress in their courses of less than 50% need to be offered tutoring assistance.
<< Write a query to list First Name, Last Name, and Average Progress of all students achieving average progress of less than 50%. >>
<< The Average Progress displayed should be rounded to one decimal place. >>
<< The output should be sorted first by Average Progress in descending order >>, then by << First Name in ascending order >>, 
then by << the Last Name in ascending order. >>*/


SELECT firstname, lastname, AVG(progress) AS 'Avg Progress'
FROM Student S
JOIN StudentCourse SC ON S.id = SC.studentid
GROUP BY firstname, lastname
HAVING AVG(progress) < 50;

SELECT firstname, lastname, ROUND(AVG(progress)) AS 'Avg Progress'
FROM Student S
JOIN StudentCourse SC ON S.id = SC.studentid
GROUP BY firstname, lastname
HAVING AVG(progress) < 50
ORDER BY ROUND(AVG(progress)) DESC, firstname ASC;
/* My logic is good, but needs few touches */

SELECT firstname, lastname, ROUND(AVG(progress), 1) AS Avg_Progress -- <---{ adding missing decimal precision}
FROM Student S
JOIN StudentCourse SC ON S.id = SC.studentid
GROUP BY firstname, lastname, S.id -- <--{you should Group By unique identifiers, rather than non-unique identifiers, itc 'S.id'}
HAVING AVG(progress) < 50
ORDER BY ROUND(AVG(progress), 1) DESC, firstname ASC, lastname ASC; -- <---{ adding missing 3rd tie-breaker req}
/*GROUP BY on non-unique columns: Grouping solely by firstname, lastname can combine data for two different students who 
happen to share the same name. Always include the primary key (S.id) in the GROUP BY clause. The order of columns in the GROUP BY
clause does not matter for the output of your query.*/
/* Per AI and HR, it passes */

/*
What This Exercise Demonstrates:
- Joining Student and StudentCourse using primary and foreign keys.
- Calculating average values using AVG().
- Grouping records by individual student using GROUP BY.
- Filtering aggregated results using HAVING.
- Rounding numerical results using ROUND().
- Specifying decimal precision in calculated values.
- Sorting results using multiple ORDER BY criteria.

Key Takeaway:
AVG() calculates the average progress across a student's course
enrollment records. GROUP BY separates the calculations by student,
while HAVING filters students based on their calculated averages.
ROUND(AVG(), 1) displays the result to one decimal place.
ORDER BY sorts the qualifying students by average progress,
first name, and last name.

That translates well to practical work such as:
- Identifying customers with overdue balances.
- Flagging transactions outside expected thresholds.
- Identifying accounts requiring follow-up.
- Summarizing performance metrics by customer, department, or account.
{RG}
*/
