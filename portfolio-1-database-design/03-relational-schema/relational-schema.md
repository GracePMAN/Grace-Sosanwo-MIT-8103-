# ATIDADE ÀṢỌ Fashion Store Management System
## Relational Schema

### 1. Categories

**Table Name:** `categories`

| Column | Data Type | Constraints |
|---|---|---|
| category_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| category_name | VARCHAR(100) | NOT NULL, UNIQUE |
| description | TEXT | NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 2. Collections

**Table Name:** `collections`

| Column | Data Type | Constraints |
|---|---|---|
| collection_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| collection_name | VARCHAR(150) | NOT NULL, UNIQUE |
| description | TEXT | NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 3. Products

**Table Name:** `products`

| Column | Data Type | Constraints |
|---|---|---|
| product_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| category_id | UUID | Foreign Key REFERENCES categories(category_id), NOT NULL |
| product_name | VARCHAR(150) | NOT NULL |
| description | TEXT | NULL |
| base_price | NUMERIC(12,2) | NOT NULL, CHECK (base_price >= 0) |
| product_status | VARCHAR(30) | NOT NULL, DEFAULT 'active' |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 4. Product Collections

**Table Name:** `product_collections`

| Column | Data Type | Constraints |
|---|---|---|
| product_id | UUID | Primary Key, Foreign Key REFERENCES products(product_id), NOT NULL |
| collection_id | UUID | Primary Key, Foreign Key REFERENCES collections(collection_id), NOT NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

**Note:** This table uses a composite primary key (`product_id`, `collection_id`) to prevent duplicate product-to-collection assignments.

### 5. Product Images

**Table Name:** `products_images`

| Column | Data Type | Constraints |
|---|---|---|
| image_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| product_id | UUID | Foreign Key REFERENCES products(product_id), NOT NULL |
| image_url | TEXT | NOT NULL |
| alt_txt | VARCHAR(255) | NULL |
| is_primary | BOOLEAN | NOT NULL, DEFAULT FALSE |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 6. Product Variants

**Table Name:** `product_variants`

| Column | Data Type | Constraints |
|---|---|---|
| variant_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| product_id | UUID | Foreign Key REFERENCES products(product_id), NOT NULL |
| sku | VARCHAR(100) | NOT NULL, UNIQUE |
| size | VARCHAR(30) | NULL |
| colour | VARCHAR(50) | NULL |
| fit | VARCHAR(50) | NULL |
| variant_price | NUMERIC(12,2) | NOT NULL, CHECK (variant_price >= 0) |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 7. Customers

**Table Name:** `customers`

| Column | Data Type | Constraints |
|---|---|---|
| customer_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| first_name | VARCHAR(100) | NOT NULL |
| last_name | VARCHAR(100) | NOT NULL |
| email | VARCHAR(255) | NULL, UNIQUE |
| account_status | VARCHAR(30) | NOT NULL, DEFAULT 'active' |
| phone_number | VARCHAR(20) | NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 8. Customer Addresses

**Table Name:** `customers_addresses`

| Column | Data Type | Constraints |
|---|---|---|
| address_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| customer_id | UUID | Foreign Key REFERENCES customers(customer_id), NOT NULL |
| recipient_name | VARCHAR(150) | NOT NULL |
| phone_number | VARCHAR(20) | NOT NULL |
| address_line | VARCHAR(255) | NOT NULL |
| city | VARCHAR(100) | NOT NULL |
| state | VARCHAR(100) | NOT NULL |
| country | VARCHAR(100) | NOT NULL |
| is_default | BOOLEAN | NOT NULL, DEFAULT FALSE |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 9. Orders

**Table Name:** `orders`

| Column | Data Type | Constraints |
|---|---|---|
| order_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| customer_id | UUID | Foreign Key REFERENCES customers(customer_id), NOT NULL |
| address_id | UUID | Foreign Key REFERENCES customers_addresses(address_id), NULL |
| staff_id | UUID | Foreign Key REFERENCES staff(staff_id), NULL |
| order_reference | VARCHAR(100) | NOT NULL, UNIQUE |
| sales_channel | VARCHAR(30) | NOT NULL |
| order_status | VARCHAR(30) | NOT NULL, DEFAULT 'pending' |
| total_amount | NUMERIC(12,2) | NOT NULL, CHECK (total_amount >= 0) |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 10. Order Items

