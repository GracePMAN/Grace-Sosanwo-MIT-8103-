# ATIDADE ÀṢỌ Fashion Store Management System
## Entity Relationship Diagram (ERD) Explanation

### 1. Introduction

The Entity Relationship Diagram (ERD) represents the database structure of the ATIDADE ÀṢỌ Fashion Store Management System. It identifies the entities, their attributes, primary keys, foreign keys and relationships.

ATIDADE ÀṢỌ is a contemporary unisex fashion store that sells T-shirts, caps and hoodies. The business operates through two sales channels:

- **Website sales:** Customers browse products, select product variants and place orders online.
- **Social media sales:** Customers place orders through channels such as WhatsApp and Instagram, while authorised staff record and manage these orders in the system.

Both sales channels use one central database to manage customers, products, orders, payments and inventory. This ensures that stock information remains consistent regardless of the sales channel.

The database is designed using a relational model, with PostgreSQL as the intended database management system.

### 2. Database Entities and Their Purposes

The ERD contains 17 entities.

| Entity | Purpose |
|---|---|
| `categories` | Stores product categories such as T-shirts, caps and hoodies. |
| `collections` | Stores product collections or themed releases. |
| `products` | Stores the main information about each fashion product. |
| `product_collections` | Connects products to collections and supports a many-to-many relationship. |
| `products_images` | Stores image references and related information for products. |
| `product_variants` | Stores individual product variations, including size, colour, fit and SKU. |
| `customers` | Stores customer account and contact information. |
| `customers_addresses` | Stores customer delivery addresses. |
| `orders` | Records customer purchases and the sales channel through which they were created. |
| `order_items` | Records the individual product variants and quantities included in each order. |
| `inventory` | Tracks the physical quantity available for each product variant. |
| `payments` | Records payment information and payment status for orders. |
| `stock_movements` | Records inventory changes, including sales, adjustments and automated movements. |
| `stock_reservations` | Records temporary stock allocations associated with orders. |
| `product_reviews` | Stores customer ratings and reviews of products. |
| `staff` | Stores information about authorised employees who manage store operations. |
| `user_roles` | Defines staff roles and their associated descriptions. |

### 3. Primary Keys and Foreign Keys

**Primary Keys (PK)** uniquely identify each record in a table. Every entity has a primary key that distinguishes one record from another.

**Foreign Keys (FK)** establish relationships between tables by referencing the primary key of another table. They help maintain referential integrity by ensuring that related records refer to existing records.

The following are the primary and foreign keys identified in the ERD.

| Entity | Primary Key | Foreign Keys |
|---|---|---|
| `categories` | `category_id` | None |
| `collections` | `collection_id` | None |
| `products` | `product_id` | `category_id` |
| `product_collections` | `product_id`, `collection_id` (composite PK) | `product_id`, `collection_id` |
| `products_images` | `image_id` | `product_id` |
| `product_variants` | `variant_id` | `product_id` |
| `customers` | `customer_id` | None |
| `customers_addresses` | `address_id` | `customer_id` |
| `orders` | `order_id` | `customer_id`, `address_id`, `staff_id` |
| `order_items` | `order_item_id` | `order_id`, `variant_id` |
| `inventory` | `inventory_id` | `variant_id` |
| `payments` | `payment_id` | `order_id` |
| `stock_movements` | `movement_id` | `variant_id`, `staff_id` |
| `stock_reservations` | `reservation_id` | `order_id`, `variant_id` |
| `product_reviews` | `review_id` | `customer_id`, `product_id` |
| `staff` | `staff_id` | `role_id` |
| `user_roles` | `role_id` | None |

The `product_collections` entity uses a composite primary key consisting of `product_id` and `collection_id`. This combination prevents the same product from being linked to the same collection more than once.

### 4. Explanation of Relationships and Cardinalities

The ERD contains 19 relationships. These relationships define how records in one entity are associated with records in another.

| No. | Parent Entity | Child Entity | Relationship | Explanation |
|---|---|---|---|---|
| 1 | `categories` | `products` | One-to-many | One category can contain many products, while each product belongs to one category. |
| 2 | `products` | `product_variants` | One-to-many | One product can have multiple variants, such as different sizes and colours. |
| 3 | `products` | `products_images` | One-to-many | One product can have multiple associated images. |
| 4 | `products` | `product_collections` | One-to-many | One product can appear in multiple collection-link records. |
| 5 | `collections` | `product_collections` | One-to-many | One collection can contain multiple product-link records. |
| 6 | `customers` | `customers_addresses` | One-to-many | One customer can save multiple delivery addresses. |
| 7 | `customers` | `orders` | One-to-many | One customer can place multiple orders. |
| 8 | `customers_addresses` | `orders` | One-to-many | One saved address can be associated with multiple orders. |
| 9 | `orders` | `order_items` | One-to-many | One order can contain multiple order items. |
| 10 | `product_variants` | `order_items` | One-to-many | One product variant can appear in multiple order items, while each order item refers to one variant. |
| 11 | `orders` | `payments` | One-to-many | One order can have multiple payment records, allowing payment attempts or retries. |
| 12 | `product_variants` | `inventory` | One-to-one | Each product variant has one corresponding inventory record. |
| 13 | `product_variants` | `stock_movements` | One-to-many | One product variant can have multiple stock movement records. |
| 14 | `product_variants` | `stock_reservations` | One-to-many | One product variant can be involved in multiple stock reservations. |
| 15 | `orders` | `stock_reservations` | One-to-many | One order can have multiple stock reservation records. |
| 16 | `user_roles` | `staff` | One-to-many | One role can be assigned to multiple staff members. |
| 17 | `customers` | `product_reviews` | One-to-many | One customer can submit multiple product reviews. |
| 18 | `products` | `product_reviews` | One-to-many | One product can receive multiple customer reviews. |
| 19 | `staff` | `stock_movements` | One-to-many (optional staff participation) | One staff member can be associated with zero or many stock movements. Each stock movement can have zero or one associated staff member. |

