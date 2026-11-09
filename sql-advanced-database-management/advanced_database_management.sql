use ecommerce;
/* Verification Tools 
--		
SELECT * FROM Customers;
SELECT * FROM OrderDetails;
SELECT * FROM Orders;
SELECT * FROM Products;
-- to see what tables make up DB:
SHOW TABLES;
-- to verify BASIC info - data-types, constraints:
DESCRIBE Customers;
DESCRIBE OrderDetails;
DESCRIBE Orders;
DESCRIBE Products;
-- to verify ROBUST info - data-types, constraints:
SHOW CREATE TABLE Customers;
SHOW CREATE TABLE OrderDetails;
SHOW CREATE TABLE Orders;
SHOW CREATE TABLE Products; */

/* 1) Component 1: Creating Indexes for Query Performance - 10% */
-- Identify and create indexes for the Customers table on last_name and registration_date, for the Orders table on order_date, 
-- and for the Products table on category.
-- a)
CREATE INDEX idx_lastName_regDate
ON Customers (last_name, registration_date);
-- b)
CREATE INDEX idx_orderDate
ON Orders (order_date);
-- c)
CREATE INDEX idx_category
ON Products (category);


/* 2) Component 2: Database Constraints - 15% */
/*A) Setting up Primary Key Constraints*/
-- Implement primary key constraints for all provided tables.
-- Set up foreign key constraints between Orders and Customers, and between OrderDetails, Orders, and Products.
-- Add a check constraint on Products.price to ensure it is greater than zero.
-- a)
ALTER TABLE Customers
ADD primary key (customer_id);
-- b)
ALTER TABLE OrderDetails
ADD primary key (order_detail_id);
-- c)
ALTER TABLE Orders
ADD primary key (order_id);
-- d)
ALTER TABLE Products
ADD primary key (product_id);

/*B) Setting up Foreign Key Constraints*/
-- a)
ALTER TABLE Orders 
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) 
REFERENCES Customers(customer_id);
-- b)
ALTER TABLE OrderDetails 
ADD CONSTRAINT fk_orderdetails_orders
FOREIGN KEY (order_id) 
REFERENCES Orders(order_id);
-- c)
ALTER TABLE OrderDetails 
ADD CONSTRAINT fk_orderdetails_products
FOREIGN KEY (product_id) 
REFERENCES Products(product_id);

/*C) Add a check constraint on Products.price to ensure it is greater than zero.*/
ALTER TABLE Products 
ADD CONSTRAINT chck_products_price
CHECK (price > 0);
/* Testing the CHECK Constraint
#
SELECT *
FROM Products;
#
INSERT INTO Products (product_id, product_name, category, price, description)
VALUES (51, 'Rod_HD', 'My_Electronics', -1.00, 'My_Description');
#
SELECT *
FROM Products;*/


/* 3) Component 3: Database Triggers - 20% */
-- Create a 'trigger on OrderDetails' that updates 'total_amount in Orders' whenever a new order detail is 'added' or an existing 
-- one is 'updated'. Note both tables are existing.
-- A)
DELIMITER $$

CREATE TRIGGER trg_update_total_after_insert
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN

	UPDATE Orders
	SET total_amount = (
		SELECT SUM(quantity * unit_price)
		FROM OrderDetails
		WHERE order_id = NEW.order_id   
		)
	WHERE order_id = NEW.order_id;

END$$

DELIMITER ;

-- #
INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity, unit_price)
VALUES  (53, 50, 50, 10, 45.00);
/* BRIEF DESCRIPTION:
- working from the inside out:
*
SELECT SUM(quantity * unit_price)
		FROM OrderDetails
		WHERE order_id = NEW.order_id   
-- calculates the 'total_amount' for every order for which a 'order_detail_id' has either been inserted in the OrderDetails table.
*
UPDATE Orders
	SET total_amount = (
...
...
		)
	WHERE order_id = NEW.order_id;
-- this part extracts the 'total_amount' calculated by the subquery above AND then updates the 'total_amount' in the 'Orders' table
for the 'order_id' whose 'total_amount' was altered as a result of a new 'order_detail_id' being inserted to the OrderDetails table.
*/

-- B)
-- Create a trigger on 'Customers' that logs changes to 'address' in a new table 'AddressChangeLog'

-- #
CREATE TABLE IF NOT EXISTS AddressChangeLog (
    log_id          INT AUTO_INCREMENT PRIMARY KEY,
    customer_id     INT,
    old_address     VARCHAR(255),
    new_address     VARCHAR(255),
    change_time     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- #
SELECT *
FROM AddressChangeLog;

-- #
SELECT *
FROM Customers;

-- #
ALTER TABLE AddressChangeLog
ADD CONSTRAINT fk_addressChangeLog_customers
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id);

-- #
SHOW CREATE TABLE Customers;

-- #
DELIMITER $$

