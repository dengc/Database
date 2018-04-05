# Database

@(IT Studies)

- DML: manage data (select, insert, delete...)
- DDL: database structure (create, alter, drop...)

## ERD
-------------------------------------
### Relationship Strength
- Strong relationship: child primary key contain primary key of parent （实线）
- Weak relationship: NO. child has its own primary key (虚线)
- Weak Entity: Strong relational children (inherit a primary key from parent)
- Composite Entity: M:N to 1:M - between 2 parents

### Relationship Degree
- Unary: 1 entity (recursive relationship)
- Binary: 2 entities are associated
- Ternary: 3 entities are associated

### Inheritance
One entity can be either A or B or ...  (Person --- Student/Employee)

## Normalization
-------------------------------------
Draw dependency diagram

### 1NF
-  each attribute contains only a single value from that domain
-  no repetitive data
-  need primary key

### 2NF
- no partial dependencies
> every non-prime attribute is dependent on the whole of every candidate key.

### 3NF
- no transitive dependencies
> all the attributes are not determined by any non-prime attributes

### BCNF
-  primary key doesn’t dependent on non-prime attribute

### 4NF:
- no multi-valued dependencies
> no two or more independent multi-value about the same attribute occur in one table

### Denormalization
> Produces a lower normal form

- increase processing speed
- greater data redundancy

## Transaction Management
-------------------------------------
### Properties -- ACID
- atomicity
- consistency
- isolation
- durability

### SQL statement
- COMMIT
- ROLLBACK

Transaction with 2 database request:
``` sql
BEGIN TRANSACTION

UPDATE PRODUCT
SET PROD_QOH = PROD_OQH + 1
WHERE PROD_CODE = ‘ABC’

UPDATE PART
SET PART_QOH = PART_OQH - 1
WHERE PART_CODE = ‘A’ OR PART_CODE = ‘B’ OR
PART_CODE = ‘C’

COMMIT;
```

### Concurrency control
> Ensures serializability of transactions in a multiuser database environment

#### Problems
- Lost update
- Uncommitted data: T1 rollback after T2 accessed data
- Inconsistent retrievals

#### Locking Method
> for isolation of transaction 

- pessimistic: assumption with conflict
    - without two-phase: lock A, unlock A; lock B, unlock B...
    - with two-phase: lock A, lock B ... ; unlock A, unlock B...
- deadlock: two transactions wait indefinitely for each other
- different levels: db, table, page, row...

#### Optimistic Approach
> no need lock or time stamp

### Database Recovery
> Restore DB to previous state: change back to before value

- Deferred: change log
- Immediate: change db


## Database Performance Tuning & Optimization
-------------------------------------
> Reduce response time!

parsing -> execution -> fetching

Safe time:
- When using multiple AND conditions, write the condition most likely to be false first
- When using multiple OR conditions, put the condition most likely to be true first
- create new index in table (some situation, like sum() or avg()...)


## Distributed DB (DDBMS)
-------------------------------------
> Store DB over 2 or more independent sites

- Advantages: faster, independent
- Disadvantages: difficult, cost 

- homogeneous: same DBMS, multiple instances
- heterogeneous: different types of DBMSs

### Evaluation
Centralized -> global marketing -> rapid -> distributed access

### Transparency
- distribution: support by dictionary or catalog
- transaction: transaction completed in all sites
- performance: allow centralized DB, most cost-effective
- Failure: in case of network failure

### Design
- Data fragmentation
> divide into rows, or columns, or mixed

- Data replication
- Data allocation

### types of operations
- remote request: one site select, update
- remote transaction: one site insert (invoice)
- distributed request: different location table select, update
- distributed transaction: different location table insert

### DO-UNDO-REDO protocol
- DO: records 'before' and 'after' value in log
- UNDO: reverses an operation
- REDO: redo an operation, using DO portion in log


## Business Intelligence
-------------------------------------
> Generates and presents information using tools to support business decision making

- Data must be aggregated and summarized
- very large databases

### Star Schema -- snowflake
Maps multidimensional decision support data into a relational database (M:1)
Dimension tables: time, region, product....

### Online Analytical Processing (OLAP)
- Multidimensional data analysis techniques
- Advanced database support
- Easy-to-use end-user interfaces

Group by:
- Rollup: aggregate by different dimensions, exept for the last column
- Cube: by listed columns


### DO-UNDO-REDO protocol
- DO: records 'before' and 'after' value in log
- UNDO: reverses an operation
- REDO: redo an operation, using DO portion in log


## Web Tech
-------------------------------------
ODBC (Open Database Connectivity)
API (Application Programming Interface)
XML (Extensible Markup Language)


## Security
-------------------------------------
Goals:
- Confidentiality
- Compliance
- Integrity
- Availability


## Spatial DB
-------------------------------------
> store and query data related to objects in space, including points

entity view: space as an area filled with a set of discrete objects

relationships: touch, intersect, contain, cover, disjoint, equal (topological operator)
use: Intersect(C.Shape, R.Shape) = 1

Trees:
R, k-d, k-d-b


## NoSQL DB
-------------------------------------
> for big data,  flexible & efficient

### Why
- improve programmer productivity by using a database that better matches an application's needs
- improve data access performance via some combination of handling larger data volumes, reducing latency, and improving throughput

### Trials
- schema-less: "Implicit" no tables, no relations! just write and run (application) code to make the change in the DB
- flexible: easy to add new types of data
- scalable
- fast

### Json
Json (XML) -> enter objects、array of object
- straightforward
- 'BASE' property

### Types
#### Key-Value
- Redis, Amazon Dynamo
- Memcached
    - memcache->set(key,val)
    - val=memcache->get(key)
- lightweight (simple), schema-less, transaction-less.

#### Column-based: Cassandra
- Cassandra, HBase, BigTable
- Column family -> column data; supercolumn family -> supercolumns -> column data.

#### Document-based
> a collection of documents (a table of rows)

- MongoDB (using MapReduce)

#### Graph-based
> comprised of vertices(objects) and edges(relations)

- Neo4J (using Cypher)
- Triple store: stores (subject, relation, object) -> RDF
    - "Bob knows Fred"


## Big Data
-------------------------------------
> TMD (Too Much Data)

### 3V
- Variety
- Velocity
- Volume

diverse types, changes often, and comes in large quantities.

### Datafication
> turn life into data

"Once we datafy things, we can transform their purpose and turn the information into new forms of value."
LoT: Internet of Things