#### Important Relationship Explanations

**Products and Product Collections**

The relationship between `products` and `collections` is many-to-many. A product can belong to several collections, and a collection can contain several products. The `product_collections` junction table resolves this many-to-many relationship into two one-to-many relationships.

**Products and Order Items**

The relationship between `product_variants` and `order_items` ensures that an order item references the exact variant purchased rather than only the general product. This is important because customers may purchase different sizes, colours or fits of the same product.

**Inventory and Product Variants**

The relationship between `product_variants` and `inventory` is one-to-one. Each variant has its own inventory record. The `variant_id` foreign key in `inventory` will be given a UNIQUE constraint during SQL implementation to enforce this relationship.

**Staff and Stock Movements**

The relationship between `staff` and `stock_movements` allows the system to record who performed a stock operation. However, `stock_movements.staff_id` is nullable because some movements are generated automatically by the system without direct staff involvement.

### 5. How the Database Supports Business Operations

The database design supports the store's major operational processes.

**Product Management**

Products are organised into categories and collections. Product variants allow the store to manage individual sizes, colours and fits. Product images are associated with their respective products through the `products_images` entity.

**Customer and Order Management**

Customer information and delivery addresses are stored separately. When a customer places an order, the order is recorded in `orders`, while its individual products and quantities are stored in `order_items`.

**Multi-channel Sales and Shared Inventory**

The system supports both website and social media orders through the `orders` entity. The sales channel is recorded for each order. Both channels use the same inventory records, ensuring that a purchase through one channel affects the stock available to the other.

**Stock Management and Reservations**

The `inventory` entity tracks the physical quantity of each product variant. The `stock_movements` entity provides an audit trail of inventory changes.

The `stock_reservations` entity supports temporary stock allocation, particularly for social media orders awaiting payment. When an authorised staff member creates a social media order, the requested quantity is temporarily reserved for 30 minutes.

If payment is successfully verified within the permitted period, the reservation is converted into a completed sale and inventory is updated. If payment is not received within the permitted period, the order expires and the reserved stock is released.

**Payment Management**

The `payments` entity stores payment references, methods, amounts, statuses and provider transaction identifiers. Its relationship with `orders` allows payment attempts and retries to be recorded against the relevant order.

**Staff and Access Management**

The `staff` and `user_roles` entities support the management of staff accounts and their assigned responsibilities. Staff involvement in stock movements can also be tracked where applicable.

**Customer Feedback**

The `product_reviews` entity links customers to the products they review, allowing the store to maintain ratings and feedback.

### 6. Design Considerations

The ERD separates major business entities to reduce unnecessary duplication and improve data organisation.

- **Data integrity:** Primary keys and foreign keys establish valid relationships between records.
- **Reduced duplication:** Customer, product, order and inventory information is stored in separate related entities.
- **Many-to-many resolution:** The `product_collections` junction table resolves the relationship between products and collections.
- **Inventory consistency:** Each product variant has a dedicated inventory record shared across both sales channels.
- **Auditability:** Stock movements provide a record of inventory changes and associated staff members where applicable.
- **Payment traceability:** Payment records are linked to orders, supporting payment verification and reconciliation.
- **Business scalability:** The structure allows the store to manage additional products, customers, orders, collections and staff without redesigning the entire database.

Additional constraints, such as unique SKU values, unique order references, valid quantity ranges and the one-to-one inventory relationship, will be implemented during relational schema and SQL development.

### 7. Conclusion

The ATIDADE ÀṢỌ Fashion Store Management System ERD provides a structured representation of the database required to support the store's operations. Its 17 entities and 19 relationships cover product management, customer records, orders, payments, inventory, staff operations and customer reviews.

The design supports the store's two sales channels through a shared relational database, with particular attention to inventory consistency, temporary stock reservations and payment processing.

The ERD serves as the foundation for developing the relational schema, defining database constraints, implementing SQL operations and evaluating database performance.