CREATE TRIGGER trg_after_update_customers
AFTER UPDATE ON Customers
FOR EACH ROW
BEGIN
	
	IF NEW.address_street != OLD.address_street THEN
		INSERT INTO AddressChangeLog (customer_id, old_address, new_address, change_time)
        VALUES (OLD.customer_id, OLD.address_street, NEW.address_street, CURRENT_TIMESTAMP);
	END IF;
    
END$$

DELIMITER ;

-- #
UPDATE Customers
SET address_street = '1234 Main St'
WHERE customer_id = 1;

-- #
UPDATE Customers
SET address_street = '123 Main St'
WHERE customer_id = 1;

-- #
SELECT *
FROM Customers;

-- #
SELECT *
FROM AddressChangeLog;

/* BRIEF DESCRIPTION:
- First you create the table ('AddressChangeLog') that will be tracking the changes after an address change is made in the 'Customers' 
table.
- Then you designate 'customer_id' as FK constraint on the child table 'AddressChangeLog' to reference PK 'customer_id' of the 
parent table 'Customers'.
- Then you create the trigger:
-- 1) an update is made on the 'Customers' table.
-- 2) the IF condition states that if somehow the new address <> current address in 'Customers' tables for a particular record id
THEN SQL WILL ALWAYS insert a record in the 'AddressChangeLog' table to track the new record change. Else if new address == current 
address somehow, no change happens in the 'Customers' tables and therefore no updates are made to the 'AddressChangeLog' tracking 
table.
*
	IF NEW.address_street != OLD.address_street THEN
		INSERT INTO AddressChangeLog (customer_id, old_address, new_address, change_time)
        VALUES (OLD.customer_id, OLD.address_street, NEW.address_street, CURRENT_TIMESTAMP);
	END IF;
*/


/* 4) Component 4: Database Views - 10% */
-- Create a view named CustomerOrderDetailView that joins Customers, Orders, and OrderDetails.
-- Include columns: customer_id, first_name, last_name, order_id, product_id, quantity, unit_price.

CREATE VIEW CustomerOrderDetailView AS
SELECT c.customer_id, first_name, last_name, o.order_id, product_id, quantity, unit_price
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id;

SELECT first_name, last_name, order_id
FROM CustomerOrderDetailView 
WHERE last_name = 'Jone';


/* 5) Component 5: Advanced SQL Queries - 10% */
-- a) Write a query to find the top 3 customers with the highest total spending.
SELECT first_name, last_name, SUM(quantity * unit_price) AS total_amnt_ordered
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
GROUP BY first_name, last_name
ORDER BY total_amnt_ordered DESC
LIMIT 3;
/*
- Because the columns we need for this query are scattered across the DB, we 1st need to inner join all  the necessary tables 
that'll give us the result set we're looking for. In this case, the Customers, OrderDetails, and OrderDetails tables.
- Then we need SQL to calculate 'total_amnt_ordered' (quantity * unit_price) and make part of the dataset.
- Because some customers like Willi placed multiple orders, we must use the 'SUM()' aggregate function to add the total ordered 
by each customer, so that we can then later group the the totals for each customer by the non-aggregate columns 
(first_name, last_name).
- Then we sort the data by 'total_amnt_ordered' so that we can get an incremental result set based on the 'total_amnt_ordered' only
and also in a descending order so that results are listed from greatest to lowest order.
- Finally, we use the LIMIT clause to limit the result set to only 3 rows as specified.*/

-- b) Write a query to find the most popular product category.
-- generates the correct result
SELECT category, COUNT(o.order_id) AS orders_total_qty
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
GROUP BY category
ORDER BY orders_total_qty DESC
LIMIT 1;
-- generates same result as above but it's much more precise because it relies on the OrderDetails table rather than the Orders table
SELECT category, COUNT(od.order_detail_id) AS orders_qty_total
FROM  OrderDetails od 
JOIN Products p ON od.product_id = p.product_id
GROUP BY category
ORDER BY orders_qty_total DESC
LIMIT 1;
/*
- First realize that by 'most popular product category', the question means the category with the most orders or 'order details'
to be precise.
-  Because the columns we need for this query are scattered across the DB, we 1st need to inner join all the necessary tables 
that'll give us the result set we're looking for. In this case, the OrderDetails, and Products tables.
- Then we use the COUNT() aggregate function to count ALL the order detail ids so that we can group them by 'category'
- Once the the total count is grouped by the category, then we sort the data by 'orders_qty_total' so that we can get an 
incremental result set based on the 'orders_qty_total' only and also in a descending order so that results are listed from 
greatest to lowest order.
- Finally, we use the LIMIT clause to limit the result set to only 1 row to display the category with the max number of total orders.
*/


