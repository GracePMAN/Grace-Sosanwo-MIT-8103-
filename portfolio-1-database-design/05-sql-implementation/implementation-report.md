
# SQL Implementation and Testing Report

## 1. Database Implementation

The ATIDADE ÀṢỌ Fashion Store Management System was implemented using PostgreSQL through Supabase.

The database consists of 17 relational tables covering:
- Products and product categories
- Product collections and images
- Product variants
- Customers and customer addresses
- Staff and user roles
- Orders and order items
- Inventory and payments
- Stock movements and reservations
- Product reviews

UUID primary keys and foreign keys were used to identify records and establish relationships between tables.

## 2. Integrity Constraints

Additional CHECK constraints were implemented to control valid values in important fields, including:
- Product status
- Customer and staff account status
- Sales channel
- Order status
- Payment status
- Stock reservation status
- Stock movement type

These constraints help maintain data consistency and prevent invalid values from being inserted.

## 3. Database Indexes

The database was inspected using PostgreSQL's `pg_indexes` system view.

The verification query returned 44 index records. These included automatically generated indexes associated with primary keys and unique constraints, as well as indexes created to support database lookups.

Indexes help improve data retrieval performance, although their impact will be evaluated further during query optimisation.

## 4. Sample Data and Testing

Sample records were inserted into the database to test the relationships between the tables.

The test included:
- A product category
- A fashion product
- Two product variants
- A customer
- A customer delivery address
- Inventory records
- A customer order
- An order item

A SQL JOIN query was executed across the order_items, orders, customers, product_variants, products and inventory tables.

The query successfully returned the product name, SKU, size, colour, available stock, customer name, order reference, quantity and subtotal.

## 5. Test Result

The JOIN query returned one matching record successfully.

This confirmed that the database tables had been created correctly and that the tested primary key and foreign key relationships worked as expected.

## 6. Conclusion

The SQL implementation established the relational database structure for the ATIDADE ÀṢỌ Fashion Store Management System.

The implementation included table creation, integrity constraints, index inspection, sample data insertion and relationship testing.

Further testing of transaction management, concurrency control and query performance will be covered in the subsequent portfolio sections.
