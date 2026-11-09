/*
2)
3A: Lists number of courses of each department.
Write queries that return the following results:
The Curricular Planning Committee is attempting to find gaps in the current course offerings. 
You need to provide them with a query which <lists each department and the number of courses offered for that department>.
The output should be <sorted first by the Number of Courses in ascending order>, then by <Department Name in ascending order>.

College Management System Schema
Scoring
All queries must run in HackerRank.
All queries must produce the expected output.
You must pass all test cases in the question to receive full credit.
You must submit your query by clicking the Submit button to ensure that your answer is saved.
*/

-- Queries to address the question at hand
# 1)
SELECT D.name, C.name -- count(name)
FROM Department D
JOIN Course C ON D.id = C.deptid;

# 2)
SELECT name, count(name)
FROM Department D
JOIN Course C ON D.id = C.deptid
GROUP BY name;
-- Returns Error Code: 1052. Column 'name' in field list is ambiguous

# 3)
SELECT D.name, count(C.name) As '#_Courses'
FROM Department D
JOIN Course C ON D.id = C.deptid
GROUP BY D.name
-- ORDER BY '#_Courses';  -- SQL ignore teh alias name
ORDER BY count(C.name);

# 4)
SELECT D.name, count(C.name) As '#_Courses'
FROM Department D
JOIN Course C ON D.id = C.deptid
GROUP BY D.name
-- ORDER BY '#_Courses';  -- SQL ignore teh alias name
ORDER BY count(C.name), D.name;

# 5)
SELECT D.name, count(*) As '#_Courses'  -- use count(*) counting a name column can still work, but it’s safer to count the actual course rows/PK (itc, '*')
FROM Department D
JOIN Course C ON D.id = C.deptid
GROUP BY D.name
-- ORDER BY '#_Courses';  -- SQL ignore teh alias name
ORDER BY count(*) ASC, D.name ASC;

# 6) Best Yet
SELECT D.name, count(C.id) As '#_Courses'  -- use count(*) counting a name column can still work, but it’s safer to count the actual course rows/PK (itc, 'C.id')
FROM Department D
JOIN Course C ON D.id = C.deptid
GROUP BY D.name
ORDER BY count(C.id) ASC, D.name ASC;

/*
What This Exercise Demonstrates:
- Joining related tables using a common key.
- Using table aliases to qualify column references.
- Counting records with the COUNT() aggregate function.
- Grouping records using GROUP BY.
- Sorting aggregated results using ORDER BY.
- Applying multiple sorting criteria with ASC.

Key Takeaway:
GROUP BY allows SQL to calculate aggregate values for each
department rather than returning individual course records.
COUNT() determines the number of courses in each group, while
ORDER BY sorts the results first by course count and then by
department name to resolve ties.

This exercise reinforces an important reporting pattern:
JOIN → GROUP BY → COUNT → ORDER BY
{RG}
*/
