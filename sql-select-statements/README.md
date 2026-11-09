# SQL Select Statements

## Project Overview

This repository contains 36 SQL files developed through SQL practice exercises and Skills-Based Assessments (SBAs). The collection demonstrates practical experience querying relational databases, retrieving and filtering records, joining related tables, performing calculations, and generating summarized results.

The repository covers two collections of work:

- **SQL Practice Exercises (23 files):** Foundational and intermediate SQL querying techniques, including data retrieval, filtering, sorting, joins, aggregation, subqueries, and conditional logic.
- **SQL Skills-Based Assessments (13 files):** A College Management System database schema/setup script and 12 assessment exercises involving relational database structures, student enrollments, faculty assignments, and academic performance reporting.

All SQL files are maintained directly within this repository.

## SQL Concepts and Techniques

The exercises demonstrate the following SQL concepts and techniques:

**Data Retrieval and Filtering**
- `SELECT`, `FROM`, and `WHERE`
- Comparison operators
- `AND`, `OR`, and `NOT`
- `DISTINCT`
- `IS NULL` and `IS NOT NULL`
- Filtering records using multiple conditions and calculated expressions

**Relational Joins**
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- Multiple-table joins
- Conditional joins
- Primary and foreign key relationships
- One-to-many and many-to-many relationships
- Junction tables and identifying missing related records

**Aggregate Functions and Grouping**
- `COUNT()` and `COUNT(DISTINCT)`
- `SUM()`
- `AVG()`
- `MIN()` and `MAX()`
- `GROUP BY`
- `HAVING`
- Aggregate filtering and grouped calculations

**Sorting and Result Management**
- `ORDER BY`
- Ascending and descending sorting
- Multiple-column sorting
- Tie-breaking criteria
- `LIMIT`
- `OFFSET`

**Conditional Logic and SQL Functions**
- `CASE`, `WHEN`, `THEN`, and `ELSE`
- `CONCAT()`
- `UPPER()`
- `LENGTH()`
- `YEAR()` and `MONTH()`
- `ROUND()` and `FLOOR()`
- Arithmetic expressions and modulo operations

**Subqueries and Query Construction**
- Nested queries
- Derived tables
- Aggregate calculations
- Conditional filtering of aggregate results
- Combining joins, calculations, grouping, and sorting

## Database Structure and Relationships

The Skills-Based Assessments use a College Management System relational database consisting of six interconnected tables:

- **Department:** Academic department information.
- **Course:** Courses associated with departments.
- **Faculty:** Faculty member information and department assignments.
- **FacultyCourse:** Junction table connecting faculty members to assigned courses.
- **Student:** Student information and declared majors.
- **StudentCourse:** Junction table connecting students to courses, including enrollment dates and progress.

The database structure uses primary and foreign keys to establish relationships between records and support queries across multiple tables.

## Tools and Environment

- SQL: MySQL-compatible SQL syntax
- Database Client: HeidiSQL
- Assessment Platform: HackerRank
- Database: College Management System relational database

Queries were developed, tested, and refined against the relevant database structures and sample records.

## Practical Applications

The SQL skills demonstrated in this repository are applicable to several areas of IT and business systems support:

- **Application Support:** Investigating application data, tracing related records, and troubleshooting data discrepancies.
- **ERP Support:** Retrieving and analyzing business records across interconnected database tables.
- **Data Analysis:** Filtering, aggregating, grouping, and interpreting structured datasets.
- **Reporting and Business Intelligence:** Producing summarized results, performance metrics, and operational reports.
- **Data Quality and Validation:** Identifying duplicate records, missing relationships, and inconsistencies across related tables.

The exercises emphasize understanding relational database structures and translating practical business and reporting requirements into meaningful SQL queries.

## Related Project

Database administration and management topics—including indexes, constraints, triggers, views, and auditing—are covered separately in the **Advanced Database Management** project.