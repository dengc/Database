# Database

@(IT Studies)


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