# Inji Stack deployment guide


## Doc Detective
This docs now contains the comprensive instructions to deploy inji
However It is quite lengthy
Also, We don't want to bother about the Infra Part
I also want to implement Doc-Detective
How should I implement Doc-Detective, say for eample' Inji Web Deployment section which first confirmas that the prerequisite infra is ready with VMs, DNS and more and now Inji Web can be deployed




## Resources and Youtube video transcript extraction for adding this as description for each video under 'Resources section'


* This is the full transcript
* Summarize the main purpose of the demonstration and explain its value for viewers.
* Identify and list the five most important takeaways from the video transcript.
* For each takeaway, provide a brief introductory sentence followed by a concise bullet point.
* Add your summary and key takeaways at the end of this page, ensuring no existing content is removed.



## Pulling content from repo

* The following instruction refers to the repository readme where it has described the process
* The link [link](link) takes you to the repository
* can you read the repository readme and bring content here and put it here?
* This also has listed the pre-requisites, but in this guide pre 
## Pre-requisites
* Base infrastructure setup
  * Tools and utilities to be installed locally 
  * System Requirements: Hardware, network and certificate requirements [steps](https://docs.inji.io/readme/setup/deploy#system-requirements)
  * Set up Wireguard Bastion Host [steps](https://docs.inji.io/readme/setup/deploy#wireguard)
  * K8s Cluster setup [steps](https://docs.inji.io/readme/setup/deploy#k8-cluster-setup)
  * NGINX setup and configuration [steps](https://docs.inji.io/readme/setup/deploy#nginx-for-inji-k8-cluster)
  * K8s Cluster Configuration [steps](https://docs.inji.io/readme/setup/deploy#k8-cluster-configuration)
* inji-stack-config ConfigMap [steps](https://docs.inji.io/readme/setup/deploy#pre-requisites)
* Postgres installation [steps](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/external/postgres)
  * Note: Before running the Postgres install script, update the `POSTGRES_HOST` value in `install.sh` with the correct PostgreSQL host.
* Config server secerts [steps](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip/conf-secrets)
* Config server installation [steps](https://docs.inji.io/readme/setup/deploy#config-server-installation)
* Artifactory installation [steps](https://github.com/mosip/artifactory-ref-impl/tree/v1.3.0-beta.2/deploy)

* redis installation
```
cd deploy/redis
./install.sh
```

## Initialise pre-requisites
### [DB init](../db_scripts)
* Update values file for postgres init [here](../db_scripts/init_values.yaml).
  ```
   cd ../../db_scripts
  ./init_db.sh
  ```
## Install inji certify

  ```
   cd ../inji-certify
    ./install.sh
   ```
## [inji certify apitestrig](inji-certify-apitestrig)