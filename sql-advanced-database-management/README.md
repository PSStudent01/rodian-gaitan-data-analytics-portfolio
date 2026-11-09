# Advanced SQL Database Management

## Project Overview

This project demonstrates practical SQL skills involving relational database management, database structure, data integrity, automation, auditing, and advanced querying using a MySQL e-commerce database.

The project focuses on implementing database objects and operations that support data consistency, query performance, automated record updates, historical change tracking, and reusable data access through views.

## Database Environment

**Database:** `ecommerce`

**SQL Platform:** MySQL

**Tables Used:**
- `Customers`
- `Orders`
- `OrderDetails`
- `Products`

**Project Files:**

| File | Description |
| `ecommerce.sql` | Database schema and sample dataset |
| `advanced_database_management.sql` | SQL implementations covering the seven project components |

## SQL Concepts and Implementations

### 1. Indexing and Query Performance

Created indexes to support data retrieval and query performance:

- Composite index on `Customers` (`last_name`, `registration_date`)
- Index on `Orders` (`order_date`)
- Index on `Products` (`category`)

### 2. Database Constraints and Referential Integrity

Implemented database constraints to enforce data integrity and establish relationships between tables:

- Primary key constraints across all four tables
- Foreign key relationships between customers, orders, order details, and products
- CHECK constraint on `Products.price` to prevent non-positive product prices

### 3. Database Triggers and Automation

Implemented triggers to automate database operations and maintain related records:

- **Order Total Updates:** Created an AFTER INSERT trigger on `OrderDetails` to recalculate the corresponding order total in `Orders` when a new order detail is added.
- **Customer Address Auditing:** Created an AFTER UPDATE trigger on `Customers` to record address changes in a separate `AddressChangeLog` table.
- Utilized `OLD` and `NEW` trigger references to capture previous and updated column values.
- Applied conditional logic to record changes only when the relevant values differ.

### 4. Database Views

Created a reusable view named `CustomerOrderDetailView` by joining customer, order, and order-detail records.

Selected specific columns to provide a consolidated view of customer and order information.

### 5. Advanced SQL Queries

Developed multi-table queries to analyze e-commerce transactions and customer purchasing activity:

- Identified the top three customers based on total spending using aggregate functions and sorting.
- Identified the most popular product category by counting associated order-detail records.
- Applied JOIN operations, GROUP BY, aggregate functions, ORDER BY, and LIMIT.

### 6. Trigger Management and Audit Logging

Implemented product auditing to track changes to product information:

- Created a `ProductAudit` table to maintain historical records of product changes.
- Implemented an AFTER UPDATE trigger on `Products` to capture changes to product prices.
- Extended the audit mechanism to track changes to product categories.
- Used conditional logic and `OLD` and `NEW` references to capture previous and updated values.
- Demonstrated trigger modification by dropping and recreating the trigger.
- Tested the audit functionality through UPDATE statements and verified the resulting audit records.
- Demonstrated trigger removal using DROP TRIGGER.

### 7. Database Views Management

Created and managed a reusable view named `BusinessScenarioView`:

- Combined customer, order, and product information through multi-table JOIN operations.
- Modified the view using CREATE OR REPLACE VIEW to incorporate additional columns, including customer email and order date.
- Verified the updated view contents.
- Demonstrated view removal using DROP VIEW.

## Key Skills Demonstrated

- MySQL and relational database management
- SQL querying and multi-table JOIN operations
- Database indexing and performance considerations
- Primary keys, foreign keys, and CHECK constraints
- Referential integrity and data validation
- Database triggers and automated operations
- Audit logging and historical change tracking
- Database views and view management
- Aggregate functions and advanced SQL queries
- Database schema inspection and verification

## Project Structure

```text
sql-advanced-database-management/
│
├── README.md
├── ecommerce.sql
└── advanced_database_management.sql
```

## Execution

1. Install or access a MySQL-compatible database environment.
2. Execute `ecommerce.sql` to create and populate the e-commerce database.
3. Open `advanced_database_management.sql`.
4. Execute the SQL statements against the `ecommerce` database.
5. Use the included SELECT statements and verification queries to inspect database structures, trigger activity, audit records, and view results.

**Note:** The SQL implementation includes test INSERT and UPDATE statements, as well as DROP statements demonstrating trigger and view removal. Execute against a test database rather than a production environment.

---

*This project was developed as part of practical software engineering and database training, applying SQL concepts to an e-commerce database scenario.*