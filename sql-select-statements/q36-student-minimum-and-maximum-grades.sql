/*3I: Min & Max Grades
Write queries that return the following resultsets:
Students are awarded << two grades based on the minimum and maximum progress they are making in their courses.>> The grading scale 
is as follows:
    Progress < 40: F
    Progress < 50: D
    Progress < 60: C
    Progress < 70: B
    Progress >= 70: A
Write a query that displays << each student's First Name, Last Name, Minimum Grade based on their minimum progress, and Maximum Grade 
based on their maximum progress.>>
The output should be << sorted by Minimum Grade in descending order >>, then by << Maximum Grade in descending order >>, then by 
<< First Name in ascending order >>, then by << Last Name in ascending order >> 
[IOWs:
"For every student, look at all the courses they are taking:
    Find their lowest 'progress score' across those courses, and convert that single number into a letter grade (A, B, C, D, or F). 
    This is their Minimum Grade.
    Find their highest progress score across those courses, and convert that single number into a letter grade (A, B, C, D, or F). 
    This is their Maximum Grade."]
*/

SELECT *
FROM StudentCourse;

/* My 1st unfinished first attempt */
SELECT S.firstname, S.lastname,
	CASE
		WHEN progress < 40 THEN 'F'
		WHEN progress < 50 THEN 'D'
		WHEN progress < 60 THEN 'C'
        WHEN progress < 70 THEN 'B'
		WHEN progress >= 70 THEN 'A'
    END AS progress_score
FROM Student S
JOIN StudentCourse SC ON S.id = SC.studentid
ORDER BY ;

SELECT
    S.firstname,
    S.lastname,
    CASE
        WHEN MIN(SC.progress) < 40 THEN 'F'
        WHEN MIN(SC.progress) < 50 THEN 'D'
        WHEN MIN(SC.progress) < 60 THEN 'C'
        WHEN MIN(SC.progress) < 70 THEN 'B'
        ELSE 'A'
    END AS MinGrade,
    CASE
        WHEN MAX(SC.progress) < 40 THEN 'F'
        WHEN MAX(SC.progress) < 50 THEN 'D'
        WHEN MAX(SC.progress) < 60 THEN 'C'
        WHEN MAX(SC.progress) < 70 THEN 'B'
        ELSE 'A'
    END AS MaxGrade
FROM Student S
JOIN StudentCourse SC
    ON S.id = SC.studentid
GROUP BY
    S.id,
    S.firstname,
    S.lastname
ORDER BY
    MinGrade DESC,
    MaxGrade DESC,
    S.firstname ASC,
    S.lastname ASC;
/*AI VIP Version that HR passed as good!!!!*/

/*
What This Exercise Demonstrates:
- Joining Student and StudentCourse using primary and foreign keys.
- Calculating minimum and maximum values using MIN() and MAX().
- Grouping records by individual student using GROUP BY.
- Applying conditional logic using CASE expressions.
- Converting numerical progress values into letter grades.
- Using aggregate functions within conditional expressions.
- Sorting results using multiple ORDER BY criteria.

Key Takeaway:
MIN() and MAX() calculate the lowest and highest progress values
for each student. CASE expressions evaluate those aggregate values
against the grading scale and assign the appropriate letter grades.
GROUP BY ensures that the calculations are performed separately
for each student, while ORDER BY organizes the final results using
the requested grade and name sorting criteria.

This is one of the stronger examples in your SQL collection because it combines:
- Aggregate functions (MIN, MAX).
- Conditional logic (CASE).
- Grouping (GROUP BY).
- Multi-column sorting (ORDER BY).
{RG}
*/
