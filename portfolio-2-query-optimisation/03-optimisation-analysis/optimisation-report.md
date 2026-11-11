
# Query Optimisation Analysis

## 1. Introduction

Query optimisation involves improving the efficiency of SQL queries by examining execution plans and using appropriate database indexes.

## 2. Execution Plan Analysis

The product, category and variant query was examined using EXPLAIN ANALYZE.

PostgreSQL used Hash Join operations to combine related tables. Sequential Scan operations were also observed.

These scans were reasonable because the database contained a relatively small number of sample records.

## 3. Index Usage Analysis

A second test examined the retrieval of a product variant using its SKU.

The EXPLAIN ANALYZE result showed:

- Index Scan operation.
- Index used: idx_product_variants_sku.
- Planning time: 0.548 ms.
- Execution time: 0.100 ms.

This demonstrated that PostgreSQL used the unique SKU index to locate the requested product variant.

## 4. Comparison and Findings

The join query used Hash Join and Sequential Scan operations, while the SKU lookup used an Index Scan.

This demonstrates that PostgreSQL selects execution strategies based on the query structure, available indexes and database statistics.

Indexes can improve retrieval performance, particularly when searching for specific records in larger tables. However, indexes also require storage and can add overhead to INSERT, UPDATE and DELETE operations.

## 5. Conclusion

The tests demonstrated the use of execution plans to examine query processing and the role of indexes in improving data retrieval.

The findings provide a foundation for making informed database optimisation decisions as the fashion store database grows.
