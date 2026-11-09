
/*3F: List students Name and 
# of Courses in their major  
Write queries that return the following resultsets:  
<< Students are required to take 4 courses >>, and at << least 2 of these courses must be from the department of their major >>.
Write a query to << list students' First Name, Last Name, and Number of Courses they are taking in their major department >>.
The output should be << sorted first by the Number of Courses in descending order >>, then << by First Name in ascending order >>, 
then << by the Last Name in ascending order. >>*/

/*[Q: can you refrase the question so i can i understand it best?
Yes. Stripped of the confusing wording, the exercise is asking:
For every student, find out how many of the courses they are enrolled in belong to the same department as their major.
Then display the student's first name, last name, and that count.]*/

-- tables:
-- Department
-- Student
-- StudentCourse


SELECT *
FROM Student;

SELECT *
FROM StudentCourse;

SELECT *
FROM Department;

SELECT firstname, lastname, COUNT(courseid) AS Courses
FROM Department D
JOIN Student S ON D.id = S.majorid
JOIN StudentCourse SC ON S.id = SC.studentid
GROUP BY firstname, lastname;

SELECT firstname, lastname, COUNT(courseid) AS Courses
FROM Department D
JOIN Student S ON D.id = S.majorid
JOIN StudentCourse SC ON S.id = SC.studentid
JOIN Course C ON SC.courseid = C.id
WHERE C.deptid = D.id
GROUP BY firstname, lastname;
/*good logic so far*/

SELECT firstname, lastname, COUNT(courseid) AS Courses
FROM Department D
JOIN Student S ON D.id = S.majorid
JOIN StudentCourse SC ON S.id = SC.studentid
JOIN Course C ON SC.courseid = C.id
WHERE C.deptid = D.id
GROUP BY firstname, lastname
ORDER BY COUNT(courseid) DESC, firstname ASC, lastname ASC;
/*yeah it worked without AI help. VIP VIP VIP!!!! */

/*
What This Exercise Demonstrates:
- Joining multiple related tables using primary and foreign keys.
- Connecting students to their major departments.
- Using an enrollment table to identify courses taken by students.
- Joining Course to identify the department offering each course.
- Filtering records using a comparison between department IDs.
- Counting qualifying courses using COUNT().
- Grouping results by individual student.
- Sorting results using multiple ORDER BY criteria.

Key Takeaway:
A student's major department and course enrollment are separate
relationships. Joining Student to Department identifies the
student's major, while StudentCourse and Course identify the
courses they are taking. Comparing the course department ID
with the student's major department ID ensures that only courses
within the student's major are counted.
{RG}
*/




