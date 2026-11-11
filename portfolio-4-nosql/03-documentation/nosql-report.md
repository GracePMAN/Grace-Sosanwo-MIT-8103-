
# NoSQL Implementation Report

## 1. Introduction

This portfolio section demonstrates the implementation of a NoSQL database for the ATIDADE ÀṢ Fashion Store Management System.

MongoDB Atlas was selected as the document-oriented database platform. The implementation demonstrates how product, customer, order, payment and inventory information can be stored and managed using flexible documents.

## 2. Database Setup

A MongoDB Atlas cluster named `AtidadeAsoCluster` was created.

The database was named `atidade_aso` and five collections were established:

1. products
2. customers
3. orders
4. payments
5. inventory

The database was hosted on MongoDB Atlas, providing access to a cloud-based MongoDB environment.

## 3. Practical Implementation

### 3.1 Product Management

A product named Classic Graphic T-Shirt was inserted into the products collection.

The document included its category, base price, description, status and two product variants.

The product was retrieved successfully using a query based on its name.

The product price was updated from ₦25,000 to ₦27,000.

The product was subsequently deleted successfully.

These operations demonstrated the four basic CRUD operations:

- CREATE: Insert a product document.
- READ: Retrieve a product document.
- UPDATE: Modify the product price.
- DELETE: Remove a product document.

### 3.2 Customer Management

A customer document was inserted into the customers collection.

The document contained customer details, account status and an embedded delivery address.

This demonstrated how related information can be stored together in a single MongoDB document.

### 3.3 Order Management

An order document was inserted into the orders collection.

It contained an order reference, customer email, sales channel, order status, total amount and an embedded items array.

This structure allows the order and its purchased items to be stored together.

### 3.4 Payment Management

A payment document was inserted into the payments collection.

It contained the payment reference, associated order reference, payment method, payment status, amount and payment provider.

The order reference provides a link between the payment and its corresponding order.

### 3.5 Inventory Management

An inventory document was inserted into the inventory collection.

It included the product SKU, size, colour, quantity on hand, reserved quantity, available quantity and reorder level.

The inventory quantity was updated from 20 to 19, demonstrating an inventory update operation.

A conditional query was also used to retrieve inventory records with fewer than 20 units in stock.

## 4. NoSQL Data Modelling Approach

The implementation used embedded documents and arrays to organise related information.

Product variants were embedded within product documents, customer addresses were embedded within customer documents, and purchased items were embedded within order documents.

Separate collections were used for payments and inventory because these records can be managed and accessed independently.

This approach reduces the need to retrieve related information from multiple collections in situations where embedding is appropriate.

## 5. Advantages of MongoDB for the Fashion Store

MongoDB provides several benefits for the ATIDADE ÀṢ Fashion Store:

- Flexible document structures for products with different attributes.
- Support for embedded product variants and customer addresses.
- Ability to store order items within individual order documents.
- Convenient document retrieval and modification.
- Cloud database hosting through MongoDB Atlas.
- Support for future expansion as the store introduces more products and categories.

## 6. Comparison with the Relational Database

The earlier portfolio used PostgreSQL, which organises information into related tables.

MongoDB uses documents grouped into collections.

In the PostgreSQL implementation, product variants, customers, orders and other information were stored in separate relational tables.

In MongoDB, related information such as product variants and order items was embedded within documents.

Both database approaches can support the fashion store, but they organise and manage information differently.

## 7. Limitations and Considerations

MongoDB's flexible structure requires careful document design to maintain consistency.

For example, storing payment and order information separately requires appropriate references between documents.

Inventory updates also require suitable application-level controls to prevent incorrect stock quantities when multiple customers place orders.

## 8. Conclusion

The MongoDB implementation demonstrated the use of a document-oriented NoSQL database for the ATIDADE ÀṢ Fashion Store.

Five collections were created, and practical operations were performed on product, customer, order, payment and inventory documents.

The implementation demonstrated CRUD operations, embedded documents, references, conditional queries and inventory updates.

MongoDB provides a flexible alternative to the relational PostgreSQL database and can complement it in applications that benefit from document-based data storage.

## 9. Evidence

Screenshots of the MongoDB Atlas implementation are stored in:

`evidence/portfolio-4-evidence/`

The evidence includes product insertion, retrieval, updating and deletion, customer and order documents, payment and inventory documents, inventory updating and the low-stock query.
