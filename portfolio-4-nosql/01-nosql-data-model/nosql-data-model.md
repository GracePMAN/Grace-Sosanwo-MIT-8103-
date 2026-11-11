
# NoSQL Data Model – ATIDADE ÀṢ Fashion Store

## 1. Introduction

The ATIDADE ÀṢ Fashion Store Management System uses MongoDB as its NoSQL database implementation.

MongoDB is a document-oriented database that stores information in flexible documents rather than traditional relational tables.

The purpose of this implementation is to demonstrate how product, customer, order, payment and inventory information can be organised using a NoSQL data model.

## 2. Selected NoSQL Database

**Database:** MongoDB

**Deployment:** MongoDB Atlas (Cloud Database)

**Database Name:** atidade_aso

**Cluster Name:** AtidadeAsoCluster

MongoDB was selected because its flexible document structure allows related information to be stored together. It also supports embedded documents, arrays and flexible data structures.

## 3. Database Collections

The database contains five collections:

| Collection | Purpose |
|---|---|
| products | Stores product information, categories, prices and product variants. |
| customers | Stores customer information and embedded delivery addresses. |
| orders | Stores customer orders and embedded purchased items. |
| payments | Stores payment references, methods, amounts and payment statuses. |
| inventory | Stores product stock quantities, reserved quantities and reorder levels. |

## 4. Document Structure and Modelling

### 4.1 Products Collection

The products collection stores product information in a single document.

Product variants are embedded in an array within the product document.

Example:

```json
{
  "product_name": "Classic Graphic T-Shirt",
  "category": "T-Shirts",
  "base_price": 25000,
  "status": "active",
  "variants": [
    {
      "size": "M",
      "colour": "Black",
      "sku": "AT-TSH-BLK-M",
      "stock": 20
    },
    {
      "size": "L",
      "colour": "Black",
      "sku": "AT-TSH-BLK-L",
      "stock": 15
    }
  ]
}
```

### 4.2 Customers Collection

Customer information is stored together with delivery addresses using an embedded array.

This makes it possible to retrieve customer details and address information from one document.

### 4.3 Orders Collection

The orders collection stores order information, including the customer email, order reference, sales channel, status and total amount.

Purchased product details are embedded inside an items array.

This allows an order and its purchased items to be stored together.

### 4.4 Payments Collection

Payment information is stored in a separate collection.

Each payment document contains a payment reference and an order reference. This provides a connection between payment records and their corresponding orders.

### 4.5 Inventory Collection

The inventory collection stores stock information for individual product variants.

It includes quantity on hand, reserved quantity, available quantity and reorder level.

This supports inventory monitoring and stock management.

## 5. Embedding and Referencing

The implementation uses both embedding and referencing.

**Embedding:**
- Product variants are embedded inside product documents.
- Customer addresses are embedded inside customer documents.
- Purchased items are embedded inside order documents.

Embedding keeps related information together and reduces the need for multiple queries when retrieving related details.

**Referencing:**
- Payments use order references to identify their corresponding orders.
- Inventory records use product SKUs to identify product variants.

Referencing is useful when information is maintained separately or may be accessed independently.

## 6. Advantages of the Selected Model

The document-based model provides the following advantages:

- Flexible document structures.
- Ability to store related information together.
- Support for arrays and embedded documents.
- Easier handling of product variants.
- Suitable for applications where product information may have different attributes.
- Cloud-hosted database access through MongoDB Atlas.

## 7. Conclusion

The MongoDB data model provides a flexible way to organise information for the ATIDADE ÀṢ Fashion Store.

By using five collections and combining embedded documents with references, the design supports product management, customer information, order processing, payments and inventory management.

The implementation demonstrates how a NoSQL database can complement the relational PostgreSQL database developed in the earlier portfolio sections.
