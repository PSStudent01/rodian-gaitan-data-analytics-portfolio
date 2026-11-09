/*3C1: List courses without faculty.
Write queries that return the following resultsets:
Quite a few students have been complaining that the professors are absent from some of their courses.
Write a query to list the << names of all Courses where the number of faculty assigned to those courses is zero >>.
The output should be sorted by Course Name in ascending alphabetical order.
*/

-- "Course names where faculty assigned = 0"
-- Queries to address the question at hand
# 1
SELECT *
FROM Faculty F
JOIN FacultyCourse FC ON F.id = FC.facultyid
JOIN Course C ON FC.courseid = C.id;
-- I did this to tets my JOINs

# 2
SELECT FC.courseid, COUNT(FC.facultyid) AS 'Faculty_Per_Course'
FROM Faculty F
JOIN FacultyCourse FC ON F.id = FC.facultyid
JOIN Course C ON FC.courseid = C.id
GROUP BY FC.courseid;

# 3
SELECT FC.courseid, FC.facultyid
FROM Faculty F
LEFT JOIN FacultyCourse FC ON F.id = FC.facultyid
LEFT JOIN Course C ON FC.courseid = C.id
-- GROUP BY FC.courseid;

# 4
SELECT FC.facultyid, FC.courseid 
FROM Faculty F
LEFT JOIN FacultyCourse FC ON F.id = FC.facultyid
LEFT JOIN Course C ON FC.courseid = C.id;
-- GROUP BY FC.courseid;

# 5
SELECT FC.courseid, COUNT(FC.facultyid) AS 'Faculty_Per_Course'
FROM Faculty F
JOIN FacultyCourse FC ON F.id = FC.facultyid
JOIN Course C ON FC.courseid = C.id
GROUP BY FC.courseid;

# 6
SELECT FC.courseid, COUNT(FC.facultyid) AS 'Faculty_Per_Course'
FROM Faculty F
JOIN FacultyCourse FC ON F.id = FC.facultyid
JOIN Course C ON FC.courseid = C.id
GROUP BY FC.courseid;

# 7
SELECT FC.courseid, COUNT(FC.facultyid) AS 'Faculty_Per_Course'
FROM Course C
LEFT JOIN FacultyCourse FC
LEFT JOIN Faculty F


FROM Faculty F
JOIN FacultyCourse FC ON F.id = FC.facultyid
JOIN Course C ON FC.courseid = C.id
GROUP BY FC.courseid;

SELECT FC.courseid, COUNT(FC.facultyid) AS 'Faculty_Per_Course'
FROM Faculty F
JOIN FacultyCourse FC ON F.id = FC.facultyid
JOIN Course C ON FC.courseid = C.id
GROUP BY FC.courseid
ORDER BY COUNT(FC.facultyid);

SELECT FC.courseid, COUNT(FC.facultyid) AS 'Faculty_Per_Course'
FROM Faculty F
LEFT JOIN FacultyCourse FC ON F.id = FC.facultyid
LEFT JOIN Course C ON FC.courseid = C.id
GROUP BY FC.courseid
ORDER BY COUNT(FC.facultyid);

