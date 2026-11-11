
# Concurrency Control

## 1. Introduction

Concurrency occurs when multiple users access or modify a database at the same time.

In the ATIDADE ÀṢ Fashion Store, concurrency control is important because multiple customers may attempt to purchase the same product variant simultaneously.

For example, if only one black T-shirt in size Medium is available, two customers might attempt to purchase it at the same time. Without proper database control, this could result in overselling.

## 2. Concurrency Problems in Inventory Management

A concurrency problem can occur when multiple transactions attempt to modify the same inventory record.

For the fashion store, this could lead to:

- Two customers purchasing the same last available item.
- Incorrect inventory quantities.
- Orders being accepted when products are no longer available.
- Inconsistent stock records.

## 3. Row-Level Locking

PostgreSQL supports row-level locking through the `SELECT FOR UPDATE` statement.

This allows a transaction to request a lock on a specific database row while it performs an operation.

The following query was executed on the inventory table:

```sql
BEGIN;

SELECT variant_id, quantity_on_hand
FROM inventory
WHERE variant_id = '30000000-0000-0000-0000-000000000001'
FOR UPDATE;

COMMIT;
```

**Practical result:** The query executed successfully and returned the selected inventory record with a quantity of 20.

This demonstrates the use of PostgreSQL's row-level locking mechanism.

## 4. Atomic Conditional UPDATE

An atomic conditional update allows a database operation to be performed as a single statement, subject to a condition.

The following query was used to reduce inventory only when at least one unit was available:

```sql
UPDATE inventory
SET quantity_on_hand = quantity_on_hand - 1
WHERE variant_id = '30000000-0000-0000-0000-000000000001'
AND quantity_on_hand >= 1
RETURNING variant_id, quantity_on_hand;
```

**Practical result:** The query successfully reduced the inventory quantity from 20 to 19. The original quantity was subsequently restored to 20.

The condition `quantity_on_hand >= 1` prevents the update from reducing the stock below zero.

## 5. Importance of Concurrency Control

Concurrency control helps the ATIDADE ÀṢ Fashion Store to:

- Prevent inventory quantities from becoming negative.
- Maintain accurate stock records.
- Protect database records during concurrent operations.
- Reduce the risk of overselling.
- Improve the reliability of order processing.

## 6. Conclusion

Concurrency control is important for maintaining database consistency when multiple users access the system simultaneously.

PostgreSQL provides mechanisms such as row-level locking and conditional updates to help protect inventory records and support reliable order processing.
