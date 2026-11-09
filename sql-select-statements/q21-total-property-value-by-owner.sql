
/* 
21)
Value of Properties Owned:
- Write a query to print the IDs of owners who have more than 100 million worth of houses and own more than 1 house.
- The result should be in the format: BUYER_ID TOTAL_WORTH.
[returns..
1 100 ]  <---{INCORRECT}
According to AI:
With this exact query, I'd expect it to return no rows at all — an empty result set!!!
*/

-- Create tables
CREATE TABLE price (
    HOUSE_ID VARCHAR(20) PRIMARY KEY,
    PRICE INTEGER NOT NULL
);

CREATE TABLE house (
    BUYER_ID INTEGER NOT NULL,
    HOUSE_ID VARCHAR(20) NOT NULL,
    FOREIGN KEY (HOUSE_ID) REFERENCES price(HOUSE_ID)
);

-- Insert price
INSERT INTO price (HOUSE_ID, PRICE) VALUES ('abc123', 60);
INSERT INTO price (HOUSE_ID, PRICE) VALUES ('def456', 20);
INSERT INTO price (HOUSE_ID, PRICE) VALUES ('abc456', 120);
INSERT INTO price (HOUSE_ID, PRICE) VALUES ('def123', 40);
INSERT INTO price (HOUSE_ID, PRICE) VALUES ('def789', 70);

-- Insert house
INSERT INTO house (BUYER_ID, HOUSE_ID) VALUES (1, 'abc123');
INSERT INTO house (BUYER_ID, HOUSE_ID) VALUES (2, 'def456');
INSERT INTO house (BUYER_ID, HOUSE_ID) VALUES (3, 'abc456');
INSERT INTO house (BUYER_ID, HOUSE_ID) VALUES (1, 'def123');
INSERT INTO house (BUYER_ID, HOUSE_ID) VALUES (2, 'def789');

-- Verify table was created
SELECT *
FROM Price ;

SELECT *
FROM House ;

-- Queries to address the question at hand
# Pending Practice
SELECT buyer_id, SUM(price) AS Total_Worth
FROM House h
JOIN Price p ON h.house_id = p.house_id
-- WHERE price > 100 
GROUP BY buyer_id
HAVING COUNT(h.house_id) > 1 
AND SUM(price) > 100;


SELECT buyer_id, SUM(price) AS Total_Worth
FROM House h
JOIN Price p ON h.house_id = p.house_id
-- WHERE price > 100 
GROUP BY buyer_id
HAVING COUNT(h.house_id) > 1 
AND SUM(price) > 100; 

/*
What This Exercise Demonstrates:
- Creating related tables using primary and foreign keys.
- Joining tables to retrieve related property information.
- Calculating total property values using SUM().
- Grouping records by buyer using GROUP BY.
- Counting related records using COUNT().
- Filtering aggregated results using HAVING.
- Applying multiple aggregate conditions using AND.

Key Takeaway:
GROUP BY and aggregate functions can calculate totals and
counts for each group of related records. HAVING filters
those groups based on aggregate conditions, such as requiring
a buyer to own multiple properties with a combined value
exceeding a specified threshold.

This exercise reinforces:
- JOIN: Combining property ownership records with property prices.
- SUM(): Calculating the combined value of multiple properties.
- COUNT(): Determining how many properties each buyer owns.
- GROUP BY: Performing calculations separately for each buyer.
- HAVING: Applying multiple conditions to aggregated results.
- AND: Requiring both conditions to be true.
{RG}
*/

