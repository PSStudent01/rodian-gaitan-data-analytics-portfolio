/* 
19)
Active Backlogs:
- Write a query to return a list of all students with at least one occurrence of a backlog item.
- The result should include only the student names.
[returns
Alex
Chris]
*/
-- Create tables
CREATE TABLE student_II (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL
);

CREATE TABLE backlog (
    STUDENT_ID INTEGER NOT NULL,
    SUBJECT_ID VARCHAR(20) NOT NULL,
    FOREIGN KEY (STUDENT_ID) REFERENCES student_II(ID)
);

-- Insert student_II
INSERT INTO student_II (ID, NAME) VALUES (1, 'Chris');
INSERT INTO student_II (ID, NAME) VALUES (2, 'Sam');
INSERT INTO student_II (ID, NAME) VALUES (3, 'Alex');

-- Insert backlog
INSERT INTO backlog (STUDENT_ID, SUBJECT_ID) VALUES (1, 'abc123');
INSERT INTO backlog (STUDENT_ID, SUBJECT_ID) VALUES (3, 'def456');

-- Verify table was created
SELECT *
FROM backlog ;

SELECT *
FROM student_II;

-- Queries to address the question at hand
# Pending Practice
SELECT DISTINCT s.name
FROM Student_II S
JOIN Backlog B ON s.id = b.student_id;

/*
Q:
question, was the FK in 'Backlog' properly set up to link up to PK in 'Student_II'?
A:
Yes, they match — the foreign key definition in your `CREATE TABLE` statement and the actual FK metadata shown in the panel are describing the same relationship.

Breaking down what each side is telling you:

**Your code (right side):**
```sql
FOREIGN KEY (STUDENT_ID) REFERENCES student_II(ID)
```
This says: `backlog.STUDENT_ID` must reference `student_II.ID`.

**The metadata panel (left side):**
```
Target: student_ii (STUDENT_ID → ID)
```
This says the same thing in the tool's own notation: the foreign key's column (`STUDENT_ID`) maps to the target table `student_ii`'s `ID` column.

So functionally, yes — they agree. The `backlog.STUDENT_ID` column is correctly constrained to only allow values that exist in `student_II.ID`.

One small thing worth noting (not an error, just a heads-up): the table name shows up as `student_II` in your code but `student_ii` in the metadata panel — different capitalization. On most systems (including MySQL on Windows/Mac by default) table names are case-insensitive, so this won't cause a problem. But if your MySQL server is running on Linux with case-sensitive table names enabled (which is a common production setting), inconsistent casing like this *can* eventually cause confusion or errors. Not something to worry about for practice purposes, but worth keeping consistent as a habit.
*/

/*
What This Exercise Demonstrates:
- Creating related tables using primary and foreign keys.
- Establishing referential integrity between tables.
- Joining tables using matching key columns.
- Filtering records based on the existence of related records.
- Selecting specific columns from joined tables.
- Eliminating duplicate results using DISTINCT.

Key Takeaway:
SQL JOIN operations can identify records that have matching
entries in related tables. DISTINCT prevents duplicate results
when multiple related records exist. Foreign keys help maintain
referential integrity by ensuring that referenced records
exist in the parent table.

This exercise reinforces:
- Primary and foreign keys: Establishing relationships between tables.
- INNER JOIN: Returning only records with matching entries.
- DISTINCT: Eliminating duplicate names.
- EXISTS: An alternative way to check whether related records exist.
- Referential integrity: Ensuring related records maintain valid references.
{RG}
*/