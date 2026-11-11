
# Cloud Database Deployment – ATIDADE ÀṢ Fashion Store

## 1. Introduction

Cloud database deployment involves hosting a database on cloud infrastructure rather than relying entirely on a locally managed database server.

For the ATIDADE ÀṢ Fashion Store Management System, MongoDB Atlas was used to demonstrate cloud database deployment.

MongoDB Atlas provides a managed cloud environment where the database can be accessed remotely by authorised applications.

## 2. Cloud Database Platform

The selected cloud database platform is MongoDB Atlas.

The deployment details are:

| Configuration | Description |
|---|---|
| Cloud provider | Amazon Web Services (AWS) |
| Deployment region | Paris, France |
| AWS region | eu-west-3 |
| Cluster name | AtidadeAsoCluster |
| Database name | atidade_aso |
| Database type | MongoDB |
| Cluster architecture | Three-node replica set |

The cluster was created using the MongoDB Atlas free-tier deployment.

## 3. Deployment Configuration

The following steps were carried out to establish the cloud database:

1. Created a MongoDB Atlas account and project.
2. Created a cluster named `AtidadeAsoCluster`.
3. Selected AWS as the cloud provider.
4. Selected the Paris region (`eu-west-3`).
5. Created a database named `atidade_aso`.
6. Created five collections: products, customers, Orders, payments and inventory.
7. Created a database user for application authentication.
8. Configured the IP access list to allow the development computer to connect.
9. Configured the Node.js application to connect to MongoDB Atlas using a connection string stored in an environment variable.

The application connection was successfully tested using the MongoDB Node.js driver.

## 4. Cloud Database Accessibility

The MongoDB database is hosted remotely on MongoDB Atlas rather than on the local development computer.

The Node.js application connects to the cloud database using the MongoDB connection string.

The connection string is stored in a `.env` file to protect database credentials.

The `.gitignore` file excludes the `.env` file from Git tracking to reduce the risk of exposing sensitive connection information.

Successful database operations through Node.js demonstrate that the application can communicate with the remotely hosted database.

## 5. Benefits of Cloud Database Deployment

The cloud deployment provides several benefits:

- Remote access to the database by authorised applications.
- Reduced need to maintain physical database server infrastructure.
- Managed database infrastructure through MongoDB Atlas.
- Support for application growth and future expansion.
- Availability of managed replica-set infrastructure.
- Centralised storage of product, customer, order, payment and inventory information.

## 6. Deployment Considerations

Although cloud database deployment provides several advantages, certain considerations are important:

- Database credentials must be protected.
- Network access should be restricted to authorised IP addresses.
- Applications should use secure database connections.
- Database performance depends partly on network connectivity.
- Appropriate backup and recovery arrangements are important.
- Database access permissions should be managed carefully.

## 7. Regional Availability and Deployment Decision

Although the ATIDADE ÀṢ Fashion Store is based in Nigeria, the MongoDB Atlas cluster was deployed in the AWS Paris region (`eu-west-3`).

The deployment region does not have to be in the same country as the business. However, the geographical distance between the application users and the database can affect network latency and application response time.

During the deployment research, I discovered that MongoDB Atlas supports African cloud regions, including:

- AWS Cape Town, South Africa (`af-south-1`).
- Google Cloud Johannesburg, South Africa (`africa-south1`).
- Microsoft Azure South Africa North (`southafricanorth`).

However, these African regions are listed for dedicated MongoDB Atlas deployments (M10 and above), rather than the Free tier used for this implementation.

This explains why an African region was not available when creating the free cluster.

The Paris region was therefore retained because it was available under the selected Free-tier deployment and allowed the database to be implemented and tested successfully.

For a future production deployment serving mainly Nigerian customers, a South African region could be evaluated to determine whether it offers lower network latency. This would require considering the additional hosting cost, regional availability and actual application performance.

This demonstrates that cloud database region selection involves balancing geographical proximity, performance, availability and deployment cost.

## 8. Conclusion


The ATIDADE ÀṢ Fashion Store database was successfully deployed on MongoDB Atlas using AWS infrastructure in the Paris region.

The three-node replica-set architecture provides a foundation for understanding cloud database availability and replication.

The successful Node.js connection and database operations demonstrate that the cloud-hosted database is accessible to an external application.

This implementation provides a practical example of how cloud database services can support modern applications without requiring the organisation to manage its own physical database servers.
