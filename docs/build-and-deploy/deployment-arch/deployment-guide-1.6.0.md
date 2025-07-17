# eSignet 1.6.0 - On-Prem Installation Guide

## Esignet Deployment in Kubernetes Environment

### Overview

* This guide will walk you through the deployment process of the Esignet application.
* The setup involves creating
  * Kubernetes cluster
  * Setting up Nginx
  * Installing Istio
  * Configuring storage class
  * Configuring the necessary dependent services
  * Deploying Esignet services

### Deployment

#### K8 cluster

* Kubernetes cluster should be ready with storage class and ingress configured properly.
* Below is the document containing steps to create and configure K8 cluster.
  * **Onprem RKE CLuster** : Create RKE K8 cluster using mentioned [steps](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#mosip-k8s-cluster-setup-using-rke).
    * **Persistence** : Setup storage class as per [steps](https://github.com/mosip/k8s-infra/tree/v1.2.0.1/mosip/on-prem#storage-classes).
    * **Istio service mesh** : Setup Istio service mesh using [steps](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#istio-for-service-discovery-and-ingress).
    * **Nginx** : Setup and configure nginx as per [steps](https://github.com/mosip/k8s-infra/blob/v1.2.0.2/mosip/on-prem/nginx).
    * **Logging** : Setup logging as per [steps](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/logging).
    * **Monitoring** : Setup monitoring consisting elasticsearch, kibana, grafana using [steps](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/monitoring).
  * **AWS EKS cluster** : Create AWS EKS cluster using mentioned [steps](https://github.com/mosip/k8s-infra/tree/main/mosip/aws#mosip-cluster-on-amazon-eks).
    * **Persistence** : Setup storage class as per [steps](https://github.com/mosip/k8s-infra/tree/main/mosip/aws#persistence).
    * **Ingress and Loadbalancer** : Setup nginx and configure NLB for exposing services outside using [steps](https://github.com/mosip/k8s-infra/tree/main/mosip/aws#ingress-and-load-balancer-lb).
    * **Logging** : Setup logging as per [steps](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/logging).
    * **Monitoring** : Setup monitoring consisting elasticsearch, kibana, grafana using [steps](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/monitoring).

#### Install Pre-requisites

* `esignet-global` configmap: For eSignet K8's env, `esignet-global` configmap in `esignet` namespace contains Domain related information. Follow below steps to add domain details for `esignet-global` configmap.
  *   Copy `esignet-global-cm.yaml.sample` to `esignet-global-cm.yaml`.

      ```
       cp esignet-global-cm.yaml.sample esignet-global-cm.yaml
      ```
  * Update the domain names in `esignet-global-cm.yaml` correctly for your environment.
  * Create a google recaptcha v2 ("I am not a Robot") from Google with required domain name ex:\[sandbox.mosip.net] [Recaptcha Admin](https://www.google.com/recaptcha/about/) and set esignet captcha.
  * External IAM scope: \[TODO]
    * If using an external IAM, copy the secrets from the external IAM and create a secret named keycloak-client-secrets in the esignet namespace.
*   Install pre-requisites

    ```
    ./install-prereq.sh
    ```

#### Initialise pre-requisites

* Update values file for postgres init here.
*   Execute `initialise-prereq.sh` script to initialise postgres and keycloak.

    ```
    ./initialise-prereq.sh
    ```

#### Install esignet and oidc

During deployment, the system will prompt for user input to select the appropriate plugin. The available options are listed below:

1. esignet-mock-plugin
2. mosip-identity-plugin
3. sunbird-rc-plugin
4. custom-plugin"

```
./install-esignet.sh
```

### Onboarder

* There are two ways to proceed, either with mosip identity plugin or with mock plugin.

#### MOSIP Identity Plugin

* If Esignet is getting deployed with MOSIP then we need to execute the onboarder for MISP partner and mock-rp oidc clientId.
* Onboarder scripts.

#### MOCK Plugin

Download and import eSignet-with-mock.postman\_environment.json and eSignet.postman\_collection.json postman collection from here)

## OIDC Client Management Instructions

1. Fetch the Authentication Token\
   Navigate to "OIDC Client Mgmt" → "Mock" → "Get Auth Token" to retrieve the authentication token.
   * Update the client\_secret (retrieve it from the keycloak-client-secrets).
   * Update the iam\_url (Keycloak URL) in the request body.
     * Retrieve the Keycloak URL from the config-map under keycloak-host → keycloak-external-url.
2. Fetch the CSRF Token
   * Navigate to "OIDC Client Mgmt" → "Mock" → "Get CSRF Token" to obtain the CSRF token.
   * Update the "url" to ge the CSRF Token.
3. Update the Request Fields for OIDC Client Creation
   * Before executing the "Create OIDC Client" request, update the following fields in the request body:
     * url
     * logo-uri
     * redirect-uri
     * client-name
     * client-id
4. Update the clientId in Deployment
   * Once the clientId is created and activated, update the clientId in the mock-relying-party-ui deployment.
5. Update the Client Private Key
   * Retrieve the `client-private-key` from the **eSignet-with-mock** Postman environment, as shown in the image below:\
     \*
     * Encode the retrieved `client-private-key` using Base64.
     * Update the Base64-encoded `client-private-key` in the **mock-relying-party service secret**.

{% hint style="warning" %}
**Note**: This deployment is limited to mock, Section below, related to configuring IDA is not tested. Still it can be tried out
{% endhint %}

#### CONFIGURE IDA for Esignet&#x20;

Onboard eSignet as MISP partner in MOSIP PMS using our onboarder script\
We should override properties defined [here](https://github.com/mosip/esignet-plugins/blob/release-1.3.x/mosip-identity-plugin/src/main/resources/application.properties) if there is any change in the MOSIP IDA domain names.\
Update the 'MOSIP\_ESIGNET\_AUTHENTICATOR\_IDA\_SECRET\_KEY' property with MOSIP IDA keycloak client secret.
