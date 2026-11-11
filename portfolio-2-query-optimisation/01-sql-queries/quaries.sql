
-- =====================================================
-- PORTFOLIO 2: QUERY PROCESSING AND OPTIMISATION
-- ATIDADE ÀṢỌ FASHION STORE MANAGEMENT SYSTEM
-- =====================================================

-- QUERY 1: Retrieve all active products
SELECT
    product_id,
    product_name,
    base_price,
    product_status
FROM products
WHERE product_status = 'active'
ORDER BY product_name;


-- QUERY 2: Retrieve products with their categories and variants
SELECT
    p.product_name,
    c.category_name,
    pv.sku,
    pv.size,
    pv.colour,
    pv.variant_price
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN product_variants pv
    ON p.product_id = pv.product_id;


-- QUERY 3: Calculate total orders and revenue
SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.subtotal) AS total_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status IN ('confirmed', 'processing', 'completed');


-- QUERY 4: Identify best-selling products
-- QUERY 4: Identify best-selling products
SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.subtotal) AS total_revenue
FROM products p
JOIN product_variants pv
    ON p.product_id = pv.product_id
JOIN order_items oi
    ON pv.variant_id = oi.variant_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status IN ('confirmed', 'processing', 'completed')
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC;


-- QUERY 5: Retrieve complete customer order information
SELECT
    c.first_name,
    c.last_name,
    o.order_reference,
    o.sales_channel,
    o.order_status,
    p.product_name,
    pv.size,
    pv.colour,
    oi.quantity,
    oi.unit_price,
    oi.subtotal
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN product_variants pv
    ON oi.variant_id = pv.variant_id
JOIN products p
    ON pv.product_id = p.product_id
ORDER BY o.created_at DESC;

-- QUERY 6: Examine query execution plan
EXPLAIN ANALYZE
SELECT
    p.product_name,
    c.category_name,
    pv.sku,
    pv.size,
    pv.colour,
    pv.variant_price
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN product_variants pv
    ON p.product_id = pv.product_id;

    -- QUERY 7: Examine index usage for product SKU lookup
EXPLAIN ANALYZE
SELECT
    variant_id,
    product_id,
    sku,
    size,
    colour,
    variant_price
FROM product_variants
WHERE sku = 'AT-TSH-BLK-M';
