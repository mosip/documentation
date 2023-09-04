# Postgres Sharding in MOSIP - Part B

In our previous blog, we explored the concept of sharding and its many advantages. Now, let us delve into how we have implemented this technique in MOSIP.


## What is Citus and how did we apply it in MOSIP?


Citus is an open-source extension to PostgreSQL that enables the partitioning of the database into smaller segments and deploying them across multiple machines known as Worker nodes. Whenever a query is executed, Citus intelligently directs it to the relevant node based on the Shard ID in order to retrieve the desired data. 

In the Citus system, the process of inserting or updating data involves several steps:

1. When a data insertion or update occurs, the data is transmitted to the **coordinator node**.
2. The coordinator node identifies the appropriate shard for the data based on the predetermined sharding logic.
3. The coordinator node then forwards the data to the **worker nodes** that are assigned to the corresponding shard.
4. The worker nodes receive the data and execute the necessary insert or update operations on their respective shards.
5. In cases where data replication is required for increased availability, the worker nodes handle the replication internally.
6. Once the operations are completed on the worker nodes, the coordinator node confirms the success of the process and sends the result back to the client.

The coordinator node plays a central role in the Citus system as it handles sharding and rebalancing tasks. It serves as the entry point for client connections and coordinates distributed queries across the worker nodes.

The worker nodes, on the other hand, collaborate with the coordinator node to receive and process queries. They assume the responsibility of storing data in a distributed manner within the system.


## Setting Up a Citus Cluster

In order to establish a Citus cluster, it is necessary to have a minimum of three machines. Among these, one machine serves as the Coordinator node, while the remaining two machines function as Worker nodes.

### Using docker image

If you are utilizing the Docker image of Citus, please refer to the following instructions for setting up a Citus Cluster:

1. **Install Postgresql**: As Citus is an extension to Postgresql, it is necessary to install postgresql on each Node of the Cluster, including the coordinator node.

2. **Add Citus Extension**: Once Postgresql is installed on all nodes, proceed to start the service and connect to the Database where you intend Citus to operate. Utilize the following command:

Command: CREATE EXTENSION citus;

#### How to choose the correct docker image of Citus

When choosing the appropriate Docker image of Citus for your environment, it is important to consider the compatibility between Citus and your PostgreSQL version. To do this, please follow the steps outlined below:

1. **Determine your PostgreSQL version**: Take note of the version of PostgreSQL currently installed in your environment. This information can be obtained by using the psql command-line tool or referring to the documentation of your PostgreSQL installation.

2. **Visit the Citus Docker Hub repository**: Access the Citus Docker Hub repository by visiting https://hub.docker.com/r/citusdata/citus.

3. **Browse available tags**: Within the Docker Hub repository, you will find a variety of tags associated with different versions of Citus. Each tag is linked to a specific Citus version that is compatible with a particular PostgreSQL version.

4. **Match Citus version with PostgreSQL version**: Locate the Citus version tag that corresponds to your PostgreSQL version. For instance, if you are using PostgreSQL 13, search for a Citus image tag indicating compatibility with PostgreSQL 13.

5. **Pull the Docker image**: Once you have identified the appropriate Citus Docker image tag, utilize the `docker pull` command to download the image to your local machine. The command should resemble the following format:

           `docker pull citusdata/citus:<tag>`

Replace "<tag>" with the specific version tag identified in step 4.

#### Using Machines directly

If you are directly utilizing machines, we recommend referring to the official Citus Documentation for instructions on setting up a Citus Cluster. The link provided below guides users step-by-step through the setup process for Ubuntu or Debian.
Link: [Ubuntu or Debian - Citus 12.0 documentation](https://docs.citusdata.com/en/stable/installation/multi_node_debian.html)

Once the Citus Cluster Setup is completed, the next step is to configure the Coordinator and Worker nodes.

To set up the Coordinator node in the Citus Cluster, please use the following command:

`SELECT citus_set_coordinator_host('Hostname', Port_No);`

For setting up or adding worker nodes in the Citus Cluster, please use the command below:

`SELECT * from citus_add_node ('Hostname', Port_No);`
