-- PORTFOLIO 3: TRANSACTIONS AND CONCURRENCY

-- TEST 1: ROLLBACK
-- Demonstrate how a transaction can be reversed.

BEGIN;

UPDATE inventory
SET quantity_on_hand = quantity_on_hand - 1
WHERE variant_id = '30000000-0000-0000-0000-000000000001';

-- Check the temporary change
SELECT variant_id, quantity_on_hand
FROM inventory
WHERE variant_id = '30000000-0000-0000-0000-000000000001';

-- Cancel the transaction
ROLLBACK;

-- Verify that the original stock quantity is restored
SELECT variant_id, quantity_on_hand
FROM inventory
WHERE variant_id = '30000000-0000-0000-0000-000000000001';

-- =====================================================
-- TEST 2: COMMIT
-- Demonstrate how a transaction permanently saves changes.
-- =====================================================

BEGIN;

UPDATE inventory
SET quantity_on_hand = quantity_on_hand + 1
WHERE variant_id = '30000000-0000-0000-0000-000000000001';

COMMIT;

-- Verify that the change was saved
SELECT variant_id, quantity_on_hand
FROM inventory
WHERE variant_id = '30000000-0000-0000-0000-000000000001';

-- =====================================================
-- TEST 3: TRANSACTION ISOLATION
-- Demonstrate the READ COMMITTED isolation level.
-- =====================================================

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT
    variant_id,
    quantity_on_hand
FROM inventory
WHERE variant_id = '30000000-0000-0000-0000-000000000001';

COMMIT;


-- =====================================================
-- TEST 4: ROW-LEVEL LOCKING
-- Demonstrate how PostgreSQL locks a selected row
-- during a transaction.
-- =====================================================

BEGIN;

SELECT
    variant_id,
    quantity_on_hand
FROM inventory
WHERE variant_id = '30000000-0000-0000-0000-000000000001'
FOR UPDATE;

COMMIT;


-- =====================================================
-- TEST 5: ATOMIC CONDITIONAL UPDATE
-- Reduce stock only when at least one unit is available.
-- This helps prevent inventory from becoming negative.
-- =====================================================

UPDATE inventory
SET quantity_on_hand = quantity_on_hand - 1
WHERE variant_id = '30000000-0000-0000-0000-000000000001'
AND quantity_on_hand >= 1
RETURNING variant_id, quantity_on_hand;
