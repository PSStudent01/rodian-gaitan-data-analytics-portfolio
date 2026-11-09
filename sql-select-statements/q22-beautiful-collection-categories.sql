/* 
22)
The Beautiful Collection

There are various collections of red, green, and blue balls. Categorize these collections based on their counts:

GOOD: If the count of red, green, and blue balls are equal
BAD: If the count of any two colored balls are equal
WORSE: If all colored balls have different counts

Write a query to print the type represented by each row of the table. The output is case-sensitive, so print only GOOD, BAD, or WORSE.

[returns
BAD
GOOD
WORSE
WORSE
BAD
]
*/


-- Create table
CREATE TABLE COLLECTION (
    RED INTEGER NOT NULL,
    GREEN INTEGER NOT NULL,
    BLUE INTEGER NOT NULL
);

-- Insert sample data
INSERT INTO COLLECTION (RED, GREEN, BLUE) VALUES (65, 65, 87);
INSERT INTO COLLECTION (RED, GREEN, BLUE) VALUES (50, 50, 50);
INSERT INTO COLLECTION (RED, GREEN, BLUE) VALUES (30, 50, 100);
INSERT INTO COLLECTION (RED, GREEN, BLUE) VALUES (40, 50, 90);
INSERT INTO COLLECTION (RED, GREEN, BLUE) VALUES (92, 50, 50);

-- Verify table was created
SELECT *
FROM Collection ;

-- Queries to address the question at hand
# Pending Practice
SELECT 
    CASE 
        WHEN red = green AND green = blue THEN 'GOOD'
        WHEN red = green OR green = blue OR red = blue THEN 'BAD'
        WHEN red != green OR green != blue OR red != blue THEN 'WORSE'
        ELSE "unkknown"
    END AS Balls_Analysis
FROM Collection;

/*
What This Exercise Demonstrates:
- Conditional logic using CASE, WHEN, THEN, and ELSE.
- Comparing multiple columns within the same record.
- Using AND to require multiple conditions to be true.
- Using OR when at least one condition must be true.
- Returning categorized results based on business rules.

Key Takeaway:
The CASE expression evaluates conditions in order and returns the
result associated with the first matching condition. Combining
AND and OR allows SQL to evaluate more complex business rules
and classify records based on multiple column values.

You practiced translating business rules into SQL conditions:
- AND requires every specified comparison to be true.
- OR requires at least one comparison to be true.
- CASE evaluates conditions in sequence and returns the first matching result.
- Multiple columns can be compared within a single row without joining another table.
{RG}
*/