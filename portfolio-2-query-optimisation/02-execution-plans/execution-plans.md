
# Query Execution Plan Analysis

## 1. Introduction

Query execution plans show how PostgreSQL processes SQL queries and retrieves data from database tables.

The EXPLAIN ANALYZE command was used to examine the execution of a query that joins the products, categories and product_variants tables.

## 2. Query Analysed

The query retrieved product names, category names, SKUs, sizes, colours and variant prices by joining three related tables.

The EXPLAIN ANALYZE command was placed before the SELECT statement to obtain the actual execution plan.

## 3. Execution Plan Observations

The execution plan showed the following operations:

### Hash Join

PostgreSQL used Hash Join operations to combine records from the related tables.

Hash joins allow PostgreSQL to match records using the join conditions between tables.

### Sequential Scan

The execution plan showed Sequential Scan operations on tables including categories and product_variants.

A sequential scan reads records from a table rather than retrieving them through an index.

This was reasonable for the current test database because it contains a small amount of sample data.

### Actual Execution Time

The execution plan displayed actual execution times for the operations.

The visible operations completed in fractions of a millisecond, showing that the query executed quickly with the current dataset.

## 4. Interpretation

The execution plan demonstrates that PostgreSQL selected hash joins to combine related records and sequential scans to read table data.

The use of sequential scans does not automatically indicate poor performance. For small tables, scanning the records directly can be more efficient than using an index.

As the database grows, query performance and index usage should be evaluated with larger datasets.

## 5. Conclusion

The EXPLAIN ANALYZE command provided insight into how PostgreSQL executed the query.

The execution plan demonstrated the use of Hash Join and Sequential Scan operations.

This analysis provides a foundation for evaluating query performance and identifying possible optimisation opportunities.
