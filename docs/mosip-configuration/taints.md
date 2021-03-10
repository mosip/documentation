# Taints

A taint allows a node to refuse pod to be scheduled unless that pod has a matching toleration. _Kubernetes_ offers the functionality of taints to run a pod solely on a node. This is especially useful during performance tests where you would like to assign different nodes to non-MOSIP components.

By default, in the sandbox, taints are not added. The following modules have been provided with provisions to allow taints for:

* Postgres
* Minio
* HDFS

  Set the following in group **`vars/all.yml`** to allow **`taint`. EXAMPLE:**

  ```text
  postgres:
    ...
    ...
    node_affinity:
        enabled: true # To run postgres on an exclusive node
        node: 'mzworker0.sb' # Hostname**. Run only on this node, and nothing else should run on this node
    taint:
        key: "postgres" # Key for applying taint on node
        value: "only"
  ```

  The node here is the machine on which you would like to exclusively run the module.

Ensure the above setting is done before you install the sandbox.

