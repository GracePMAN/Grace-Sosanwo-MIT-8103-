
# Transactions and Concurrency Report

## 1. Introduction

Database transactions ensure that operations are completed reliably while maintaining data consistency.

This practical exercise used the ATIDADE ÀṢ Fashion Store database to demonstrate transaction management and concurrency control using PostgreSQL.

## 2. COMMIT Demonstration

The COMMIT command was used to permanently save a database change.

An inventory transaction was started, and the stock quantity was increased by one. COMMIT was executed to save the change.

The inventory record was queried afterwards to verify the updated quantity.

**Result:** The transaction was successfully committed.

**Evidence:** `01-commit-test.png` (use the actual filename in your evidence folder).

## 3. ROLLBACK Demonstration

The ROLLBACK command was used to cancel a database transaction.

An inventory transaction was started, and the stock quantity was temporarily reduced by one. ROLLBACK was then executed.

The inventory record was queried again and confirmed that the original quantity of 20 had been restored.

**Result:** The transaction was successfully rolled back.

**Evidence:** `01-rollback-test.png`

## 4. Transaction Isolation

The READ COMMITTED isolation level was used to execute a database transaction.

This isolation level ensures that a transaction reads only data committed before each query begins.

**Result:** The transaction was successfully executed using READ COMMITTED.

**Evidence:** `03-transaction-isolation.png`

## 5. Row-Level Locking

PostgreSQL's SELECT FOR UPDATE statement was executed against an inventory record.

The statement requests a lock on the selected row during the transaction.

**Result:** The row-locking query executed successfully and returned the inventory record.

**Evidence:** `04-row-level-locking.png`

## 6. Atomic Conditional UPDATE

An atomic conditional UPDATE was executed to reduce inventory only when the quantity was at least one.

The query returned the updated inventory quantity of 19.

The original quantity of 20 was subsequently restored.

**Result:** The conditional update executed successfully.

**Evidence:** `05-atomic-conditional-update.png`

## 7. Concurrency Control

Concurrency control is important when multiple customers attempt to purchase the same product simultaneously.

Row-level locking and atomic conditional updates help protect inventory records and prevent overselling.

## 8. Conclusion

The practical exercises demonstrated COMMIT, ROLLBACK, READ COMMITTED, row-level locking and atomic conditional updates using PostgreSQL.

These techniques help maintain database consistency, protect inventory records and support reliable transaction processing in the ATIDADE ÀṢ Fashion Store Management System.
