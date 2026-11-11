
# Database Normalisation – ATIDADE ÀṢỌ Fashion Store Management System

## 1. Introduction

Database normalisation is the process of organising data into related tables to reduce unnecessary duplication, prevent data anomalies and improve data integrity.

The ATIDADE ÀṢỌ Fashion Store Management System uses a relational database designed around the First Normal Form (1NF), Second Normal Form (2NF) and Third Normal Form (3NF).

## 2. First Normal Form (1NF)

A table satisfies 1NF when:
- Each column contains atomic (single) values.
- Each record can be uniquely identified.
- There are no repeating groups or multiple values stored in one field.

**Application to the database:**

The database stores individual product variants separately. For example, a T-shirt in different sizes and colours is represented through separate records in the `product_variants` table.

Similarly, customer addresses are stored as individual records in `customers_addresses`, rather than storing several addresses in one customer field.

Each table has a primary key that uniquely identifies its records.

**Result:** The database satisfies 1NF because its attributes contain individual values and repeating information is stored in separate records.

## 3. Second Normal Form (2NF)

A table satisfies 2NF when:
- It already satisfies 1NF.
- Every non-key attribute depends on the whole candidate key, not just part of a composite key.

**Application to the database:**

The `product_collections` table uses a composite primary key consisting of `product_id` and `collection_id`.

The `created_at` attribute describes when that particular product-to-collection association was created. It depends on the complete combination of `product_id` and `collection_id`.

The database also separates product information from product variant information. Product names and descriptions are stored in `products`, while size, colour, fit and variant-specific price are stored in `product_variants`.

**Result:** The design avoids partial dependencies and satisfies 2NF.

## 4. Third Normal Form (3NF)

A table satisfies 3NF when:
- It already satisfies 2NF.
- Non-key attributes depend directly on the primary key and not on other non-key attributes.

**Application to the database:**

The design separates information into appropriate tables to avoid transitive dependencies.

Examples include:

- Category information is stored in `categories`, while `products` stores the category reference through `category_id`.
- Staff role information is stored in `user_roles`, while `staff` references the appropriate role through `role_id`.
- Customer information is stored in `customers`, while delivery addresses are stored separately in `customers_addresses`.
- Product collection details are separated into `collections` and the junction table `product_collections`.

This prevents the same category, staff role or customer information from being unnecessarily repeated across multiple records.

**Result:** The database structure is designed to satisfy 3NF by separating independent entities and using foreign keys to establish relationships.

## 5. Normalisation Benefits

The normalised database design provides the following benefits:

1. **Reduced data duplication:** Customer, product, category and staff information is maintained in their respective tables.
2. **Improved data integrity:** Primary keys and foreign keys maintain valid relationships between records.
3. **Reduced update anomalies:** Changes to shared information can be made in one location.
4. **Reduced insertion anomalies:** Independent records, such as categories and collections, can be created without first creating a product or order.
5. **Reduced deletion anomalies:** Deleting an order or product does not automatically require deleting unrelated customer, category or staff information.

## 6. Design Considerations

Some calculated or historical values are intentionally stored in the database.

- `orders.total_amount` stores the order total.
- `order_items.subtotal` stores the calculated value of quantity multiplied by unit price.
- `order_items.unit_price` preserves the price charged at the time of purchase.
- `products.base_price` and `product_variants.variant_price` are both retained to support the current pricing design.

These values require appropriate validation to maintain consistency. For example, the `order_items` table includes a CHECK constraint ensuring that subtotal equals quantity multiplied by unit price.

## 7. Conclusion

The ATIDADE ÀṢỌ Fashion Store Management System is structured around 1NF, 2NF and 3NF principles.

The design separates major business entities, uses primary and foreign keys to establish relationships, and reduces unnecessary duplication. These decisions support data integrity, consistency and easier database maintenance as the fashion store grows.
