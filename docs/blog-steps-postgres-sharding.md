# Postgres Sharding in MOSIP - Part B

In our previous blog, we explored the concept of sharding and its many advantages. Now, let us delve into how we have implemented this technique in MOSIP.


## What is Citus and how did we apply it in MOSIP?

Citus is an open-source extension to PostgreSQL that enables the partitioning of the database into smaller segments and deploying them across multiple machines known as Worker nodes. Whenever a query is executed, Citus intelligently directs it to the relevant node based on the Shard ID in order to retrieve the desired data. 

In the Citus system, the process of inserting or updating data involves several steps:

1. When a data insertion or update occurs, the data is transmitted to the **coordinator node**.
2. The coordinator node identifies the appropriate shard for the data based on the predetermined sharding logic.
3. The coordinator node then forwards the data to the **worker nodes** that are assigned to the corresponding shard.
4. The worker nodes receive the data and execute the necessary insert or update operations on their respective shards.
5. Once the operations are completed on the worker nodes, the coordinator node confirms the success of the process and sends the result back to the client.

The coordinator node plays a central role in the Citus system as it handles sharding and rebalancing tasks. It serves as the entry point for client connections and coordinates distributed queries across the worker nodes.

The worker nodes, on the other hand, collaborate with the coordinator node to receive and process queries. They assume the responsibility of storing data in a distributed manner within the system.


## Setting Up a Citus Cluster

In order to establish a Citus cluster, it is necessary to have a minimum of three machines. Among these, one machine serves as the Coordinator node, while the remaining two machines function as Worker nodes. There are two ways to do this:

1. Using docker image
2. Using Machines directly

### Using docker image

If you are utilizing the Docker image of Citus, please refer to the following instructions for setting up a Citus Cluster:

#### How to choose the correct docker image of Citus

When choosing the appropriate Docker image of Citus for your environment, it is important to consider the compatibility between Citus and your PostgreSQL version. To do this, please follow the steps outlined below:

1. **Determine your PostgreSQL version**: Take note of the version of PostgreSQL currently installed in your environment. This information can be obtained by using the psql command-line tool or referring to the documentation of your PostgreSQL installation.

2. **Visit the Citus Docker Hub repository**: Access the Citus Docker Hub repository by visiting https://hub.docker.com/r/citusdata/citus.

3. **Browse available tags**: Within the Docker Hub repository, you will find a variety of tags associated with different versions of Citus. Each tag is linked to a specific Citus version that is compatible with a particular PostgreSQL version.

4. **Match Citus version with PostgreSQL version**: Locate the Citus version tag that corresponds to your PostgreSQL version. For instance, if you are using PostgreSQL 13, search for a Citus image tag indicating compatibility with PostgreSQL 13.

5. **Pull the Docker image**: Once you have identified the appropriate Citus Docker image tag, utilize the `docker pull` command to download the image to your local machine. The command should resemble the following format:

           `docker pull citusdata/citus:<tag>`

Replace `<tag>` with the specific version tag identified in step 4.

#### How to configure Citus docker cluster

Once multiple containers of docker image is up, the next step is to configure the Coordinator and Worker nodes.

To set up the Coordinator node in the Citus Cluster, please run the following command in coordinator node:

`SELECT citus_set_coordinator_host('Hostname', Port_No);`

For setting up or adding worker nodes in the Citus Cluster, please run the command in coordinator node for each worker node:

`SELECT * from citus_add_node ('Hostname', Port_No);`

**Add Citus Extension**: Once full cluster setup is completed, connect to the Database where you intend Citus to operate. Utilize the following command:

`CREATE EXTENSION citus;`

### Using Machines directly

