# ATIDADE ÀṢỌ Fashion Store Management System

## 1. Business Overview

ATIDADE ÀṢỌ is a contemporary unisex fashion retail business that sells clothing and fashion accessories. Its initial product range includes T-shirts, caps and hoodies.

The business operates through two sales channels:

1. **Online Store:** Customers browse products, select available sizes and place orders through the website.
2. **Social Media Sales:** Customers place orders through social media platforms such as WhatsApp and Instagram. Staff members manage these orders and record them in the central management system.

The business requires a centralised database to manage its products, customers, orders, payments and inventory across both sales channels.

The database will ensure that product information, stock levels and order records remain consistent regardless of the channel through which a purchase is made.## 2. Business Operations and Order Processing

The ATIDADE ÀṢỌ Fashion Store Management System supports two sales channels that operate through a shared database.

### 2.1 Online Store Orders

1. Customers browse available products on the online store.
2. Customers select their preferred product, size and quantity.
3. The system checks product availability.
4. Customers proceed to checkout and submit their orders.
5. The system records the order and processes payment.
6. Once payment is successfully verified, the order is confirmed and inventory is updated.

### 2.2 Social Media Orders

1. Customers contact the business through WhatsApp or Instagram.
2. Staff members check product and size availability in the management system.
3. Staff members create the order in the system.
4. The system generates a unique order reference and requests a virtual account for payment.
5. The customer receives the payment details.
6. The payment provider notifies the system when payment is received.
7. The system verifies the payment before confirming the order and updating inventory.

### 2.3 Centralised Inventory Management

Both sales channels use the same inventory records.

This means that when a product variant is sold through either channel, the same central stock record is updated. This prevents the business from maintaining separate stock figures for website and social media sales.
## 3. Temporary Stock Allocation and Payment Expiry

When staff create a social media order, the system temporarily allocates the requested product quantities for 30 minutes.

This allocation prevents the same stock from being purchased by another customer during the payment period.

### 3.1 Payment Window

1. The system creates the order and generates a unique order reference.
2. The payment provider generates a unique virtual account for the order.
3. The virtual account remains active for exactly 30 minutes.
4. If payment is successfully completed within the 30-minute window, the system verifies the transaction and confirms the order.
5. Once payment is confirmed, the temporary stock allocation is converted into a completed sale, and the physical inventory quantity is reduced.

### 3.2 Order Expiry

If payment is not successfully completed within the 30-minute payment window:

- The virtual account becomes inactive at 30 minutes.
- The system cancels the unpaid order at 30 minutes and 3 seconds (30.05 minutes).
- The temporary stock allocation is released.
- The physical stock quantity remains unchanged.

If the payment provider confirms that payment was completed before the 30-minute expiry but its notification reaches the system later, the system must verify the actual transaction time before deciding whether to accept the payment.

Any payment made after the permitted payment window must not automatically confirm an expired order and must be handled through the appropriate refund process.

### 3.3 Automated Processing

Order expiry must happen automatically without requiring staff intervention.

The system must also prevent duplicate payment notifications from causing multiple payment records or repeated stock deductions.
## 4. Inventory Allocation and Stock Control

The system maintains one central inventory record for every product variant. A product variant represents a specific product option, such as a T-shirt in size Medium and colour Black.

### 4.1 Website Stock Policy

Website customers may purchase the last available unit of a product variant, provided that the stock is available when the order is processed.

### 4.2 Social Media Stock Policy

Social media orders are handled by staff members.

To preserve availability for website customers, staff may only accept a social media order if at least one unit will remain available for website purchases after the requested quantity has been allocated.

If only one unit remains, staff must direct the customer to purchase through the website.

### 4.3 Stock Availability Calculation

The system distinguishes between physical stock and temporarily reserved stock.

Available stock is calculated as:

Available Stock = Quantity on Hand - Active Reserved Quantity

- Quantity on Hand represents the physical stock recorded by the business.
- Active Reserved Quantity represents stock temporarily allocated to unpaid orders.
- When payment is confirmed, the physical stock is reduced and the reservation is converted into a completed sale.
- When an order expires, its reservation is released without reducing physical stock.

### 4.4 Low-Stock Notification

The system uses a reorder level of 3 units.

When the available stock reaches the reorder level, the system generates a low-stock warning to notify staff that replenishment may be required.

### 4.5 Concurrency Control

The database must protect inventory updates against simultaneous purchases.

If two customers attempt to purchase the same remaining unit at the same time, the system must ensure that only one valid transaction succeeds. This prevents overselling and maintains accurate inventory records.
## 5. System Requirements

The ATIDADE ÀṢỌ Fashion Store Management System must support the following requirements.

### 5.1 Functional Requirements

The system must be able to:

1. Register and manage customer information.
2. Store product details, categories, images and collections.
3. Manage product variants, including sizes and colours.
4. Record and manage inventory quantities.
5. Support orders from both online and social media channels.
6. Record order items, quantities and purchase prices.
7. Generate unique order references.
8. Record and verify customer payments.
9. Allocate stock temporarily for eligible social media orders.
10. Automatically expire unpaid orders and release their stock allocations.
11. Record inventory changes and the staff members responsible for them.
12. Allow customers to submit product reviews.
13. Provide staff with information needed to monitor orders, payments and stock levels.

### 5.2 Non-Functional Requirements

The system must also provide:

1. **Data Integrity:** Database constraints must protect the accuracy and consistency of stored information.
2. **Security:** Access to sensitive information and database operations must be restricted to authorised users.
3. **Reliability:** Transactions must prevent incomplete or inconsistent database updates.
4. **Concurrency Control:** Simultaneous purchases must not result in overselling.
5. **Performance:** Database queries should retrieve and process information efficiently.
6. **Availability:** The system should remain accessible and support reliable access to business records.
7. **Scalability:** The database design should support growth in customers, products and transactions.
## 6. System Scope and Users

### 6.1 System Scope

The database system covers the core operations of ATIDADE ÀṢỌ Fashion Store, including:

- Customer information management.
- Product and category management.
- Product variants and collections.
- Inventory and stock reservations.
- Website and social media order management.
- Payment recording and verification.
- Stock movement tracking.
- Product reviews.
- Sales and inventory reporting.

The system focuses on maintaining accurate and consistent business records across both sales channels.

### 6.2 System Users

The main users of the system are:

1. **Customers:** Browse products, place orders through the website, make payments and submit product reviews.
2. **Sales Staff:** Manage social media enquiries, check stock availability and create customer orders.
3. **Inventory Staff:** Monitor stock levels, record stock movements and manage replenishment.
4. **Administrators:** Manage staff access, oversee business operations and review system records.
5. **System Processes:** Handle automated tasks such as payment verification, inventory updates and order expiry.