# Deployment Guide

### Overview

This deployment guide provides a comprehensive, step-by-step approach to deploying and configuring eSignet on a Kubernetes based infrastructure and environment. The guide expects you to have the necessary Kubernetes infrastructure in place and required tools to integrate eSignet with various identity systems (MOSIP, Sunbird RC or Custom).

#### Deployment Architecture of eSignet

The diagram below illustrates the **deployment architecture** of the eSignet, highlighting secure user access via VPN, traffic routing through firewalls and load balancers, and service orchestration within a Kubernetes cluster.

* **Key Components**: eSignet Service, OIDC UI, databases, and secure cryptographic operations via HSM.
* **Deployment**: Managed with Rancher, Helm charts, and a private Git repository.
* **Monitoring**: Ensured using Grafana and Prometheus for observability.

#### How is this guide structured and organized?

1. [**Introduction**](deployment-guide.md#overview): Provides an overview of the eSignet stack + ID System, deployment scenarios, required skill sets and system architecture.
2. [**Prerequisites**](deployment-guide.md#prerequisites): Outlines infrastructure details, hardware/software/network requirements, and initial setup steps.
3. [**Deploy eSignet Prerequisites**](deployment-guide.md#deploy-esignet): Describes running `install-prereq.sh` script, which interactively installs required dependencies such as PostgreSQL, Keycloak, Redis, HSM (or key management), Kafka, API access control, and captcha validation service. The script prompts you to confirm or skip each component based on your environment, allowing you to reuse existing infrastructure or install new services as needed.
4. [**Deploy eSignet Services**](deployment-guide.md#deploy-esignet-services): When you run the install script for eSignet services, it guides you through selecting the appropriate identity management plugin (e.g., MOSIP, Sunbird RC, or custom). Based on your choice, the script deploys eSignet services configured to integrate seamlessly with your selected identity system. This section provides detailed instructions for each integration scenario, ensuring a smooth deployment process.
5. [**Contribution and Community**](deployment-guide.md#link): Highlights how you can contribute code, share feedback, or reach out for support while working with the application.

Each section provides direct steps and references to external resources for a streamlined deployment experience.

### eSignet Deployment and Integration Scenarios

There are different use cases for eSignet and therefore eSignet can be deployed around various scenarios. Few such examples can include enabling secure digital signatures for online transactions, integrating with national ID systems for authentication, supporting e-Government services, onboarding users for financial or healthcare applications, or providing identity verification for educational platforms.

However here within the scope of this deployment guide we will focus on how eSignet can be deployed and integrated with various identity systems. The deployment flow and integration steps may differ based on your existing setup. Below are the typical scenarios and recommended approaches.

{% hint style="success" %}
**Note**: The scenario part is discussed here [Deploy eSignet Services](deployment-guide.md#deploy-esignet-services) and here you are asked to choose the plugin you want to use for identity management.
{% endhint %}

How eSignet can work with different Id systems:

*   **eSignet + Mock**: Mock ID (New) + eSignet (New):

    This scenario deploys eSignet with a mock identity provider, allowing you to simulate authentication and authorization flows without integrating with a real ID system. It is ideal for development, testing, and demonstrations, requiring no external dependencies or onboarding steps.
*   **eSignet + MOSIP**: MOSIP (Exists) + eSignet (New)

    eSignet + MOSIP refers to integrating eSignet with the MOSIP identity system. In this scenario, eSignet leverages MOSIP as the identity provider, enabling secure authentication and digital signature workflows based on MOSIP-managed identities. This setup is suitable for environments where MOSIP is already deployed or planned, ensuring seamless identity verification and trust.
*   **eSignet + Identity System (Non-MOSIP)**: Non-MOSIP ID (Exists) + eSignet

    This scenario involves integrating eSignet with an existing non-MOSIP identity system. It allows organizations to leverage their current identity management solutions while incorporating eSignet's digital signature capabilities. This approach is ideal for environments where a different identity provider is already in place, ensuring compatibility and streamlined user experiences.
*   **eSignet + Sunbird RC**

    * Sunbird RC (Exists) + eSignet (New)

    This scenario focuses on integrating eSignet with the Sunbird RC identity system. It enables eSignet to utilize Sunbird RC for identity management, facilitating secure authentication and digital signature processes. This setup is particularly beneficial for organizations that have already implemented Sunbird RC, allowing them to enhance their identity verification and trust mechanisms with eSignet's features.

## Prerequisites

The prerequisite section is segregated into two parts:

* **Developer Workstation Profile**: This section lists the tools and utilities you need to have installed on your personal computer to create/manage the k8's cluster and deploy eSignet on it.
* **Developer Environment Setup**: This section lists the specific configurations and settings required for your development environment to work effectively with eSignet.
* **Cloud Environment Profile**: This section lists the hardware/software/network requirements for the Kubernetes based server infrastructure where you will deploy eSignet.

### Developer Workstation Profile

The **Developer Workstation Profile** lists the common tools and utilities which you will need to have installed on your personal computer to be able to create/manage the k8's cluster and deploy eSignet on it.

#### Operating Systems

The eSignet can be deployed with a PC having one of the following operating systems, however for this guide we have considered a linux machine with Ubuntu 22.04 LTS.

* **Linux** (Ubuntu 22.04 LTS - recommended for production deployments)
* **Windows**
* **macOS (OSX)**

#### Development Environment Setup

You should have these tools installed on your local machine from which you will be running the kubectl, connect to the k8s cluster and manage the deployment.

* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html) - version > 2.12.4
* Command line utilities:
  * [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)- version 2.12.4 or higher
  * [helm](https://helm.sh/docs/intro/install/)- any client version above 3.0.0 and add below repos as well

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add mosip https://mosip.github.io/mosip-helm
```

* [rke](https://rancher.com/docs/rke/latest/en/installation/) : version: [1.3.10](https://github.com/rancher/rke/releases/tag/v1.3.10)
* [Istioctl](https://istio.io/latest/docs/setup/getting-started/#download) : version: 1.15.0
* Wireguard Client - Refer to the [Setup Wireguard Client on your PC](../../readme/setup/deploy.md#setup-wireguard-client-on-your-pc) section for the instructions.

### Cloud Environment Profile

**Server Requirements Prerequisites**: Kubernetes based server infrastructure is required to deploy eSignet. It can either have the Identity System (like MOSIP) already deployed on it or you can deploy eSignet along with the ID system.

## Deploy eSignet

The sub sections broadly outline the deployment process for eSignet which considers deploying it with or without Identity system (like MOSIP).

Deployment will broadly start and proceed as follows: The deployment process includes the following key steps:

* **Validate Existing ID System**: Ensure that your current identity system (such as MOSIP or Sunbird RC) is operational and healthy before proceeding with eSignet deployment.
* **Set Up Namespaces and Configurations**: Create and configure the necessary Kubernetes namespaces (e.g., `esignet`, `mosip`) and prepare configuration files required for eSignet.
* **Install and Initialize Prerequisites**: Deploy and initialize all required dependencies, such as PostgreSQL, Keycloak, Redis, HSM/key management, Kafka, and API access control, using the provided installation scripts.
* **Deploy Core eSignet Services**: Install the main eSignet services and select the appropriate identity management plugin (MOSIP, Sunbird RC, Mock, or Custom) as per your integration scenario.
* **Onboard eSignet as a MOSIP Partner**: If integrating with MOSIP, onboard eSignet as a MISP partner and configure the OIDC client for secure authentication and authorization.
* **Verify Deployment**: Check the status of deployed pods and services to confirm successful installation and operation.
* **Optional Components**: For comprehensive testing and integration, optionally deploy the OIDC UI and mock relying party components to simulate end-to-end flows.

Follow the subsections below for detailed instructions

### Get access to the 'Deployment Environment' (Kubernetes Cluster and Namespaces) where you will deploy eSignet

Ask your System Administrator of the 'Deployment Environment' to provide you access. This typically involves:

* Access to the Kubernetes cluster (kubeconfig file).
* Access to the relevant namespaces (e.g., `mosip`, `esignet`).
* Ensure you have the necessary permissions to create resources in these namespaces.
* Access to any required secrets or configuration files.

### Request DevOps team for below items

* Kubeconfig file for the cluster (This will also contain namespace permissions).
* Confirm MOSIP is running and healthy
* Set up kubectl access

````sh
# Set KUBECONFIG environment variable
export KUBECONFIG=/path/to/your/kubeconfig

# OR copy to default location
cp kubeconfig ~/.kube/config

```sh
* Check cluster context

# Confirm you are operating in the correct cluster context:
kubectl config get-contexts
kubectl config use-context <desired-context>

````

> Note: Above mentioned environment variables will be used throughout the installation to move between one directory to other to run install scripts.

### Verify existing 'ID System' next to which you will deploy eSignet

In case you are deploying eSignet with an ID System (like MOSIP), you should first validate that the existing ID System is healthy and operational, after which you can deploy.

We have considered MOSIP for an example and scope of this document.

```sh
# Test cluster connectivity
kubectl get nodes

# Check MOSIP deployment status
kubectl get pods -n <namespace>
kubectl get svc -n <namespace>

# Verify key MOSIP services are running
kubectl get pods -n mosip | grep -E "(ida|pms|kernel|postgres|keycloak|redis)"

```

### Clone eSignet Repository

This allows you to access the deployment scripts and configuration files required for installing eSignet.

{% hint style="success" %}
**Note**: Before cloning the repository, you should first ensure your `kubectl` is configured to access the target Kubernetes cluster and that you have the necessary permissions for the relevant namespaces. Once connectivity is verified, you should run the provided deployment scripts (such as `install-prereq.sh`, `initialise-prereq.sh`, and `install-esignet.sh`) from your local machine.
{% endhint %}

```sh
# Clone eSignet repository
git clone https://github.com/mosip/esignet.git
cd esignet/deploy
```

### Deploy eSignet services

Once steps mentioned above are complete and you have verified access, proceed with the deployment scripts as explained below.

#### Install Prerequisites

The prerequisites that you install ensures that the environment is ready for deploying eSignet core services and plugins.

{% hint style="success" %}
**Note**: What if I already have some of these dependencies (prerequisites) installed? If you already have dependencies like Postgres or Keycloak installed as part of your existing ID System (e.g. MOSIP) setup, you can skip the particular component and the respective prompt and jump to the next prompt to proceed on with the running script.
{% endhint %}

When running the install scripts, you are prompted to make selections for various components and configurations. This section of the guide outlines the prompts you can expect, along with guidance on when to answer 'y' (yes) or 'n' (no) based on your environment.

Some prompts are chained — your response to one may trigger additional questions. Review the following section to familiarize yourself with the installation flow and prepare your answers in advance for a smoother deployment experience.

#### What all gets installed with 'Prerequisites Installation'?\*\*

This sets up dependencies like Postgres, Keycloak, Redis, and other required services. The following components are installed as prerequisites for eSignet deployment:

* **PostgreSQL**: Database backend for eSignet services.
* **Keycloak**: Identity and access management service.
* **Redis**: In-memory data store for caching and session management.
* **HSM (Hardware Security Module) or Software-based Key Management**: For secure key storage and cryptographic operations.
* **apiaccesscontrol**: Service for API access management and authorization.
* **ConfigMaps and Secrets**: For storing configuration values, domain details, and sensitive credentials (e.g., `esignet-global` configmap, `keycloak-client-secrets`).
* **Supporting scripts**: Shell scripts for installation and initialization (`install-prereq.sh`, `initialise-prereq.sh`).

#### Before you run the install-prereq.sh script what basic steps you need to do?

Before running the `install-prereq.sh` script, you need to prepare the `esignet-global` configmap, which contains environment-specific configuration for eSignet.

1. **Copy the sample configmap file:**

```sh
cp esignet-global-cm.yaml.sample esignet-global-cm.yaml
```

2. **Edit `esignet-global-cm.yaml`:**

* Update domain names and other configuration values to match your deployment environment.
* Set up Google reCAPTCHA v2 by generating site and secret keys for your domain at [Recaptcha Admin](https://www.google.com/recaptcha/about/) and updating the configmap accordingly.
* If using an external IAM, copy the required secrets and create a Kubernetes secret named `keycloak-client-secrets` in the `esignet` namespace.

{% hint style="success" %}
**Note**:

1. The `esignet-global-cm.yaml` file typically contains domain names, API endpoints, and other parameters required for eSignet to function in your environment.
2. eSignet namespace is also created if it does not exist already.
{% endhint %}

Once the configmap is updated, proceed with the prerequisite installation.

#### Run the `./install-prereq.sh` script

Run the `./install-prereq.sh` script (from deploy folder) to install required services such as PostgreSQL, Keycloak, Redis, HSM (or key management), Kafka, and API access control. You will be prompted for configuration details based on your environment (e.g., whether to install or skip certain components).

```sh
./install-prereq.sh
```

**HSM**

Do you want to deploy hsm for esignet service? Please opt for 'n' if you already have hsm installed: (s - for softhsm, e - external, p - for pkcs12 based key management from mounted file)"

**Prompts**:

1. n - If you already have hsm installed
2. s - If you want to install softhsm
3. p - If you want to use pkcs12 based key management from mounted file
4. e - If you want to connect to external hsm 1. n - If you don't have external hsm setup 2. y - If you have external hsm setup
   1. \["externalhsmclient"] = "Please provide the url where externalhsm client zip is located: "
   2. \["externalhsmhosturl"] = "Please provide the hosturl for externalhsm: "
   3. \["externalhsmpassword"] = "Please provide the password for the externalhsm: "

**apiaccesscontrol**

Do you want to access control the esignet client management APIs? Please opt for 'n' if not required. Press enter for default y"

**Prompts**:

1. n - "Warning! You have chosen to skip the keycloak initialization. The internal APIs of eSignet will run without access control."
2. y - "You have chosen to initialize keycloak for access control of internal APIs of eSignet." 1. \["iamserverurl"] = "Please provide the IAM server URL: Press enter to install default keycloak for access control"

```
2.  ["adminuser"] = "Please provide admin user for initialisation"
```

```
3.  ["adminpassword"] = "Please provide admin password for initialisation"
```

**Kafka**

Do you want to deploy Kafka in the kafka namespace? Please opt for 'n' if you already have a kafka deployed: Press enter for default y"

**Prompts**:

1. n - If you already have kafka deployed 1. \["kafkaurl"] = "Please provide the kafka url: spring.kafka.bootstrap-servers"
2. y - If you want to install kafka

**Postgres**

Do you want to deploy postgres in the postgres namespace? Please opt for 'n' if you already have a postgres server deployed: Press enter for default y"

**Prompts**:

1. y - If you want to install postgres
2. n - If you already have a postgres server deployed
3. \["postgreshostname"] = "Please provide the hostname for the postgres server:"
4. \["postgresport"] = "Please provide the port number for the postgres server:"
5. \["postgresusername"] = "Please provide the username for the postgres server:"
6. \["postgrespassword"] = "Please provide the password for the postgres server:"

**Redis**

Do you want to deploy redis in the redis namespace? Press enter for default y"

**Prompts**:

1. y - If you want to install redis
2. n - If you already have a redis server deployed

```
1.  ["redishostname"] = "Please provide the hostname for the redis server:"
```

```
2.  ["redisport"] = "Please provide the port number for the redis server:"

3.  ["redispassword"] = "Please provide the password for the redis server: "
```

The installation begin as per user requirement based on the above set of questions/prompts. Once the installation is completed, you are asked to enter the details to complete the setup for captcha validation service.

**Captcha Validation Service**

Do you want to install captcha validation service? Press enter for default y

* **Warning message:** "It is not recommended to use the eSignet without captcha site key and captcha secret key in production env. Press enter to proceed.

**Prompts**:

1. y - If you want to install captcha validation service

```
1.  ["captchasitekey"] = "Please provide the captcha site key"
2.  ["captchasecretkey"] = "Please provide the captcha secret key"
```

<pre><code><strong>2. If you are opting for 'n', the captcha service installation will be skipped.
</strong><strong>Please make sure to update the below property is blank in the env properties:
</strong>mosip.esignet.captcha.required=
</code></pre>

Prerequisite installation is complete at this stage.

**Initialise Prerequisites**

Run the `./initialise-prereq.sh` script (from deploy folder) to initialize required services such as the eSignet database and Keycloak. You will be prompted for configuration details based on your environment (e.g., database credentials, IAM scope, service endpoints). Update the relevant values files before executing the script to ensure correct initialization.

```sh
./initialise-prereq.sh
```

You are prompted to answer following questions based on whether the eSignet database is present or not in the postgres server url provided above. Therefore, before you run the initialise script, update the Postgres and Keycloak values files as needed and then initialise.

1. \["postgres"] = "eSignet database was not found. Running the db scripts to create and initialize the eSignet database:"
2. Information to be added in the guide for the IAM scope in the deployment guide.
3. In the deployment script, certificate endpoint, binding endpoint and client management endpoint are to be configured as internal.

#### eSignet Services Installation

Once you have completed the pre-requisite installation and initialization, you can proceed to install the eSignet services.

**Before you run the installation script (Decision on Plugin to install)**

Before you run the installation script, you should decide which plugin you want to install, In the context of this guide this typically means which ID System you want to integrate with. Based on your decision, you should navigate to the respective folder and run the installation script.

1. **eSignet Mock Plugin** – Simulates an identity provider for testing and development; no real ID system integration required.
2. **MOSIP Identity Plugin** – Integrates eSignet with an existing MOSIP identity system.
3. **Sunbird RC Plugin** – Connects eSignet to an existing Sunbird RC identity registry.
4. **Custom Plugin** – Enables integration with any custom identity system via API access control.

**Compatibility matrix**

Here below is a compatibility matrix for different Identity Systems, eSignet versions, and plugin versions. It helps you determine which versions are compatible with each other and guides you to the appropriate integration guide/documentation. Understanding this matrix is crucial for ensuring a stable and supported deployment, avoiding integration issues, and selecting the correct components for your environment.

<table><thead><tr><th width="154.43359375">Identity System</th><th width="114.7421875">eSignet Version</th><th width="114.21484375">Plugin Version</th><th width="119.45703125">Status</th><th>Integration Guide</th></tr></thead><tbody><tr><td>MOSIP 1.2.x</td><td>1.7.0</td><td>1.3.x</td><td>Stable</td><td><a href="https://docs.mosip.io/1.2.0/interoperability/integrations/e-signet">MOSIP Integration</a></td></tr><tr><td>MOSIP 1.1.x</td><td>1.5.x</td><td>1.2.x</td><td>Legacy</td><td>Legacy MOSIP</td></tr><tr><td>Sunbird RC 2.x</td><td>1.7.0</td><td>1.0.x</td><td>Stable</td><td>Sunbird Integration</td></tr><tr><td>Custom API</td><td>1.7.0</td><td>Custom</td><td>Custom</td><td><a href="../esignet-authentication/develop/integration/authenticator.md">Plugin Development</a></td></tr></tbody></table>

If you want to install eSignet with plugins, you should navigate to the folder '**esignet-with-plugins**' and run below command:

```sh
./install.sh
```

You are prompted with following question/prompts to choose from the list of available plugins and install eSignet with only chosen plugin.

1. `esignetplugin` = Choose the required plugin to proceed with installation.
2. esignet-mock-plugin
3. mosip-identity-plugin
4. sunbird-rc-plugin
5. custom-plugin:"

The answer to the above questions is in option number - for example '1', '2', '3' or '4'.

**esignet-mock-plugin**

If you choose '**esignet-mock-plugin**', you are not prompted with any further chained questions/prompts and the installation for mock plugin is completed automatically.

When you choose the **esignet-mock-plugin** during installation, the deployment script installs eSignet with a mock identity provider integration. This setup is primarily for testing and demonstration purposes, allowing you to simulate authentication and authorization flows without connecting to a real identity system.

**Key points:**

* No additional prompts are shown; the installation proceeds automatically.
* The mock plugin provides sample endpoints and data to mimic real-world identity operations.
* You can use the mock relying party and OIDC UI to test the complete eSignet flow.
* No onboarding with MOSIP or Sunbird RC is required in this scenario.
* This setup is not recommended for production but is useful for development, testing, and API validation.

After installation, you can proceed to test eSignet using the provided mock relying party tools and Postman collections.

**mosip-identity-plugin**

If you choose `esignet-with-mosip-id` plugin, you are prompted with the questions below along with default url mentioned:

1. \["mosip.esignet.authenticator.ida.cert-url"] = "Default url: (http://mosip-file-server.mosip-file-server/mosip-certs/ida-partner.cer) Provide custom value (if applicable) to override the default url: "
2. \["mosip.esignet.authenticator.ida.kyc-auth-url"] = "Default url: (http://ida-auth.ida/idauthentication/v1/kyc-auth/delegated/${mosip.esignet.authenticator.ida.misp-license-key}/) Provide custom url (if applicable) to override the default url: "
3. \["mosip.esignet.authenticator.ida.kyc-exchange-url"] = "Default url: (http://ida-auth.ida/idauthentication/v1/kyc-exchange/delegated/${mosip.esignet.authenticator.ida.misp-license-key}/) Provide custom url (if applicable) to override the default url: "
4. \["mosip.esignet.authenticator.ida.send-otp-url"] = "Default url: (http://ida-otp.ida/idauthentication/v1/otp/${mosip.esignet.authenticator.ida.misp-license-key}/) Provide the custom url (if applicable) to override the default url: "
5. \["mosip.esignet.binder.ida.key-binding-url"] = "Default url: (http://ida-auth.ida/idauthentication/v1/identity-key-binding/delegated/${mosip.esignet.authenticator.ida.misp-license-key}/) Provide the custom url (if applicable) to override the default url: "
6. \["mosip.esignet.authenticator.ida.get-certificates-url"] = "Default url: (http://ida-internal.ida/idauthentication/v1/internal/getAllCertificates) Provide the custom url (if applicable) to override the default url: "
7. \["mosip.esignet.authenticator.ida.auth-token-url"] = "Default url: (http://authmanager.kernel/v1/authmanager/authenticate/clientidsecretkey) Provide the custom url (if applicable) to override the default url: "
8. \["mosip.esignet.authenticator.ida.audit-manager-url"] = "Default url: (http://auditmanager.kernel/v1/auditmanager/audits) Provide the custom url (if applicable) to override the default url: "
9. \["mosip.esignet.authenticator.ida.otp-channels"] = "Default channels (email,phone) Provide the required channels to override the default channels: "

**sunbird-rc-plugin**

If you choose `eSignet-with-sunbird` plugin, you are prompted with the question below:

1. `mosip.esignet.sunbird-rc.registry-get-url` = Please provide the url for sunbird registry get api:

Once the above decision inputs are taken from you, eSignet installation should be initialized and completed successfully.

If any error occurs during eSignet installation, You can start the eSignet installation again after deleting the existing chart or fix the issue.

**custom-plugin**

If you choose eSignet installation without plugin, below question is prompted:

1. `custompluginurl` = Please provide the url for the custom plugin you want to use:

Above url can be zip file or jar file, so both zip url and jar file url are supported for above variable.

Once the above input are taken from you, eSignet installation is initialised and completed successfully.

If any error occurs during eSignet installation, you are able to start the eSignet installation again after deleting the existing helm chart using delete.sh or debug the issue further.

**OIDC UI Installation**

Once eSignet installation is completed, now, you are prompted to provide relevant inputs for completing oidc ui deployment:

1. `esignetthemes` = Please provide the theme for the eSignet UI. Please choose between 'blue' or 'orange' for esignet default theme: Press enter for the default theme. Please provide URL for the custom theme"
2. `defaultlang` = Please choose the default lang for esignet. Please press enter for en
3. `idprovidername` = Please provide the name for eSignet: (Note: This name will be used instead of eSignet on the login page and in other places)"

## **Onboarding**

If you have chosen to install eSignet with mosip ID then the MISP onboarding should be initiated and completed successfully, however if you choose to continue with mock or custom plugin, no MISP onboarding is required, and this step should be skipped.

### Onboarding eSignet as MISP partner when using MOSIP ID plugin

* Use the onboarder script to register eSignet as a MISP partner and configure the OIDC client.
* Update any required properties (e.g., MOSIP IDA domain names, client secrets) as per your environment.

Refer to the [official onboarding documentation](https://github.com/mosip/esignet-plugins/blob/release-1.3.x/mosip-identity-plugin/src/main/resources/application.properties) for property overrides.

eSignet installation is completed at this step.

{% hint style="success" %}
**Note**: You can refer to the deployment guide to know more about the mock relying party portal installation, having mock relying party portal installed will be helpful to verify the complete eSignet flow.
{% endhint %}

### Onboarding relying parties

Refer to the [Relying Party Onboarding Guide](../esignet-authentication/develop/integration/relying-party/relying-party-onboarding.md) for detailed steps on how to onboard relying parties.

### Verify Deployment

You can check the status of eSignet pods after deployment, use the following command:

```sh
kubectl get pods -n esignet
```

## Documentation

* Relying Party Onboarding
  * [Relying Party Onboarding](../esignet-authentication/develop/integration/relying-party/relying-party-onboarding.md)
  * [Integration Options and Discovery Endpoints](../esignet-authentication/develop/integration/relying-party/integration-options-and-discovery-endpoints.md)
  * [Development and Integration with eSignet](../esignet-authentication/develop/integration/relying-party/development-and-integration-with-esignet.md)

