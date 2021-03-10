# Private Dockers

When you set up a private registry, you assign a server to communicate with Docker Hub over the internet. If you are pulling Dockers in Docker Hub from the private registry, then provide _**`secrets.yml`**_ with the Docker Hub credentials and set the following flag in:

```text
group_vars/all.yml
```

Update with **`versions.yml`** your Dockers versions.

