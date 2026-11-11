# MIT 8103 – Advanced Database Systems
## Individual Practical Portfolio

**Student Name:** Grace Adenike Sosanwo  
**Student Email:** g.sosanwo31766@miva.edu.ng  
**Academic Session:** 2026/2027  
**Semester:** First Semester  
**Case Study:** ATIDADE ÀṢO Fashion Store Management System

---

## 1. Project Overview

This repository contains the practical activities completed for MIT 8103 – Advanced Database Systems.

The project uses the **ATIDADE ÀṢO Fashion Store Management System** as its case study. The system is designed to manage products, product variants, customers, orders, payments and inventory across website and social-media sales channels.

The portfolio demonstrates the application of relational database design, query optimisation, transaction management, NoSQL data modelling, and distributed and cloud database technologies.

## 2. Portfolio Activities

### Portfolio 1: Database Design and Modelling

Designed a relational database for the fashion store using an Entity Relationship Diagram (ERD), relational schema, primary and foreign keys, constraints and normalisation. The database was implemented using PostgreSQL through Supabase.

### Portfolio 2: Query Processing and Optimisation

Developed SQL queries to retrieve and analyse business data. Used execution plans and index verification to examine query performance and demonstrate database optimisation.

### Portfolio 3: Transactions and Concurrency

Demonstrated transaction management using COMMIT and ROLLBACK, transaction isolation, row-level locking and atomic conditional updates to support reliable inventory operations.

### Portfolio 4: NoSQL and Advanced Data Models

Implemented a document-oriented database using MongoDB Atlas. Created collections for products, customers, orders, payments and inventory, and demonstrated CRUD operations, embedded documents and inventory updates.

### Portfolio 5: Distributed and Cloud Database

Deployed the MongoDB database on MongoDB Atlas using AWS infrastructure. Examined the three-node replica-set architecture and tested majority write acknowledgement, secondary replica reads and replica-set status.

## 3. Repository Structure

- `portfolio-1-database-design/` – Database design, ERD, relational schema, normalisation and SQL implementation.
- `portfolio-2-query-optimisation/` – SQL queries, execution plans and optimisation analysis.
- `portfolio-3-transactions-concurrency/` – Transaction scripts, concurrency demonstrations and reports.
- `portfolio-4-nosql/` – MongoDB data model, implementation and report.
- `portfolio-5-distributed-cloud/` – Cloud deployment and distributed database documentation.
- `documentation/` – Final portfolio documentation.
- `evidence/` – Screenshots and practical implementation evidence.

## 4. Technologies and Tools

- PostgreSQL
- Supabase
- SQL
- MongoDB
- MongoDB Atlas
- Node.js
- MongoDB Node.js Driver
- Amazon Web Services (AWS)
- Visual Studio Code
- GitHub

## 5. Technical Architecture

The ATIDADE ÀṢO Fashion Store Management System portfolio
demonstrates the use of relational, NoSQL and distributed
database technologies, supported by application development
and version control tools.

| Component | Technology / Tool | Purpose |
|---|---|---|
| Relational Database | PostgreSQL | Stores structured business data such as products, customers, orders, payments and inventory. |
| Cloud Database Platform | Supabase | Hosts and manages the PostgreSQL database. |
| Query Processing | SQL | Used to retrieve, analyse and manipulate database records. |
| Query Optimisation | SQL Indexes and EXPLAIN ANALYZE | Used to examine query execution plans and evaluate query performance. |
| Transaction Management | PostgreSQL Transactions | Demonstrates COMMIT, ROLLBACK, isolation and concurrency control. |
| NoSQL Database | MongoDB | Stores business information using flexible document-based structures. |
| NoSQL Cloud Platform | MongoDB Atlas | Hosts the MongoDB database in the cloud. |
| Application Connectivity | Node.js and MongoDB Node.js Driver | Connects the application script to MongoDB Atlas and performs database operations. |
| Cloud Infrastructure | Amazon Web Services (AWS) | Provides the cloud infrastructure hosting the MongoDB Atlas cluster. |
| Distributed Database | MongoDB Replica Set | Demonstrates data replication using one primary and two secondary members. |
| Development Environment | Visual Studio Code | Used to organise project files, write SQL and JavaScript, and manage technical documentation. |
| Version Control and Repository Hosting | GitHub | Used to store, organise and present the portfolio source files, documentation and practical evidence. |

### Architecture Summary

The portfolio uses PostgreSQL through Supabase for relational
database implementation and MongoDB Atlas for NoSQL and
distributed database demonstrations.

Node.js provides application connectivity to MongoDB Atlas,
while Visual Studio Code supports development and project
organisation. GitHub provides repository hosting and access
to the portfolio deliverables.

## 6. Practical Evidence

Screenshots, SQL execution results, query plans, database configurations and implementation test results are organised in the `evidence/` directory and the relevant portfolio folders.

These materials provide supporting evidence of the practical activities carried out during the project.

## 7. Implementation Notes

The MongoDB Atlas deployment uses a three-node replica set. Majority write acknowledgement and secondary replica reads were tested successfully.

Primary-node failure and automatic failover were not manually simulated, and sharding was not configured. These are documented as architectural capabilities and possible future improvements rather than completed practical tests.

## 8. Academic Integrity and AI Use

AI assistance was used for learning support, technical explanations, planning, debugging guidance and documentation refinement.

Practical database operations and tests were carried out and verified by me. A fuller AI Use Declaration and individual technical reflection are included in the final documentation.

## 9. Submission

**Course:** MIT 8103 – Advanced Database Systems

**Case Study:** ATIDADE ÀṢO Fashion Store Management System

**GitHub Repository:** [https://github.com/GracePMAN/Grace-Sosanwo-MIT-8103-]

**ER Diagram:** [https://drive.google.com/file/d/10DQ80Uys1FFgSbVsQ1VmxMBnRVbPIgS-/view?usp=sharing]