If you are directly utilizing machines, we recommend referring to the official Citus Documentation for instructions on setting up a Citus Cluster. The link provided below guides users step-by-step through the setup process for Ubuntu or Debian.
Link: [Ubuntu or Debian - Citus 12.0 documentation](https://docs.citusdata.com/en/stable/installation/multi_node_debian.html)

### Trust and Configuration changes

This section describes the setup steps with the necessary configuration changes such as `wal`, trust setup, and connectivity requirements:

1. Change the `wal_level` setting in the Postgresql.conf file:
   - Locate the `Postgresql.conf` file in the path `/var/lib/postgresql/data/postgresql.conf`.
   - Use the `vim` or `nano editor` to modify the `wal_level` setting to Logical.
   - Ensure that the setting is uncommented before saving the file.
   - Afterwards, restart the postgresql service.

2. If you are using the Citus image and running it as a Kubernetes Pod:
   - Configure the Persistent Volume Claim (PVC) correctly to ensusure the data and changes made to the configuration files are preserved.
   - Restart the POD to apply the **Logical** `wal_level` setting.

_Please note that without changing the `wal_level` to `Logical`, it will not be possible to perform Citus Rebalance effectively._

3. To address any password issues you may be experiencing, it is recommended that you make changes to the `pg_hba.conf` file.

To make these changes, please use a suitable text editor such as Vim or nano to add the following line:

```
host    all     all    0.0.0.0/0    trust
```

Also, note that granting access to everyone is not advisable. To provide access to specific users, please follow the steps outlined below:

   - **Create a dedicated PostgreSQL user:** Begin by creating a PostgreSQL user specifically for passwordless login. This can be done using the createuser command or by executing SQL commands with a superuser account. For example, to create a user named "passwordlessuser", execute the following SQL command:
   ```
   CREATE USER passwordlessuser;
   ```

   - **Edit the PostgreSQL configuration file**: Open the `pg_hba.conf` file, typically located in the PostgreSQL data directory. This file controls client authentication methods and can be edited using a text editor such as Vim or nano.

   - **Configure the authentication method for the specific user**:  Within the `pg_hba.conf` file, locate the section that corresponds to the desired connection type (local, host, or hostssl). Add a new line to specify the authentication method as trust for the specific user. For example:
   ```
   TYPE  DATABASE        USER            ADDRESS                 METHOD

   host    mydatabase      passwordlessuser   0.0.0.0/0               trust
   ```

In the above configuration, `mydatabase` represents the name of the database for which you want to allow passwordless login for the `passwordlessuser` account. Adjust the parameters according to your requirements.

   - **Save and exit the file**: After making the necessary changes, save the pg_hba.conf file and exit the text editor.

   - **Restart PostgreSQL**: To apply the changes, restart the PostgreSQL service. If you are working with a Citus cluster on a Kubernetes pod, restart the pod to ensure the changes take effect.

## Steps to add additional nodes in an existing Citus Cluster

To set or add worker nodes in the Citus Cluster, run the below command in coordinator node:

    `SELECT * FROM citus_add_node('Hostname', Port_No);`

For example:

    `SELECT * FROM citus_add_node('citus-worker1', Port_No);`

    `SELECT * FROM citus_add_node('citus-worker2', Port_No);`

Please note that in addition to the hostname, you can also use a service name or an IP address to set or add worker nodes to the Citus Cluster.

## Steps to rebalance

To begin, ensure that the 'wal_level` is set to `Logical`. Next, execute the following command in coordinator node to start rebalance:

   `SELECT rebalance_table_shards('distributed_table_name');`

This command will effectively redistribute the data on the recently integrated worker nodes.

### Steps to verify the data rebalancing

Use the command below to show that the data has been sharded on newly added worker nodes.

  `SELECT * FROM pg_dist_shard_placement;`

  ![](\_images/postgres.png)

Below are the links used as references:

* [Citus Utility Functions - Citus 11.2 documentation](https://docs.citusdata.com/en/v11.2/develop/api_udf.html#citus-rebalance-start) 
* [Ubuntu or Debian - Citus 12.0 documentation](https://docs.citusdata.com/en/stable/installation/multi_node_debian.html) 
* [Useful Diagnostic Queries - Citus 11.2 documentation](https://docs.citusdata.com/en/v11.2/admin_guide/diagnostic_queries.html)
* [Real-time Analytics - Citus 12.0 documentation](https://docs.citusdata.com/en/stable/get_started/tutorial_realtime_analytics.html)   
