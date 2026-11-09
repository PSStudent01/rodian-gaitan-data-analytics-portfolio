/* 
12)
Student Rank
- A university stores students' standardized test scores in a table named STUDENT. Student X placed 213th on the test.
- Write a query to find Student X's test score (the 213th highest score in the STUDENT.SCORE column).
[Q:
how is SQL able to calculate the score for teh 213th place if the data set is made up of only 6 rows?
A:
Great question — this is a really common point of confusion with HackerRank problems, so let's clear it up.
The sample data you see is not the actual dataset the query runs against.
HackerRank almost always shows you a tiny sample (6 rows here) just so you can understand the shape of the data and verify your 
logic conceptually. But when you hit "Submit," your query runs against the real, hidden test dataset — which for this problem 
almost certainly has hundreds or thousands of rows (enough to have a legitimate "213th place").

Q:
so that means that running the Script to Create the DB, in my own SQL sandbox wont work to help solve this problem huh?
A:
Right — you've got it. Running the sample data script in your sandbox will let you check your syntax works and doesn't throw 
errors, but it can't validate that the logic actually returns the correct 213th-place score, since there's no 213th row to find.
If you want to actually stress-test the query yourself, there are a couple of options:
Option 1: 
Test the logic with a smaller, achievable target
Temporarily change your query to find the 4th highest score instead (since the problem itself tells you that's 87 with the
sample data). If your query returns 87, you know the logic is sound — then you just swap OFFSET 212 back in for the real 
submission...
*
SELECT SCORE
FROM STUDENT
ORDER BY SCORE DESC
LIMIT 1 OFFSET 3;  -- 4th place, to test against the known answer of 87
Option 2: 
Generate a larger fake dataset locally
I can write you a script that inserts, say, 500 rows of random scores into your sandbox's STUDENT table. Then you'd have enough 
rows to actually test OFFSET 212 and see a real result come back.
Want me to generate that second option for you? It'd let you fully test the real query before submitting.
]
[no output provided!]
*/

-- Create table
CREATE TABLE STUDENT_I (
    ID INTEGER PRIMARY KEY,
    AGE INTEGER NOT NULL,
    SCORE INTEGER NOT NULL
);

-- Insert sample data
INSERT INTO STUDENT_I (ID, AGE, SCORE) VALUES (1, 19, 91);
INSERT INTO STUDENT_I (ID, AGE, SCORE) VALUES (2, 20, 90);
INSERT INTO STUDENT_I (ID, AGE, SCORE) VALUES (3, 20, 87);
INSERT INTO STUDENT_I (ID, AGE, SCORE) VALUES (4, 21, 72);
INSERT INTO STUDENT_I (ID, AGE, SCORE) VALUES (5, 19, 98);
INSERT INTO STUDENT_I (ID, AGE, SCORE) VALUES (6, 20, 50);

-- Verify table was created
SELECT *
FROM STUDENT_I;

-- Queries to address the question at hand
# Pending Practice
-- a) this is an exmaple of a stress test:
-- a1)
SELECT SCORE
FROM STUDENT_I
ORDER BY SCORE DESC;
-- a2)
SELECT SCORE
FROM STUDENT_I
ORDER BY SCORE DESC
LIMIT 1 OFFSET 3;  -- essentially says skip the first 3 rows and return the 4th score, which itc is 87.
-- b)
SELECT SCORE
FROM STUDENT_I
ORDER BY SCORE DESC
LIMIT 1 OFFSET 212; -- essentially says skip the first 212 rows and return the 213th.

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Sorting numerical values using ORDER BY DESC.
- Retrieving a specific ranked record using LIMIT and OFFSET.
- Testing query logic against a smaller sample dataset.
- Understanding the difference between sample data and a larger
  production or hidden dataset.

Key Takeaway:
SQL can retrieve a specific record position by sorting data
and using OFFSET to skip preceding records, followed by LIMIT
to control how many records are returned. This technique is
useful for ranking records, retrieving specific positions,
and working with large datasets.
{RG}
*/