# Deployment Architecture Upgrade

This document outlines the steps required for migrating the deployment architecture from V2 to V3.

## Step 1: New environment setup with V3 Architecture 

This is required for migration from V2 to V3 architecture

1. Make sure to have all the pre-requisites ready as per the details present in the section [pre-requisites](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#pre-requisites)

2. Setup Wireguard [Bastion host](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#wireguard)

3. Setup wireguard client in your local and complete the [configuration](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setup-wireguard-client-in-your-pc)

4. Setup [Observation K8 cluster](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-setup-and-configuration)

5. Configure [Observation k8 cluster](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-ingress-and-storage-class-setup)

6. Observation cluster’s [nginx setup](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setting-up-nginx-server-for-observation-k8s-cluster)

7. Observation cluster [applications setup](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-apps-installation)

8. Observation cluster [keycloak-rancher integration](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#keycloak-rancher-ui-integration)

9. Setup new [MOSIP k8 cluster](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#mosip-k8s-cluster-setup)

10. MOSIP k8 cluster [configuration](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#mosip-k8-cluster-global-configmap-ingress-and-storage-class-setup)

11. MOSIP cluster [nginx setup](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#mosip-k8-cluster-nginx-server-setup)

12. Setting up [Monitoring](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#monitoring-module-deployment) for MOSIP cluster

13. Setting up [Alerting](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#alerting-setup) for MOSIP cluster

14. Setting up [Logging](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#logging-module-setup-and-installation) for MOSIP cluster

## Step 2: Deployment of external services  

(Required for V2 to V3 architecture migration)

1. Setup [postgres server](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/postgres/README.md)

   **Note**:
   
   i. Deploy postgres server in a seperate node.
   
   ii. Make sure postgres initialisation is not done (only install postgres).

3. Setup [Keycloak server](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/iam#install)

   **Note**: Make sure keycloak initialisation is not done (only install keycloak).

4. Setup [Softhsm](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/hsm/softhsm/README.md#install)

5. Setup [Minio server](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/object-store/minio/README.md#helm-chart-based-install)

6. Setup [ClamAV](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/antivirus/clamav/README.md#install)

7. Setup [ActiveMQ](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/activemq/README.md#install)

8. Setup [Message Gateway](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/msg-gateway/README.md#email-and-sms-gateways)

9. Setup docker [registry secrets](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/docker-secrets/README.md) if you are using private dockers.

   **Note**: These instructions are only applicable if you need to access Private Docker Registries. You may disregard them if all of your Docker containers are downloaded from the public Docker Hub.

10. Setup [Captcha](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/captcha/README.md#install) for the required domains.

11. Setup [Landing page](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/landing-page/README.md#install) for new MOSIP cluster.

## Step 3: Backup and restoration of external services

This step is required for V2 to V3 architecture migration.

1. Softhsm (only required if softhsm is used instead of real HSM)

   i. [Backup keys](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/hsm/softhsm#backup)

   ii. [Restore old key](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/hsm/softhsm#restore) 

   iii. Update softhsm ida and softhsm kernel security pin

2. Postgres 

   i. [Export](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/postgres#db-export) 

   ii. [Import](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/postgres#db-import)

   iii. secret creation

   iv. Increase postgres `max_connections` to 1000

3. Keycloak 

   i. [Export](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/iam#export)

   ii. [Import](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/iam#import)

4. Minio 

   i. Export the existing Minio as directory

   ii. [Clone Minio](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/object-store/minio#minio-clone)

5. Kafka  

   i. setup external minio for backup.  

   ii. backup kafka  

   iii. restore kafka 

6. Conf-secrets 

Update the secrets in existing secrets in [conf-secrets namspace](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/mosip/conf-secrets#secrets-to-be-updated-for-migartion-scenerios).

7. Packets in landing to be copied from old environment to the upgraded environment or same NFS folder can be mounted to regproc packet server and group 1 stage groups. Refer [here](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/mosip/regproc/upgrade) for more details.

 * dmz-sc.yaml

 * dmz-pkt-pv.yaml

 * dmz-pkt-pvc.yaml

 * dmz-landing-pv.yaml

 * dmz-landing-pvc.yaml