**Table Name:** `order_items`

| Column | Data Type | Constraints |
|---|---|---|
| order_item_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| order_id | UUID | Foreign Key REFERENCES orders(order_id), NOT NULL |
| variant_id | UUID | Foreign Key REFERENCES product_variants(variant_id), NOT NULL |
| quantity | INTEGER | NOT NULL, CHECK (quantity > 0) |
| unit_price | NUMERIC(12,2) | NOT NULL, CHECK (unit_price >= 0) |
| subtotal | NUMERIC(12,2) | NOT NULL, CHECK (subtotal >= 0) |

### 11. Inventory

**Table Name:** `inventory`

| Column | Data Type | Constraints |
|---|---|---|
| inventory_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| variant_id | UUID | Foreign Key REFERENCES product_variants(variant_id), NOT NULL, UNIQUE |
| quantity_on_hand | INTEGER | NOT NULL, DEFAULT 0, CHECK (quantity_on_hand >= 0) |
| reorder_level | INTEGER | NOT NULL, DEFAULT 3, CHECK (reorder_level >= 0) |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 12. Payments

**Table Name:** `payments`

| Column | Data Type | Constraints |
|---|---|---|
| payment_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| order_id | UUID | Foreign Key REFERENCES orders(order_id), NOT NULL |
| payment_reference | VARCHAR(150) | NOT NULL, UNIQUE |
| payment_method | VARCHAR(50) | NOT NULL |
| amount | NUMERIC(12,2) | NOT NULL, CHECK (amount >= 0) |
| payment_status | VARCHAR(30) | NOT NULL, DEFAULT 'pending' |
| provider_transaction_id | VARCHAR(150) | NULL, UNIQUE |
| paid_at | TIMESTAMPTZ | NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 13. Stock Movements

**Table Name:** `stock_movements`

| Column | Data Type | Constraints |
|---|---|---|
| movement_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| variant_id | UUID | Foreign Key REFERENCES product_variants(variant_id), NOT NULL |
| staff_id | UUID | Foreign Key REFERENCES staff(staff_id), NULL |
| movement_type | VARCHAR(50) | NOT NULL |
| quantity | INTEGER | NOT NULL, CHECK (quantity > 0) |
| reference_id | UUID | NULL |
| notes | TEXT | NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 14. Stock Reservations

**Table Name:** `stock_reservations`

| Column | Data Type | Constraints |
|---|---|---|
| reservation_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| order_id | UUID | Foreign Key REFERENCES orders(order_id), NOT NULL |
| variant_id | UUID | Foreign Key REFERENCES product_variants(variant_id), NOT NULL |
| quantity | INTEGER | NOT NULL, CHECK (quantity > 0) |
| reservation_status | VARCHAR(30) | NOT NULL, DEFAULT 'active' |
| expires_at | TIMESTAMPTZ | NOT NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 15. Product Reviews

**Table Name:** `product_reviews`

| Column | Data Type | Constraints |
|---|---|---|
| review_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| customer_id | UUID | Foreign Key REFERENCES customers(customer_id), NOT NULL |
| product_id | UUID | Foreign Key REFERENCES products(product_id), NOT NULL |
| rating | SMALLINT | NOT NULL, CHECK (rating BETWEEN 1 AND 5) |
| review_comment | TEXT | NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 16. Staff

**Table Name:** `staff`

| Column | Data Type | Constraints |
|---|---|---|
| staff_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| role_id | UUID | Foreign Key REFERENCES user_roles(role_id), NOT NULL |
| first_name | VARCHAR(100) | NOT NULL |
| last_name | VARCHAR(100) | NOT NULL |
| email | VARCHAR(255) | NOT NULL, UNIQUE |
| phone_number | VARCHAR(20) | NULL |
| account_status | VARCHAR(30) | NOT NULL, DEFAULT 'active' |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |

### 17. User Roles

**Table Name:** `user_roles`

| Column | Data Type | Constraints |
|---|---|---|
| role_id | UUID | Primary Key, NOT NULL, DEFAULT gen_random_uuid() |
| role_name | VARCHAR(100) | NOT NULL, UNIQUE |
| description | TEXT | NULL |
| created_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |
| updated_at | TIMESTAMPTZ | NOT NULL, DEFAULT NOW() |