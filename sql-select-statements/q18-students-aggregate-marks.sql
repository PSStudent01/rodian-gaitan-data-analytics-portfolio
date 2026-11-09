/* 
18)
Aggregate Marks:
- Write a query to retrieve the records of students who have a sum of marks greater than or equal to 500.
- The result should include STUDENT_ID and SUM_OF_MARKS, sorted in descending order by STUDENT_ID.
[ returns..
3 510
2 500]
*/

-- Create table
CREATE TABLE marks_II (
    STUDENT_ID INTEGER NOT NULL,
    MARKS INTEGER NOT NULL
);

-- Insert sample data
INSERT INTO marks_II (STUDENT_ID, MARKS) VALUES (1, 450);
INSERT INTO marks_II (STUDENT_ID, MARKS) VALUES (2, 200);
INSERT INTO marks_II (STUDENT_ID, MARKS) VALUES (3, 260);
INSERT INTO marks_II (STUDENT_ID, MARKS) VALUES (2, 300);
INSERT INTO marks_II (STUDENT_ID, MARKS) VALUES (3, 250);


-- Verify table was created
SELECT *
FROM marks_II;

-- Queries to address the question at hand
# Pending Practice
SELECT student_id, SUM(marks) 
FROM Marks_II
GROUP BY student_id
HAVING SUM(marks) >= 500
ORDER BY student_id DESC;

/*
What This Exercise Demonstrates:
- Creating and populating a database table.
- Using aggregate functions such as SUM().
- Grouping records using GROUP BY.
- Filtering aggregated results using HAVING.
- Sorting results in descending order using ORDER BY.
- Assigning column aliases to calculated values.

Key Takeaway:
GROUP BY organizes records into groups so aggregate functions
can calculate values for each group. HAVING filters those
groups based on the calculated results, making it useful
when identifying records that meet specific aggregate
conditions, such as students whose combined marks reach
a required threshold.

This exercise reinforces:
- SUM(): Calculates the total marks for each student.
- GROUP BY: Combines records belonging to the same student.
- HAVING: Filters groups based on their calculated totals.
- ORDER BY DESC: Sorts student IDs from highest to lowest.
- Column aliases: Gives calculated columns meaningful names.
{RG}
*/