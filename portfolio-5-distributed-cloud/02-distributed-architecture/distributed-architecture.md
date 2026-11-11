
# Distributed Database Architecture – ATIDADE ÀṢ Fashion Store

## 1. Introduction

A distributed database is a database system in which data is stored and managed across multiple interconnected servers or nodes.

For the ATIDADE ÀṢ Fashion Store, MongoDB Atlas provides a practical example of distributed database architecture through its three-node replica set.

The replica set helps maintain multiple copies of data across database nodes and supports database availability if a node becomes unavailable.

## 2. MongoDB Replica Set Architecture

The MongoDB Atlas cluster, `AtidadeAsoCluster`, uses a three-node replica set hosted on AWS in the Paris region.

A replica set is a group of MongoDB servers that maintain the same data set.

The main components are:

- **Primary node:** Receives write operations and records changes to the database.
- **Secondary nodes:** Maintain copies of the primary node's data by replicating its changes.
- **Election process:** Allows eligible secondary nodes to elect a new primary if the existing primary becomes unavailable.

This architecture supports data availability and helps reduce the risk of database downtime.

## 3. Data Replication

Data replication involves maintaining copies of database information across multiple nodes.

In MongoDB replica sets, the primary node records database changes in its operation log (oplog). Secondary nodes use this log to replicate changes and maintain their copies of the data.

For the fashion store, replication can help ensure that important information remains available across the replica set, including:

- Product information.
- Customer records.
- Orders.
- Payment records.
- Inventory information.

Replication helps improve data availability and supports recovery when a database node experiences a failure.

## 4. High Availability and Fault Tolerance

High availability refers to the ability of a database system to remain accessible with minimal interruption.

Fault tolerance is the ability of a system to continue operating when one or more components fail.

The three-node replica set provides a foundation for both concepts.

If the primary node becomes unavailable, the remaining eligible members can participate in an election to select a new primary.

This allows the database service to recover from certain node failures without requiring the entire database to be rebuilt.

However, failover may involve a brief interruption while the election takes place.

## 5. Consistency in Distributed Databases

Consistency ensures that database operations maintain valid and reliable data.

MongoDB replica sets use replication to distribute database changes from the primary node to secondary nodes.

Replication is asynchronous by default, meaning that secondary nodes may temporarily lag behind the primary.

For applications such as the ATIDADE ÀṢ Fashion Store, this is an important consideration when retrieving information such as product stock quantities and order statuses.

Appropriate read and write concerns can be selected to control the required level of acknowledgement and consistency for database operations.

## 6. Sharding and Horizontal Scalability

Sharding is a technique used to distribute data across multiple database servers called shards.

Each shard stores part of the overall dataset, allowing a database to handle larger data volumes and increased workloads.

For the ATIDADE ÀṢ Fashion Store, sharding could become useful as the business grows and handles:

- More products and product variants.
- Increasing customer records.
- Higher order volumes.
- More inventory transactions.
- Increased website traffic.

For example, a suitable shard key could be selected to distribute order records across multiple shards.

However, sharding was not configured in the current MongoDB Atlas implementation. It is discussed here as a possible future scalability approach.

## 7. Application to the Fashion Store

The distributed database architecture can support the fashion store in several ways:

- Replication helps maintain multiple copies of business data.
- Replica-set elections support recovery when a primary node fails.
- Secondary nodes provide additional copies of the database.
- Appropriate read and write concerns help manage consistency requirements.
- Sharding provides a future option for distributing larger datasets and workloads.

These capabilities are relevant to a fashion store that needs reliable access to product, customer, order, payment and inventory information.


## Practical Verification and Test Results

To verify the distributed database capabilities of the MongoDB Atlas deployment, practical tests were performed using Node.js and the MongoDB Node.js driver.

### 1. Majority Write Acknowledgement

A test document was inserted into a dedicated `replication_test` collection using majority write concern.

The operation returned:

- `Majority write acknowledged: true`

This confirms that the write received acknowledgement from a majority of the replica-set members.

### 2. Secondary Replica Read

The test document was retrieved using the secondary read preference.

The returned document contained the same test ID and message that had been inserted.

This demonstrated that the document was available through a secondary replica.

### 3. Replica Set Configuration

The `replSetGetStatus` command was executed through Node.js to inspect the replica-set configuration.

The result identified three members:

| Replica-set member | State |
|---|---|
| shard-00-00 | SECONDARY |
| shard-00-01 | SECONDARY |
| shard-00-02 | PRIMARY |

The replica-set name returned was `atlas-cl1lmx-shard-0`.

### 4. Test Summary

The practical tests confirmed:

- Successful connection to MongoDB Atlas.
- Successful majority write acknowledgement.
- Successful retrieval of a test document using secondary read preference.
- Identification of one primary and two secondary replica-set members.

These tests provide practical evidence of the replica-set architecture and replication capabilities used by the ATIDADE ÀṢ Fashion Store database.

A primary-node failure and automatic failover were not manually simulated. Sharding was also not configured in this implementation.

### Evidence

The following screenshots provide evidence of the tests:

- `02-replication-secondary-read-test.png`
- `03-replica-set-configuration.png`


## 8. Limitations and Considerations

Although distributed database architecture provides important benefits, certain considerations remain:

- Replication can introduce temporary delays between nodes.
- Network interruptions can affect communication between replica-set members.
- Elections may cause brief interruptions during failover.
- Sharding introduces additional design and operational complexity.
- Database security and access control must be maintained across the deployment.

## 9. Conclusion

The ATIDADE ÀṢ Fashion Store uses MongoDB Atlas with a three-node replica set to demonstrate distributed database architecture.

The replica-set design provides an example of data replication, high availability, fault tolerance and primary-node election.

Although sharding was not implemented, it provides a potential approach for supporting future growth in data volume and application workload.

The deployment demonstrates how distributed database technologies can support the reliability and scalability requirements of modern applications.
