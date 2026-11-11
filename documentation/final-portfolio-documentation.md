
# MIT 8103 – ADVANCED DATABASE SYSTEMS
## INDIVIDUAL PRACTICAL PORTFOLIO DOCUMENTATION

**Student Name:** Grace Adenike Sosanwo  
**Student Email:** g.sosanwo31766@miva.edu.ng  
**Academic Session:** 2026/2027  
**Semester:** First Semester  
**Case Study:** ATIDADE ÀṢO Fashion Store Management System

---

## 1. Introduction and Case Study

This portfolio presents the practical application of advanced database management concepts using the ATIDADE ÀṢO Fashion Store Management System as the selected case study.

ATIDADE ÀṢO is a contemporary unisex fashion store offering T-shirts, caps and hoodies. The proposed system supports the management of products, product variants, customers, orders, payments and inventory across website and social-media sales channels.

The project explores how relational and NoSQL databases can support the store's operations, while demonstrating database design, query optimisation, transaction management, distributed databases and cloud deployment.

## 2. Summary of Portfolio Activities

### Portfolio 1: Database Design and Modelling

A relational database was designed and implemented using PostgreSQL through Supabase. The design consists of 17 tables covering the store's major business operations.

An Entity Relationship Diagram (ERD), relational schema, primary and foreign keys, constraints and normalisation documentation were developed. SQL scripts were executed to create the database tables, apply constraints, create indexes and insert sample records.

Practical verification included checking the database tables, inspecting indexes and executing JOIN queries to retrieve related product, variant, inventory, customer and order information.

**Evidence:** ERD, relational schema, normalisation documentation, SQL implementation and database screenshots.

### Portfolio 2: Query Processing and Optimisation

SQL queries were developed to retrieve and analyse information from the fashion store database. These included active product listings, product and variant details, sales summaries, best-selling products and customer order information.

EXPLAIN ANALYZE was used to inspect query execution plans. Index verification and an indexed SKU lookup were also performed to examine how indexes support data retrieval.

The practical results demonstrated the use of SQL queries, JOIN operations, aggregate functions, execution plans and indexes for database performance analysis.

**Evidence:** SQL query scripts, query results, execution plans, index verification and optimisation report.

### Portfolio 3: Transactions and Concurrency

PostgreSQL transaction features were explored using practical SQL demonstrations.

The exercises covered COMMIT and ROLLBACK, READ COMMITTED transaction isolation, row-level locking using SELECT FOR UPDATE and atomic conditional updates.

The inventory update demonstration showed how a conditional SQL statement can reduce stock only when sufficient quantity is available. This is important for preventing invalid inventory updates when multiple transactions operate on the same stock records.

**Evidence:** Transaction SQL scripts, concurrency documentation and screenshots of transaction and inventory update results.

### Portfolio 4: NoSQL and Advanced Data Models

MongoDB Atlas was selected to implement a document-oriented database for the fashion store.

Five collections were created: products, customers, Orders, payments and inventory. Practical CRUD operations were performed, including product insertion, retrieval, updating and deletion.

Embedded documents and arrays were used to represent related information such as product variants, customer addresses and order items. Separate collections were used for payments and inventory.

Node.js and the MongoDB Node.js Driver were also used to connect to MongoDB Atlas and execute database operations.

**Evidence:** MongoDB collection documents, CRUD screenshots, inventory update, low-stock query, Node.js implementation and NoSQL report.

### Portfolio 5: Distributed and Cloud Database

The MongoDB database was deployed using MongoDB Atlas on AWS infrastructure in the Paris region (eu-west-3). The deployment used a three-node replica set consisting of one primary member and two secondary members.

Practical tests were performed using Node.js to verify majority write acknowledgement, retrieve a test document using secondary read preference and inspect replica-set status.

These exercises demonstrated cloud database deployment, data replication, consistency considerations and replica-set architecture. Primary-node failure and automatic failover were not manually simulated, and sharding was not configured.

