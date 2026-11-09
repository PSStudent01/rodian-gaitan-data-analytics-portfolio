/* 
10)
The First Orders:
- A company maintains information about its orders in the ORDERS table.
- Print details of the earliest 5 undelivered orders sorted by order date (ascending).
- If there are more than 5 such orders, select those with the lowest order ID. 
- Sort the output by increasing order ID.
[10100 2003-01-06 PLACED 363
10101 2003-01-06 PLACED 128
10102 2003-01-06 IN TRANSIT 181
10106 2003-01-07 IN TRANSIT 278
10120 2003-01-07 PLACED 114]
 */

-- Create table
CREATE TABLE Orders_II (
    id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    customer_id INT NOT NULL
);

-- Insert sample data
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10100, '2003-01-06', 'PLACED', 363);
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10101, '2003-01-06', 'PLACED', 128);
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10102, '2003-01-06', 'IN TRANSIT', 181);
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10103, '2003-01-06', 'DELIVERED', 121);
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10104, '2003-01-07', 'DELIVERED', 114);
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10106, '2003-01-07', 'IN TRANSIT', 278);
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10120, '2003-01-07', 'PLACED', 114);
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10122, '2003-05-05', 'IN TRANSIT', 350);
INSERT INTO Orders_II (id, order_date, status, customer_id) VALUES (10123, '2003-05-05', 'DELIVERED', 103);

-- Verify table was created
SELECT *
FROM Orders_II;

-- Queries to address the question at hand
-- a)
SELECT *
FROM Orders_II
WHERE status != 'DELIVERED'
ORDER BY order_date;
-- LIMIT 5;

-- b)
SELECT *
FROM Orders_II
WHERE status != 'DELIVERED'
ORDER BY order_date
LIMIT 5;
/*The problem: the question asks for two different sorts happening at two different stages, and your query only does one.
Selecting the right 5 rows: When you sort by order_date alone, and multiple orders share the same date (like all 5 in your Test 
Case 1 output — all 2016-09-04), the database can pick any order among ties. That's undefined behavior unless you tell it how to 
break ties. The problem says: if there's a tie, pick the ones with the lowest order ID. Your query has no tiebreaker, so it might 
grab the wrong 5 rows out of a larger tied group.
Final output order: Even after you get the correct 5 rows, the problem says the final result must be sorted by increasing 
order ID — not by date. Your query still has ORDER BY order_date, so even if the right rows come back, they're in the 
wrong order.*/

-- c) AI:
SELECT * FROM (
    SELECT * FROM Orders_II
    WHERE status != 'DELIVERED'
    ORDER BY order_date ASC, id ASC
    LIMIT 5
) AS earliest_orders
ORDER BY id ASC;
/*Fix:
- The inner query picks the correct 5 rows, earliest by date, and then breaks any ties by lowest ID.
- The outer query re-sorts just those 5 rows by ID for the final display*/

/*
What This Exercise Demonstrates:
- Relational table creation.
- Data insertion and verification.
- Filtering records using the WHERE clause.
- Excluding records using the not-equal operator (!=).
- Sorting by multiple columns using ORDER BY.
- Applying secondary sorting to break ties.
- Limiting query results using LIMIT.
- Using a subquery (derived table) to perform multiple
  stages of sorting.

Key Takeaway:
SQL subqueries allow one query to use the results of another
query as its data source. This makes it possible to select
records using one set of criteria and then organize the
selected results differently for final presentation. This is
useful for identifying priority transactions, retrieving
earliest or latest records, and generating operational reports.
{RG}
*/