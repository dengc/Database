#Database

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

### Concurrency control
> Ensures serializability of transactions in a multiuser database environment

#### Problems
- Lost update: 
- Uncommitted data: T1 rollback after T2 accessed data
- Inconsistent retrievals

#### Locking Method
> for isolation of transaction 

- pessimistic: assumption with conflict
- deadlock: two transactions wait indefinitely for each other
- different levels: db, table, page, row...

#### Optimistic Approach
> no need lock or time stamp

### Database Recovery
> Restore DB to previous state

- Deferred: change log
- Immediate: change db