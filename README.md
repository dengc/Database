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

Trees (create spatial indices):
R, k-d, k-d-b

KML encode spatial data:
```htmlbars
<Point><coordinates>longitude, latitude</coordinates></Point>
```

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
- Column families (groups of columns) that are accessed more frequently can be kept in a separate file, and non-essential columns in another file.

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


## Data Science
-------------------------------------
> statistics + software engineering => for data

- Data Science Life Circle:
Question -> Data - Methods - Inference - Presentation - Answer
    -   Methods: Data mining, ML, Classificaiton, Regression

Questions for DS Job:
https://www.dezyre.com/article/100-data-science-interview-questions-and-answers-general-for-2018/184

### MapReduce
> a programming model processing big data sets with a parallel, distributed algorithm on a cluster; by Google

1. Map: Split data into segments (key-value)
2. Shuffle: data归类-> consolidates its values into a list
3. Reduce:  merges values associated with the same key

### Hadoop
> a collection of software providing framework for distributed storage, coming from GFS & MapReduce; written in Java

Example: Pig, Hive, Oozie, Musketeer
sometimes inside VM


## Data Mining
-------------------------------------
> the science of extracting useful information from large datasets
> - heart: discovering RELATIONSHIPS between parts of a dataset.

And, Machine Learning = training algorithms for discovering relationships and use result for new data

Classification: labeling
Clustering: group
Regression: coupling
Rule extraction: relate

### Decision Tree

### K-means clustering
start with 'n' random locations ('centroids') in/near the dataset; assign each input point (our data) to the closest centroid; compute new centroids (from our data); iterate (till convergence is reached).

### Support Vector Machine (SVM)
> partitions data (classifies) them into TWO sets - uses a 'slicing' hyperplane

### A Priori
> look for hidden relationships

- support(A): m/n => m A in a list of n
- confidence(A->B): => support(A,B) / support(A)

### kNN (k Nearest Neighbors)
The new point's type will be the type of the majority of its 'k' neighbors



## TensorFlow
-------------------------------------
> a dataflow processor where ALL data is in the form of 'tensors'

express neural networks as graphs (flexible)

### Docker
> a lightweight alternative to running a VM such as VirtualBox or VMWare


## Machine Learning
-------------------------------------
> can learn from data to optimize a performance function

### Types
- Supervised learning: labeled, know target
- Unsupervised learning: unlabeled, clustering
- Semi-supervised learning: both labeled and unlabeled
- Reinforcement learning
    -  agent - the learner or decision maker 
    -  environment - everything the agent interacts with 
    -  actions - what the agent can do

### Algorithms
- Linear Regression
- Logistic Regression
- Decision Trees
- SVM (Support vector machine)
- Naive Bayes
- KNN
- K-Means Clustering
- Random Forest
- Gradient Boost, Adaboost
- Neural nets ("NN, ANN, DNN, CNN, RNN..")


## Visualization of Data
-------------------------------------
> graphical depictions of data: turning data into images/graphics - to obtain BETTER INSIGHT into the data.

### Types
- Charts: pie charts, histogram / bar-chart
- Tables
- Graphs: Bubble plots (double variables)
- Geospatial maps: Starbucks Locations, crime, weather...
- Networks (show relationship)

Help AR & VR

## R
-------------------------------------
> a statistics programming language

- statistics operations, graphics output., rich I/O
- R particularly shines when it comes to operations on vectors
``` r
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
y <- c(x, 0, x)
v <- y + 1
m <- 1:30
n <- seq(2,5)
temp <- x>13
x <- readOGR(dsn=".", layer="starter")
y <- tmaptools::read_osm(bbox(x))
tm_shape(y) + tm_raster() + tm_shape(x) + tm_dots(size = 2.0, col = "red")
```


## 题目
-------------------------------------
- Spatial queries are performed using a two step filter+refine process, and MBRs help in the filtering step (which acts as a preprocessor for refining).
- Ensemble Method in ML: To minimize or eliminate any variances or biases between the individual learners in the ensemble.
- In R, data frame can hold a table of data.
- Commodity machine can be used for both map and reduce tasks
- Map task must be completed before Reduce task starts.
- ML system: Raw data > Pre processing > Divide > Training > Model > Evaluation
- 4 different categories of ML:
    - classification: labeling the data
    - clustering: grouping data not based on pre-defined labels, but based on their similarity
    - regression: couple the data with a continuous result values
    - rule extraction:  find informative relationships within our data
- overfitting: major problem that any of the models created by these algorithms might suffer from
- Interactivity of Viz:
    -   can click to see history of XXX
    -   put a timeline to see how XXX changes
    -   check boxes for XXX
- sigmoid is used in
    - Neural nets – to determine the output value of a neuron
    - logistic regression – to classify the incoming (unknown) data point into one of two classes, depending on the sigmoid function's value being <0.5 or >0.5
- BSP: alternative to map reduce
- YARN capabilities: better scalability, graph processing
- Choropleth map shows spatially-varying data
- Big data generated:
    -  People: buying habits (eg. at Ralph's), clickstreams (eg. at Amazon) 
    -  Machines/sensors: FitBit device, road sensors
-  Why we have big data: Because now we have the perfect storm of data storage (disk space is cheap!) and virtually unlimited computing power (via the 'cloud'), and Hadoop/MapReduce for efficient processing.
-  Hadoop/YARN allows mapping and reducing, ie. <B> parallel</B> processing of data analysis computations.
-  make Data Viz better: color, interactivity, animation, VR
-  Neural neworks are typically organized in layers.
-  R types: vector, data frame
-  Pig and TF help carry out dataflow computation
-  Spark addons: Spark SQL, Spark Streaming
-  Spark makes Big Data real-time and interactive
-  trellis view: Multivariate data visualization
-  regression-related alternatives: non-linear regression, regression tree
-  why ML is popular:  Layers of neurons with nonlinear (eg. sigmoid) activation functions makes it possible to approximate any smooth, continuous signal with low- enough error
-  optional ‘Combine’ step in MapReduce: A combiner performs local reduction, where it collates values of multiple identical keys output by a mapper