/*Component 6: Trigger Management - 15% */
-- A) Create a trigger on Products that updates a ProductAudit table whenever a product's price is changed.
-- #
CREATE TABLE IF NOT EXISTS ProductAudit (
	product_audit_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    old_price DECIMAL(10,2),
	new_price DECIMAL(10,2),
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 
-- First create the table (ProductAudit) that will be tracking the changes that are made in the Products table 

-- #
ALTER TABLE ProductAudit
ADD CONSTRAINT fk_productAudit_products
FOREIGN KEY (product_id)
REFERENCES products (product_id);
-- Second, designate column 'product_id' as the FK constraint in your child table (ProductAudit) that references the PK 
-- column 'product_id' in your parent table (Products) in order to establish the relationship between the new and existing tables.

-- #
DELIMITER $$
CREATE TRIGGER trg_after_update_products
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN

	IF NEW.price <> OLD.price THEN
		INSERT INTO ProductAudit (product_id, old_price, new_price, change_time)
        VALUES (OLD.product_id, OLD.price, NEW.price, CURRENT_TIMESTAMP);
	END IF;
    
END$$
DELIMITER ;
-- Third, create the trigger in the Products table that when you make a change in the price of a product id in the Products table,
-- it'll automatically track that price change in the ProductAudit by inserting a record of the old and now the new price.
-- this is perfect to keep your inventory up-to-date

-- #
UPDATE Products
SET price = 1.00
WHERE product_id = 1;
-- Fourth, test your trigger.

-- B) Modify this trigger to ALSO log changes in the product's category.
-- #
ALTER TABLE ProductAudit
ADD old_category VARCHAR(255),
ADD new_category VARCHAR(255);
-- Fifth, alter the structure of the 'ProductAudit' tracking table to now include both of the 'category' state columns (old, new)
-- Note, there is no need to alter the Fk-PK relationship in this case, bc it it not relevant to the addition of the 2 columns.

-- #
DROP TRIGGER IF EXISTS trg_after_update_products;
-- Sixth, since MySQL does not have the capability to edit/modify a trigger, you have ta drop the existing in order to modify it
-- and since we're adding (NEW.category <> OLD.category" we have to drop the existing trigger and re-create it w/the new change.

-- #
DELIMITER $$
CREATE TRIGGER trg_after_update_products
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN

	IF NEW.price <> OLD.price OR NEW.category <> OLD.category THEN
		INSERT INTO ProductAudit (product_id, old_price, new_price, old_category, new_category, change_time)
        VALUES (OLD.product_id, OLD.price, NEW.price, OLD.category, NEW.category, CURRENT_TIMESTAMP);
	END IF;
    
END$$
DELIMITER ;
-- Seventh, re-create your previous AFTER UPDATE trigger on Products table as follows where:
-- a) you add the condition "NEW.category <> OLD.category" as part of an "OR" expression.
-- b) you now are also inserting data in to 2 new columns (old_category, new_category,) in the 'ProductAudit' table...
-- c) ...which are automatically being updated by the 'OLD.category' and 'NEW.category' values from the Products table.

-- #
UPDATE Products
SET price = 1.00,
	category = 'my_Category'
WHERE product_id = 1;
-- Eight, run a test update on the 'Products' table

-- #
SELECT * 
FROM ProductAudit;
-- Ninth, verify that the tracking table 'ProductAudit' was properly updated as a result of the update on the  Products' table.

-- C) Write an SQL statement to delete this trigger.
-- #
DROP TRIGGER IF EXISTS trg_after_update_products;
-- Tenth, drops the trigger as required.

/* Component 7: Database Views Management - 20% */
/* A)  Create a view 'BusinessScenarioView' combining Customers, Orders, and Products.*/
-- #
SELECT 
	c.customer_id,
    o.order_id,
    p.product_id
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;
-- First, create the query that combines all 3 tables
 
-- #
CREATE VIEW BusinessScenarioView AS
SELECT 
    c.customer_id,
    o.order_id,
    p.product_id
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;
-- Second, explicitly list all the attributes in the dataset, and then wrap the query within the CREATE VIEW.
  
-- #
SELECT * 
FROM BusinessScenarioView;
-- Third, run the view to verify that its result set matches the same result set as that in the query of the 1st step above.
  
/* B) Modify BusinessScenarioView to include 'order_date' and email. */
CREATE OR REPLACE VIEW BusinessScenarioView AS
SELECT 
    c.customer_id,
    o.order_id,
    p.product_id,
    c.email,
    o.order_date
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;
-- First, modify the query to include 2 additional columns (c.email, o.order_date)

-- #
SELECT * 
FROM BusinessScenarioView;
-- Second, run the view to verify that its result set matches the same result set as that in the query of the 1st step above.

-- #
/* C) Write an SQL statement to delete BusinessScenarioView. */
DROP VIEW IF EXISTS BusinessScenarioView;
-- SQL statement to drop iew

-- #
SELECT * 
FROM BusinessScenarioView;
-- OR
SHOW FULL TABLES WHERE table_type = 'VIEW';
-- Third, run the view to verify that it has been succesfully removed
/* RATIONALE FOR DELETION:
- The trigger 'trg_after_update_products' is being deleted because it is no longer needed in its current form, as the business 
  requirements for tracking product price and category changes have been fulfilled and the trigger may cause unnecessary 
  overhead on the Products table for every UPDATE operation.*/

