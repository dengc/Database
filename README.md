# Database

@(IT Studies)

## Normalization
-------------------------------------
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
- Lost update: 
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
- create new index in table (some situation)


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