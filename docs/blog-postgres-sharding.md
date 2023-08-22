# Introduction to Postgres Sharding in MOSIP - Part A

_**What is Sharding?**_

Sharding is another name for "horizontal partitioning" of a database. Horizontal partitioning is a design principle whereby rows of a database table are held separately, rather than splitting by columns (as for normalization). Each partition forms part of a shard, which may in turn be located on a separate database server or physical location. The advantage is the number of rows in each table is reduced (this reduces index size, thus improves search performance). 

Firstly, each database server is identical, having the same table structure. Secondly, the data records are logically split up in a sharded database. Unlike the partitioned database, each complete data record exists in only one shard (unless there's mirroring for backup/redundancy) with all CRUD operations performed just in that database. This thus represents a different way of organizing a logical database into smaller parts.

_**Advantages of Sharding**_

As previously explained, sharding is the process of distributing a database into smaller parts and deploying them onto worker nodes based on a specific shard ID. When a query is executed, the coordinator node uses the shard ID to direct the query to the appropriate worker node.

Sharding is primarily utilized to address concerns related to performance, high availability, and data distribution within the database.

1. **Performance**: Sharding effectively divides the data among multiple machines instead of relying on a single machine, ensuring that each machine carries a subset of the data. This distribution of data allows each machine to handle a specific workload, ultimately improving overall system performance.

2. **High Availability**: Sharding provides fault tolerance and high availability by distributing the data across multiple shards and machines. In the event of a node or machine failure, only a fraction of the data is affected, as it has been distributed across different shards and machines.

3. **Data Distribution**: Sharding ensures that the data is evenly distributed throughout the cluster. By successfully distributing the data, sharding helps to maintain a balanced workload across the cluster, preventing any single machine from becoming overloaded.

_**When did we notice the need to implement this?**_

* Typically, when discussing data on a national scale, it involves a significant number of table records.
* Within MOSIP, the IDA module includes the `Identity_cache` table, which stores both demographic and biometric information of residents.
* Furthermore, there are restrictions on the maximum size of tables due to physical limitations.
* To address this issue, it seemed appropriate to partition the data into multiple tables without requiring extensive code modifications.
* Additionally, optimizing performance is also necessary for handling usage at a national scale.

_**Why was the decision made to implement sharding instead of partitioning?**_

* One notable distinction between the two approaches is that partitioning requires modifications to the code, whereas sharding has minimal impact on the codebase.
* Sharding enables the distribution of data across multiple worker nodes, resulting in enhanced performance.

_**What is Citus and why are we selecting it?**_

Citus is a fully open-source solution that has shown success in managing large-scale systems. The advantage of Citus lies in its seamless implementation of sharding, eliminating the need for any code modifications.

To know more, refer [Citus documentation](https://docs.citusdata.com/en/v12.0/get_started/what_is_citus.html).

Stay tuned to learn more about how it is implemented in MOSIP!
