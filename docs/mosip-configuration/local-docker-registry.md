# Local Docker Registry

This part contains information about hosting your own registry using the Local Docker Registry.

**Local Registry on Console**

Instead of using the default Docker Hub, you may run a local Docker registry. This is particularly useful when the Kubernetes cluster is sealed for protection on the Internet. With this sandbox, a sample Docker registry implementation is available, and you can run the same by triggering the following in **`group_vars/all.yml`**.

```text
    docker:
      local_registry:
        enabled: true
        image: 'registry:2'
        name: 'local-registry'
        port: 5000
```

Notice that this register is running on the computer on the console and can be accessed as **`console.sb:5000`**. Control is through _**http**_ and not through _**https**_.

Ensure that in this registry you pull all the appropriate Dockers and update **`versions.yml`**.

_**Caution**_: If you delete/reset this registry or restart the console computer, all the registry contents will be lost and the Dockers will have to be removed again.

**Additional Local Registries**:

If you wish to have additional local registries for Dockers, then list them here:

```text
    docker:
      registries:
        - '{{groups.console[0]}}:{{local_docker_registry.port}}'   # Docker registry running on console
```

The list here is necessary to ensure that _**http**_ access from cluster machines is allowed for the above registries.

