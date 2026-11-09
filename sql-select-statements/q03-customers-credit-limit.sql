/* 
3)
Customers Credit Limit:
- A company maintains its customer data in the CUSTOMER table. Find customers from the USA with credit limits greater than 100000.
- Print the IDs and names of these customers. Row order is unimportant.
[returns...
1 Frances White
7 Ruth Gutierrez
10 Anne Harris]*/

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

-- Query to address the question at hand
SELECT id, name
FROM Customer
WHERE country = 'USA'
	AND credits > 100000;

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Filtering records using the WHERE clause.
- Comparing text values using the equality operator (=).
- Comparing numerical values using the greater-than operator (>).
- Combining multiple conditions using the AND operator.

Key Takeaway:
SQL allows multiple filtering conditions to be combined in a
single WHERE clause. By comparing both text and numerical values,
a query can retrieve specific records that meet multiple business
criteria, such as identifying customers in a particular country
whose credit limits exceed a specified amount.
{RG}
*/