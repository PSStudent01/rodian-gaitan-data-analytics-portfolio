/* 
13)
Student Grades:
- Assign letter grades to students based on their scores.
- Write a query to print each student's ID and letter grade using the following grading scale:
F: Score < 20
D: 20 ≤ Score < 40
C: 40 ≤ Score < 60
B: 60 ≤ Score < 80
A: Score ≥ 80
Format the output as: "Student STUDENT.ID has grade: letter grade"
[returns...
Student 1 has grade: D
Student 2 has grade: C
Student 3 has grade: C
Student 4 has grade: B
Student 5 has grade: A]
*/

-- Create table
CREATE TABLE STUDENT_III (
    ID INTEGER PRIMARY KEY,
    SCORE INTEGER NOT NULL
);

-- Insert sample data
INSERT INTO STUDENT_III (ID, SCORE) VALUES (1, 20);
INSERT INTO STUDENT_III (ID, SCORE) VALUES (2, 50);
INSERT INTO STUDENT_III (ID, SCORE) VALUES (3, 50);
INSERT INTO STUDENT_III (ID, SCORE) VALUES (4, 68);
INSERT INTO STUDENT_III (ID, SCORE) VALUES (5, 95);

-- Verify table was created
SELECT *
FROM STUDENT_III;

-- Queries to address the question at hand
# Pending Practice
-- a)
SELECT CONCAT('Student ', id, ' has grade: ', score)
FROM STUDENT_III;

-- b)
SELECT CONCAT('Student ', id, ' has grade: ', score, '',
CASE
	WHEN score < 20 THEN 'F'
	WHEN 20 <= Score < 40 THEN 'D'
	WHEN 40 <= Score < 60 THEN 'C'
	WHEN 60 <= Score < 80 THEN 'B'
	WHEN Score >= 80 THEN 'A'
    ELSE 'unknown'
END)
FROM STUDENT_III;

-- c) My version:
SELECT CONCAT('Student ', id, ' has grade: ', score, ' ', 
CASE
	WHEN score < 20 THEN 'F'
	WHEN score >= 20 AND score < 40 THEN 'D'
	WHEN score >= 40 AND score < 60 THEN 'C'
	WHEN score >= 60 AND score < 80 THEN 'B'
	WHEN score >= 80 THEN 'A'
    ELSE 'unknown'
END) AS score_by_student
FROM STUDENT_III;

-- d) Required version:
SELECT CONCAT('Student ', id, ' has grade: ',
CASE
	WHEN score < 20 THEN 'F'
	WHEN score >= 20 AND score < 40 THEN 'D'
	WHEN score >= 40 AND score < 60 THEN 'C'
	WHEN score >= 60 AND score < 80 THEN 'B'
	ELSE 'A'
END) AS score_by_student
FROM STUDENT_III;

-- e) Alternate version:
SELECT CONCAT('Student ', id, ' has grade: ',
    CASE
        WHEN score < 20 THEN 'F'
        WHEN score < 40 THEN 'D'
        WHEN score < 60 THEN 'C'
        WHEN score < 80 THEN 'B'
        ELSE 'A'
    END) AS score_by_student
FROM STUDENT_III;

/*
What This Exercise Demonstrates:
- Creating and populating a relational database table.
- Using CONCAT() to combine text and column values.
- Applying conditional logic with the CASE expression.
- Evaluating multiple conditions using WHEN.
- Assigning category labels based on numerical ranges.
- Using ELSE as a default result when none of the previous conditions match.
- Using a column alias to label the query output.

Key Takeaway:
The CASE expression allows SQL to evaluate conditions and return
different values depending on which condition is met. It is useful
for categorizing records, assigning labels, and creating calculated
fields for reports and data analysis.
{RG}
*/