**Evidence:** Cloud deployment documentation, Atlas cluster screenshot, majority write and secondary read test results, and replica-set configuration output.

## 3. Technical Architecture and Tools

The portfolio used the following technologies and tools:

| Component | Technology | Purpose |
|---|---|---|
| Relational database | PostgreSQL | Structured data storage |
| Relational cloud platform | Supabase | PostgreSQL hosting and management |
| Query processing | SQL | Data retrieval and manipulation |
| Query optimisation | Indexes and EXPLAIN ANALYZE | Query performance analysis |
| Transaction management | PostgreSQL | Transaction and concurrency demonstrations |
| NoSQL database | MongoDB | Document-oriented data storage |
| NoSQL cloud platform | MongoDB Atlas | Cloud database hosting |
| Application connectivity | Node.js and MongoDB Node.js Driver | Database connection and operations |
| Cloud infrastructure | AWS | Infrastructure hosting the MongoDB Atlas deployment |
| Development environment | Visual Studio Code | Writing code and organising project files |
| Version control and repository hosting | GitHub | Storing and presenting project files and evidence |

## 4. Technical Reflection

This project provided practical experience in designing, implementing and managing databases for a realistic business scenario.

One of the major learning outcomes was understanding how relational database design uses tables, keys and constraints to maintain structured and consistent data. Query optimisation exercises also improved my understanding of how indexes and execution plans affect database performance.

The transaction exercises demonstrated the importance of transaction control and atomic updates, particularly when managing inventory. The MongoDB implementation provided practical exposure to document-based data modelling and the differences between relational and NoSQL databases.

The distributed database exercise further improved my understanding of cloud hosting, replica sets, majority write acknowledgement and secondary reads.

Some limitations were encountered during implementation. The MongoDB deployment used the available Free-tier configuration in the Paris region. Automatic failover was not manually tested, and sharding was not configured. These limitations helped me understand the difference between implementing a database feature and documenting its architectural capabilities.

Overall, the project strengthened my practical database skills and improved my ability to select and apply appropriate database technologies to business requirements.

## 5. Conclusion

The ATIDADE ÀṢO Fashion Store Management System provided a consistent case study for exploring the five areas of advanced database management.

The portfolio covered relational database design, SQL query optimisation, transaction and concurrency management, NoSQL implementation, and distributed and cloud database deployment.

The practical exercises and supporting evidence demonstrate the application of these concepts using PostgreSQL, Supabase, MongoDB Atlas and Node.js.

## 6. References

- PostgreSQL Documentation – https://www.postgresql.org/docs/
- Supabase Documentation – https://supabase.com/docs
- MongoDB Documentation – https://www.mongodb.com/docs/
- MongoDB Atlas Documentation – https://www.mongodb.com/docs/atlas/
- MongoDB Node.js Driver Documentation – https://www.mongodb.com/docs/drivers/node/current/
- Node.js Documentation – https://nodejs.org/docs/

## 7. AI Use Declaration

ChatGPT was used as an AI support tool for understanding database concepts, planning portfolio activities, receiving technical explanations, troubleshooting guidance and refining documentation.

The generated guidance was reviewed and adapted during the project. Database operations, SQL execution, MongoDB implementation and practical tests were carried out and verified by me. Responsibility for the accuracy and understanding of the submitted work remains with me.

## 8. Repository and Supporting Evidence

**GitHub Repository:** [https://github.com/GracePMAN/Grace-Sosanwo-MIT-8103-]

**ER Diagram:** [https://drive.google.com/file/d/10DQ80Uys1FFgSbVsQ1VmxMBnRVbPIgS-/view?usp=sharing]

The repository contains the five portfolio activities, SQL scripts, database models, implementation files, technical reports and supporting screenshots organised into their respective folders.

The final documentation and practical evidence are provided as part of the portfolio submission.