SELECT FC.courseid, COUNT(FC.facultyid) AS 'Faculty_Per_Course'
FROM Faculty F
RIGHT JOIN FacultyCourse FC ON F.id = FC.facultyid
RIGHT JOIN Course C ON FC.courseid = C.id
GROUP BY FC.courseid
ORDER BY COUNT(FC.facultyid);
/* Issues:
The core problem
You're starting your FROM clause with Faculty, then joining out to FacultyCourse and Course. But think about what that means: 
you're starting from the table of faculty members. If a course has zero faculty assigned, there's no row in Faculty 
(or FacultyCourse) that could ever lead you to that course in the first place — it simply never enters your result set, 
no matter what kind of join you use afterward.
This is the same category of mistake as your first query — starting from the wrong "anchor" table. When the question is "find 
courses where something is missing," you generally need to start from the table that should have the thing (Course), 
not the table representing the thing itself (Faculty).
Second issue: you're selecting courseid, not the course name
The question asks for the names of courses — but you're selecting FC.courseid (a raw ID number), and that's coming from 
FacultyCourse, not Course, even though you did join Course in. C.name is sitting right there unused. 
{IOWS:
- joined one additional table unnecessarily
- you should follow the structure of teh quesiton (for example making Course the backbone), particularly where you think you might end up LEFT or RIGHT joining
-Q: is the order of the ON join predicate meaningless, whether you use LEFT or RIGHT JOIN? for example: ON C.id = FC.courseid vs. sql
*
'ON FC.courseid = C.id' vs 'ON C.id = FC.courseid'?
A: Yes — meaningless in all cases you've listed. All three cases
Q:
-  what some reason or other, would I also LEFT JOIN into the Faculty table as well as in:
 SELECT C.name AS 'Course_Name'
FROM Course C
LEFT JOIN FacultyCourse FC ON C.id = FC.courseid
LEFT JOIN Faculty ON FC.facultyid = F.id  <-------{would I LEFT JOIN here too???}
WHERE FC.facultyid IS NULL
ORDER BY C.name ASC;
A:
Yes, in this specific case, you would need LEFT JOIN here too — and here's why it actually matters this time 
(not just "yes because more tables need it," but a real logical reason specific to your query).
Why LEFT JOIN is required here (not just a style choice)
Look at your WHERE clause: WHERE FC.facultyid IS NULL. This filters your results down to only the rows where FC.facultyid is
 NULL — meaning, by the time you reach that third join, FC.facultyid is guaranteed to be NULL for every remaining row.}

/* AI answer */
SELECT C.name AS 'Course_Name'
FROM Course C
LEFT JOIN FacultyCourse FC ON C.id = FC.courseid
WHERE FC.facultyid IS NULL
ORDER BY C.name ASC;
/*
Why this works
Start from Course — every course is guaranteed to appear at least once, regardless of whether it has any faculty
LEFT JOIN FacultyCourse — for courses with faculty, this fills in matching rows. For courses without any faculty, the 
FacultyCourse columns come back as NULL (since there's nothing to match)
WHERE FC.facultyid IS NULL — this is the key filter: it keeps only the courses where that left join found nothing — i.e., 
courses with zero faculty assigned
No GROUP BY/COUNT needed — since you're not counting anything, just filtering for absence, this is actually a simpler query than 
your version

The general pattern worth remembering:
"Find X where Y is missing/zero" in SQL almost always follows this shape: LEFT JOIN from the "should have it" table, then WHERE 
[right-side column] IS NULL. This pattern comes up constantly (customers with no orders, products never sold, students in no
 courses, etc.) — worth locking in as a template for future problems like this.
*/

/* VIP - My Version 1 */
SELECT C.name AS 'Course_Name'
FROM FacultyCourse FC
RIGHT JOIN Course C ON FC.courseid = C.id
-- RIGHT JOIN Course C ON C.id = FC.courseid
WHERE FC.facultyid IS NULL
ORDER BY C.name ASC;

/* VIP - My Version 2 */
SELECT C.name AS 'Course_Name'
FROM FacultyCourse FC
-- RIGHT JOIN Course C ON FC.courseid = C.id
RIGHT JOIN Course C ON C.id = FC.courseid
WHERE FC.facultyid IS NULL
ORDER BY C.name ASC;

/*
What This Exercise Demonstrates:
- Understanding relationships between courses and faculty assignments.
- Using LEFT JOIN to preserve records from the primary table.
- Identifying missing related records with IS NULL.
- Understanding why the starting table matters when searching for missing relationships.
- Sorting results alphabetically using ORDER BY.

Key Takeaway:
LEFT JOIN returns all records from the left table, including those
without matching records in the related table. Filtering for NULL
in the matching table identifies records that have no corresponding
relationship. This technique is useful for finding missing
assignments, unassigned courses, customers without orders, and
other records with missing associations.

The most important concept is the anti-join pattern:
SELECT ...
FROM PrimaryTable P
LEFT JOIN RelatedTable R ON P.id = R.primary_id
WHERE R.primary_id IS NULL;
In plain English:
1. Start with all the records you want to investigate.
2. Look for matching records in the related table.
3. Keep only the records where no match was found.
{RG}
*/

