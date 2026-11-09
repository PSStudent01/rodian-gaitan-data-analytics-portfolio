/* 
6)
Order Management System:
- A retail company maintains its customer data in the CUSTOMER table. 
- List all customers sorted by their names in descending order.
- If multiple customers have the same NAME, sort them by ID in ascending order.
[4 Ruth Hanson
7 Ruth Gutierrez
5 Paula Fuller
9 Joe Garza
1 Frances White
8 Ernest Thomas
2 Carolyn Bradley
6 Bonnie Johnston
3 Annie Fernandez
10 Anne Harris]
*/

-- Create table
CREATE TABLE CUSTOMER (
    ID INTEGER PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    COUNTRY VARCHAR(50) NOT NULL,
    CREDITS INTEGER NOT NULL
);

-- Insert sample data
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (1, 'Frances White', 'USA', 200350);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (2, 'Carolyn Bradley', 'UK', 15354);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (3, 'Annie Fernandez', 'France', 359200);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (4, 'Ruth Hanson', 'Albania', 1060);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (5, 'Paula Fuller', 'USA', 14789);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (6, 'Bonnie Johnston', 'China', 100243);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (7, 'Ruth Gutierrez', 'USA', 998999);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (8, 'Ernest Thomas', 'Canada', 500500);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (9, 'Joe Garza', 'UK', 18782);
INSERT INTO CUSTOMER (ID, NAME, COUNTRY, CREDITS) VALUES (10, 'Anne Harris', 'USA', 158367);

-- Verify table was created
SELECT *
FROM Customer;

-- Queries to address the question at hand
SELECT id, name
FROM Customer
ORDER BY name DESC, id ASC;

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Sorting query results using ORDER BY.
- Applying descending order (DESC) to text values.
- Applying ascending order (ASC) to numerical values.
- Sorting by multiple columns with different sort directions.

Key Takeaway:
The ORDER BY clause can sort query results using multiple columns.
Each column can have its own sort direction, allowing records to
be organized according to a primary sorting criterion and then
a secondary criterion when values are identical. This is useful
for organizing customer records, generating reports, and
maintaining consistent result ordering.
{RG}
*/