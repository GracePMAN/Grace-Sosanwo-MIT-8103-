-- =====================================================
-- ATIDADE ÀṢỌ FASHION STORE MANAGEMENT SYSTEM
-- Portfolio 1: Database Design and SQL Implementation
-- Database: PostgreSQL
-- =====================================================

-- Enable UUID generation
CREATE EXTENSION IF NOT EXISTS pgcrypto;


-- =====================================================
-- 1. USER ROLES
-- =====================================================

CREATE TABLE user_roles (
    role_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


-- =====================================================
-- 2. CATEGORIES
-- =====================================================

CREATE TABLE categories (
    category_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


-- =====================================================
-- 3. COLLECTIONS
-- =====================================================

CREATE TABLE collections (
    collection_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    collection_name VARCHAR(150) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


-- =====================================================
-- 4. PRODUCTS
-- =====================================================

CREATE TABLE products (
    product_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_id UUID NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    description TEXT,
    base_price NUMERIC(12,2) NOT NULL CHECK (base_price >= 0),
    product_status VARCHAR(30) NOT NULL DEFAULT 'active',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);
-- 5. PRODUCT COLLECTIONS
CREATE TABLE product_collections (
    product_id UUID NOT NULL,
    collection_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (product_id, collection_id),
    CONSTRAINT fk_product_collections_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),
    CONSTRAINT fk_product_collections_collection
        FOREIGN KEY (collection_id)
        REFERENCES collections(collection_id)
);

-- 6. PRODUCT IMAGES
CREATE TABLE products_images (
    image_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID NOT NULL,
    image_url TEXT NOT NULL,
    alt_txt VARCHAR(255),
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_products_images_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- 7. PRODUCT VARIANTS
CREATE TABLE product_variants (
    variant_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID NOT NULL,
    sku VARCHAR(100) NOT NULL UNIQUE,
    size VARCHAR(30),
    colour VARCHAR(50),
    fit VARCHAR(50),
    variant_price NUMERIC(12,2) NOT NULL CHECK (variant_price >= 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_product_variants_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- 8. CUSTOMERS
CREATE TABLE customers (
    customer_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    account_status VARCHAR(30) NOT NULL DEFAULT 'active',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 9. CUSTOMER ADDRESSES
CREATE TABLE customers_addresses (
    address_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID NOT NULL,
    recipient_name VARCHAR(150) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    address_line VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_customers_addresses_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- 10. STAFF
CREATE TABLE staff (
    staff_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    role_id UUID NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    account_status VARCHAR(30) NOT NULL DEFAULT 'active',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_staff_role
        FOREIGN KEY (role_id)
        REFERENCES user_roles(role_id)
);

-- 11. ORDERS
CREATE TABLE orders (
    order_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID NOT NULL,
    address_id UUID,
    staff_id UUID,
    order_reference VARCHAR(100) NOT NULL UNIQUE,
    sales_channel VARCHAR(30) NOT NULL,
    order_status VARCHAR(30) NOT NULL DEFAULT 'pending',
    total_amount NUMERIC(12,2) NOT NULL CHECK (total_amount >= 0),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    CONSTRAINT fk_orders_address
        FOREIGN KEY (address_id)
        REFERENCES customers_addresses(address_id),
    CONSTRAINT fk_orders_staff
        FOREIGN KEY (staff_id)
        REFERENCES staff(staff_id)
);

-- 12. ORDER ITEMS
CREATE TABLE order_items (
    order_item_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id UUID NOT NULL,
    variant_id UUID NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
    subtotal NUMERIC(12,2) NOT NULL,
    CONSTRAINT chk_order_item_subtotal
        CHECK (subtotal = quantity * unit_price),
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_order_items_variant
        FOREIGN KEY (variant_id)
        REFERENCES product_variants(variant_id)
);

-- 13. INVENTORY
CREATE TABLE inventory (
    inventory_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    variant_id UUID NOT NULL UNIQUE,
    quantity_on_hand INTEGER NOT NULL DEFAULT 0
        CHECK (quantity_on_hand >= 0),
    reorder_level INTEGER NOT NULL DEFAULT 3
        CHECK (reorder_level >= 0),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_inventory_variant
        FOREIGN KEY (variant_id)
        REFERENCES product_variants(variant_id)
);

-- 14. PAYMENTS
CREATE TABLE payments (
    payment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id UUID NOT NULL,
    payment_reference VARCHAR(150) NOT NULL UNIQUE,
    payment_method VARCHAR(50) NOT NULL,
    amount NUMERIC(12,2) NOT NULL CHECK (amount >= 0),
    payment_status VARCHAR(30) NOT NULL DEFAULT 'pending',
    provider_transaction_id VARCHAR(150) UNIQUE,
    paid_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_payments_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- 15. STOCK MOVEMENTS
CREATE TABLE stock_movements (
    movement_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    variant_id UUID NOT NULL,
    staff_id UUID,
    movement_type VARCHAR(50) NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    reference_id UUID,
    notes TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_stock_movements_variant
        FOREIGN KEY (variant_id)
        REFERENCES product_variants(variant_id),
    CONSTRAINT fk_stock_movements_staff
        FOREIGN KEY (staff_id)
        REFERENCES staff(staff_id)
);

-- 16. STOCK RESERVATIONS
CREATE TABLE stock_reservations (
    reservation_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    order_id UUID NOT NULL,
    variant_id UUID NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    reservation_status VARCHAR(30) NOT NULL DEFAULT 'active',
    expires_at TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_stock_reservations_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_stock_reservations_variant
        FOREIGN KEY (variant_id)
        REFERENCES product_variants(variant_id)
);

-- 17. PRODUCT REVIEWS
CREATE TABLE product_reviews (
    review_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    customer_id UUID NOT NULL,
    product_id UUID NOT NULL,
    rating SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_comment TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_product_reviews_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    CONSTRAINT fk_product_reviews_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- =====================================================
-- ADDITIONAL DATA INTEGRITY CONSTRAINTS
-- =====================================================

-- Restrict product status to valid values
ALTER TABLE products
ADD CONSTRAINT chk_products_status
CHECK (product_status IN ('active', 'inactive', 'archived'));

-- Restrict customer account status
ALTER TABLE customers
ADD CONSTRAINT chk_customers_status
CHECK (account_status IN ('active', 'inactive', 'suspended'));

-- Restrict staff account status
ALTER TABLE staff
ADD CONSTRAINT chk_staff_status
CHECK (account_status IN ('active', 'inactive', 'suspended'));

-- Restrict sales channels
ALTER TABLE orders
ADD CONSTRAINT chk_orders_sales_channel
CHECK (sales_channel IN ('website', 'whatsapp', 'instagram'));

-- Restrict order status
ALTER TABLE orders
ADD CONSTRAINT chk_orders_status
CHECK (order_status IN ('pending', 'confirmed', 'processing', 'completed', 'cancelled'));

-- Restrict payment status
ALTER TABLE payments
ADD CONSTRAINT chk_payments_status
CHECK (payment_status IN ('pending', 'successful', 'failed', 'refunded'));

-- Restrict stock reservation status
ALTER TABLE stock_reservations
ADD CONSTRAINT chk_reservations_status
CHECK (reservation_status IN ('active', 'converted', 'expired', 'cancelled'));

-- Restrict stock movement types
ALTER TABLE stock_movements
ADD CONSTRAINT chk_stock_movement_type
CHECK (movement_type IN ('stock_in', 'stock_out', 'sale', 'reservation', 'adjustment', 'return'));

-- =====================================================
-- DATABASE INDEXES
-- =====================================================

-- Product search and filtering
CREATE INDEX idx_products_category
ON products(category_id);

CREATE INDEX idx_products_status
ON products(product_status);

CREATE INDEX idx_product_variants_product
ON product_variants(product_id);

CREATE INDEX idx_product_variants_sku
ON product_variants(sku);

-- Customer lookup
CREATE INDEX idx_customers_email
ON customers(email);

CREATE INDEX idx_customers_addresses_customer
ON customers_addresses(customer_id);

-- Order lookup and reporting
CREATE INDEX idx_orders_customer
ON orders(customer_id);

CREATE INDEX idx_orders_status
ON orders(order_status);

CREATE INDEX idx_orders_created_at
ON orders(created_at);

CREATE INDEX idx_order_items_order
ON order_items(order_id);

CREATE INDEX idx_order_items_variant
ON order_items(variant_id);

-- Inventory and stock management
CREATE INDEX idx_stock_movements_variant
ON stock_movements(variant_id);

CREATE INDEX idx_stock_reservations_order
ON stock_reservations(order_id);

CREATE INDEX idx_stock_reservations_expiry
ON stock_reservations(expires_at);

-- Payment lookup
CREATE INDEX idx_payments_order
ON payments(order_id);

CREATE INDEX idx_payments_status
ON payments(payment_status);

-- Product reviews
CREATE INDEX idx_product_reviews_product
ON product_reviews(product_id);

