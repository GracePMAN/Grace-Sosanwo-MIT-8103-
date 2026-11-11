
# Distributed and Cloud Database Report
## ATIDADE ÀṢ Fashion Store Management System

### 1. Introduction

This report explains the cloud database deployment and distributed database architecture implemented for the ATIDADE ÀṢ Fashion Store Management System.

The project uses MongoDB Atlas as its cloud-hosted NoSQL database platform. The deployment demonstrates cloud database hosting, replica-set architecture, data replication, availability and consistency considerations.

### 2. Cloud Database Deployment

MongoDB Atlas was selected to host the NoSQL database in the cloud.

The deployment configuration is:

| Configuration | Implementation |
|---|---|
| Database platform | MongoDB Atlas |
| Cluster name | AtidadeAsoCluster |
| Database name | atidade_aso |
| Cloud provider | Amazon Web Services (AWS) |
| Deployment region | Paris, France (eu-west-3) |
| Cluster tier | Free |
| MongoDB version | 8.0.37 |
| Cluster architecture | Three-node replica set |

The database contains five collections:

- products
- customers
- orders
- payments
- inventory

These collections store the main business information required by the fashion store.

### 3. Regional Selection

Although the business operates in Nigeria, the cluster was deployed in the AWS Paris region.

The Paris region was selected because it was available under the Free-tier deployment used for this implementation.

MongoDB Atlas offers different cloud regions depending on the cloud provider and deployment tier. African regions can be considered for suitable higher-tier deployments.

For a future production deployment serving Nigerian customers, a South African region could be evaluated based on latency, availability and hosting cost.

The selected region therefore represents a practical balance between available deployment options and implementation cost.

### 4. Distributed Database Architecture

The MongoDB Atlas cluster uses a three-node replica set.

The replica set consists of:

- One primary member that handles write operations.
- Two secondary members that maintain replicated copies of the data.

The replica-set status was inspected using the MongoDB `replSetGetStatus` command through Node.js.

The result identified the following members:

| Replica-set member | State |
|---|---|
| shard-00-00 | SECONDARY |
| shard-00-01 | SECONDARY |
| shard-00-02 | PRIMARY |

The replica-set name returned was `atlas-cl1lmx-shard-0`.

This confirms the three-member replica-set configuration of the deployed cluster.

### 5. Replication and Consistency

MongoDB replica sets replicate database changes from the primary member to secondary members.

The primary records changes in its operation log, while secondary members replicate those changes.

For the fashion store, replication is important because the database contains business-critical information such as customer records, orders, payments and inventory.

Majority write concern was used during the practical replication test. This requests acknowledgement from a majority of replica-set members before the write is considered successful.

Secondary read preference was also used to retrieve the test document from a secondary member.

Replication is asynchronous by default, so secondary members may temporarily lag behind the primary. Appropriate read and write concerns are therefore important when designing operations that require stronger consistency.

### 6. Practical Implementation and Test Results

Practical tests were carried out using Node.js and the MongoDB Node.js driver.

**Test 1: MongoDB Atlas connection**

The Node.js application successfully connected to the cloud-hosted MongoDB Atlas database.

**Test 2: Majority write acknowledgement**

A test document was inserted into the `replication_test` collection using majority write concern.

The terminal returned:

`Majority write acknowledged: true`

This confirmed that the write received majority acknowledgement.

**Test 3: Secondary replica read**

The inserted document was retrieved using secondary read preference.

The returned document contained the same test ID and message that had been inserted.

This demonstrated successful retrieval of the test document through a secondary replica.

**Test 4: Replica-set configuration**

The `replSetGetStatus` command successfully returned the replica-set name and three members.

The result identified one PRIMARY and two SECONDARY members.

These tests provided practical evidence of the deployed replica-set configuration and replication behaviour.

### 7. High Availability and Fault Tolerance

A three-node replica set provides a foundation for high availability and fault tolerance.

If the primary member becomes unavailable, eligible secondary members can participate in an election to select a new primary.

This supports recovery from certain node failures.

However, a primary-node failure and automatic failover were not manually simulated during this implementation. Therefore, failover behaviour is discussed as an architectural capability rather than a tested result.

### 8. Sharding and Future Scalability

Sharding distributes data across multiple database servers called shards.

It can support horizontal scalability by distributing large datasets and workloads.

For the ATIDADE ÀṢ Fashion Store, sharding could become relevant as the business grows and experiences increased customer activity, product records, order volumes and inventory transactions.

Sharding was not configured in the current Free-tier implementation. It remains a possible future scalability approach.

### 9. Limitations and Considerations

The implementation has the following limitations:

- The cluster uses the Free tier, which limits some advanced deployment and management features.
- The Paris region may introduce additional network latency for customers in Nigeria compared with a closer suitable region.
- Replication is asynchronous by default, so secondary reads may temporarily return older data.
- Primary-node failure and automatic failover were not manually tested.
- Sharding was not configured.
- Production deployment would require further evaluation of security, backups, monitoring, performance and hosting costs.

### 10. Conclusion

The ATIDADE ÀṢ Fashion Store demonstrates the use of cloud-hosted and distributed database technologies through MongoDB Atlas.

The implementation successfully established a cloud database, verified a three-node replica set, obtained majority write acknowledgement and retrieved a test document through a secondary replica.

These practical results demonstrate important distributed database concepts, including replication, consistency considerations and replica-set architecture.

Although failover simulation and sharding were not implemented, they provide relevant areas for future improvement as the fashion store expands.

### 11. Evidence

The following screenshots support the implementation and testing:

- MongoDB Atlas cluster deployment screenshot.
- `02-replication-secondary-read-test.png`
- `03-replica-set-configuration.png`

Additional MongoDB collection and Node.js CRUD evidence is available in `evidence/portfolio-4-evidence/`.
