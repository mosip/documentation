# On Prem Deployment Guide

This guide walks through deploying and configuring eSignet on a Kubernetes-based infrastructure. It assumes you already have Kubernetes infrastructure in place and the tools needed to integrate eSignet with an identity system (MOSIP, Sunbird RC, or a mock system for testing).

## eSignet Deployment and Integration Scenarios

eSignet supports a range of use cases — secure digital signatures for online transactions, national ID authentication, e-government services, and identity verification for financial, healthcare, or educational platforms. This guide focuses specifically on deploying eSignet and integrating it with an identity system; the deployment flow and integration steps vary depending on which one you choose.

{% hint style="info" %}
The scenario is chosen during [Deploy eSignet Services](on-prem-deployment-guide.md#deploy-esignet-services), where you're asked which plugin to use for identity management.
{% endhint %}

How eSignet can work with different ID systems:

* **eSignet + Mock** — deploys eSignet with a mock identity provider, letting you simulate authentication and authorization flows without integrating a real ID system. Ideal for development, testing, and demonstrations, with no external dependencies or onboarding steps required.
* **eSignet + MOSIP** — integrates eSignet with an existing (or planned) MOSIP identity system, using MOSIP as the identity provider for authentication and digital-signature workflows based on MOSIP-managed identities.
* **eSignet + Sunbird RC** — integrates eSignet with an existing Sunbird RC identity system, using Sunbird RC for identity management and enabling secure authentication and digital-signature processes on top of it.

## Prerequisites

The prerequisites are split into three parts:

* **Developer Workstation Profile** — tools and utilities to install on your own machine to create/manage the Kubernetes cluster and deploy eSignet on it.
* **Development Environment Setup** — the specific configuration your local environment needs to work effectively with eSignet.
* **Cloud Environment Profile** — the hardware/software/network requirements for the Kubernetes-based server infrastructure eSignet will run on.

### Developer Workstation Profile

#### Operating Systems

eSignet can be deployed from a workstation running any of the following, though this guide assumes a Linux machine running Ubuntu 22.04 LTS:

* **Linux** (Ubuntu 22.04 LTS — recommended for production deployments)
* **Windows**
* **macOS (OSX)**

#### Development Environment Setup

Install the following on the local machine you'll use to run `kubectl`, connect to the Kubernetes cluster, and manage the deployment:

* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html) — version > 2.12.4
* Command line utilities:
  * [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl) — version 2.12.4 or higher
  *   [helm](https://helm.sh/docs/intro/install/) — any client version above 3.0.0, plus these repos:

      ```sh
      helm repo add bitnami https://charts.bitnami.com/bitnami
      helm repo add mosip https://mosip.github.io/mosip-helm
      ```
* [rke](https://rancher.com/docs/rke/latest/en/installation/) — version [1.3.10](https://github.com/rancher/rke/releases/tag/v1.3.10)
* [Istioctl](https://istio.io/latest/docs/setup/getting-started/#download) — version 1.15.0
* A WireGuard client — see the Wireguard client setup guide _(link to be added)_.

### Cloud Environment Profile

A Kubernetes-based server infrastructure is required to deploy eSignet. It can either already have the identity system (such as MOSIP) deployed on it, or you can deploy eSignet alongside the identity system.

## Deploy eSignet

The subsections below cover deploying eSignet with or without an existing identity system (such as MOSIP).

{% stepper %}
{% step %}
### Get access to the deployment environment

Ask your system administrator for access to the Kubernetes cluster and namespaces where you'll deploy eSignet. This typically includes:

* Access to the Kubernetes cluster (a kubeconfig file).
* Access to the relevant namespaces (e.g. `mosip`, `esignet`).
* Permission to create resources in those namespaces.
* Access to any required secrets or configuration files.
{% endstep %}

{% step %}
### Request the following from your DevOps team

* A kubeconfig file for the cluster (this also carries namespace permissions).
* Confirmation that MOSIP is running and healthy.
* `kubectl` access, set up as follows:

```sh
# Set the KUBECONFIG environment variable
export KUBECONFIG=/path/to/your/kubeconfig

# OR copy it to the default location
cp kubeconfig ~/.kube/config

# Confirm you're operating in the correct cluster context
kubectl config get-contexts
kubectl config use-context <desired-context>
```

{% hint style="info" %}
The `KUBECONFIG` variable set here is used throughout the rest of the installation, as you move between directories to run the install scripts.
{% endhint %}
{% endstep %}

{% step %}
### Verify the existing ID system

If you're deploying eSignet alongside an existing identity system (such as MOSIP), validate that it's healthy before proceeding. This guide uses MOSIP as its example:

```sh
# Test cluster connectivity
kubectl get nodes

# Check MOSIP deployment status
kubectl get pods -n <namespace>
kubectl get svc -n <namespace>

# Verify key MOSIP services are running
kubectl get pods -n mosip | grep -E "(ida|pms|kernel|postgres|keycloak|redis)"
```
{% endstep %}

{% step %}
### Clone the eSignet repository

```sh
git clone https://github.com/mosip/esignet.git
cd esignet/deploy
```

{% hint style="info" %}
Before cloning, make sure `kubectl` is configured for your target cluster and that you have the necessary namespace permissions. Once connectivity is verified, run the deployment scripts below (`install-prereq.sh`, `initialise-prereq.sh`, `install.sh`) from your local machine.
{% endhint %}
{% endstep %}
{% endstepper %}

## Deploy eSignet Services

Once the steps above are complete, proceed with the deployment scripts below.

### Install Prerequisites

Installing prerequisites gets the environment ready for eSignet's core services and plugins.

{% hint style="info" %}
If you already have some of these dependencies — for example Postgres or Keycloak from an existing MOSIP setup — you can skip that component's prompt and move to the next one when running the script.
{% endhint %}

The install script prompts you for each component and configuration in turn; some prompts are chained, so answering one may trigger another. Review the prompts below and decide your answers in advance for a smoother run.

#### What Gets Installed

* **PostgreSQL** — database backend for eSignet services.
* **Keycloak** — identity and access management service.
* **Redis** — in-memory data store for caching and session management.
* **HSM** — software-based key management, or a Hardware Security Module, for secure key storage and cryptographic operations.
* **apiaccesscontrol** — service for API access management and authorization.
* **ConfigMaps and Secrets** — configuration values, domain details, and sensitive credentials (e.g. the `esignet-global` configmap, `keycloak-client-secrets`).
* **Supporting scripts** — `install-prereq.sh` and `initialise-prereq.sh`.

{% stepper %}
{% step %}
#### Prepare `esignet-global`

Prepare the `esignet-global` configmap, which holds environment-specific configuration for eSignet.

Copy the sample configmap file:

```sh
cp esignet-global-cm.yaml.sample esignet-global-cm.yaml
```

Edit `esignet-global-cm.yaml`:

* Update domain names and other configuration values to match your deployment environment.
* Set up Google reCAPTCHA v2 by generating site and secret keys for your domain at the [reCAPTCHA admin console](https://www.google.com/recaptcha/about/), and add them to the configmap.
* If you're using an external IAM, copy the required secrets and create a Kubernetes secret named `keycloak-client-secrets` in the `esignet` namespace.

{% hint style="info" %}
The `esignet-global-cm.yaml` file typically holds domain names, API endpoints, and other environment-specific parameters. The `esignet` namespace is also created here if it doesn't already exist.
{% endhint %}
{% endstep %}

{% step %}
#### Run `install-prereq.sh`

Run the script from the `deploy` folder to install PostgreSQL, Keycloak, Redis, and API access control. You'll be prompted for configuration details based on your environment.

```sh
./install-prereq.sh
```

**apiaccesscontrol** — you'll be asked whether to access-control eSignet's client management APIs (answer `n` if you don't need this; press Enter for the default, `y`):

* `n` — internal APIs run without access control.
* `y` — Keycloak is initialized for API access control. You're then asked for the IAM server URL (press Enter to install the default Keycloak instance), and, if you choose to initialize Keycloak, an admin username and password.

**Redis** — you'll be asked whether to deploy Redis in the `redis` namespace (answer `n` if you already have a Redis instance; press Enter for the default, `y`):

* `y` — installs Redis for you.
* `n` — you're then asked a follow-up, "Do you want to configure Redis?" Answer `y` to supply the hostname, port, and password for your existing Redis server below, or `n` to skip supplying them here.
  * `redishostname` — the hostname for your Redis server.
  * `redisport` — the port number for your Redis server.
  * `redispassword` — the password for your Redis server.

{% hint style="info" %}
If you're deploying Redis in the same cluster, you don't need to provide a hostname, port, or password — only supply these if Redis is running on a separate cluster.
{% endhint %}

PostgreSQL and captcha validation are auto-deployed by this script with no interactive prompt.

Prerequisite installation is complete once these prompts are answered.
{% endstep %}

{% step %}
#### Initialize prerequisites

Run the script from the `deploy` folder to initialize the eSignet database and Keycloak. You'll be prompted for configuration details such as database credentials, IAM scope, and service endpoints — update the relevant values files before running it.

```sh
./initialise-prereq.sh
```

If the eSignet database isn't already present at the Postgres server URL you provided, the script creates and initializes it.

{% hint style="warning" %}
If you customize the Postgres init values, you must keep a second file in sync, or the eSignet service will fail to connect.
{% endhint %}

*   Update the Postgres init values at `postgres/init_values.yaml`. If you're creating a new database, set the name, user, and connection details as needed:

    ```yaml
    dbName: mosip_esignet        # customize, e.g. mosip_esignet02
    dbUser: esignetuser          # customize, e.g. esignetuser02
    host: "postgres-postgresql.postgres"
    port: 5432
    ```
* If the default database name works for you, no edits are needed — proceed with the script as-is.
* **Important:** If you edit `init_values.yaml` (e.g. changing `dbName` or `dbUser`), also update the matching values in `postgres-config.yaml` in the same `postgres` directory. Otherwise eSignet won't be able to connect to the correct database or user.
{% endstep %}
{% endstepper %}

### eSignet Services Installation

Once prerequisites are installed and initialized, install the eSignet services themselves.

Before running the install script, decide which plugin — which identity system — you want to integrate with:

1. **eSignet Mock Plugin** — simulates an identity provider for testing and development; no real identity system required.
2. **MOSIP Identity Plugin** — integrates eSignet with an existing MOSIP identity system.
3. **Sunbird RC Plugin** — connects eSignet to an existing Sunbird RC identity registry.

#### Compatibility matrix

| Identity System | eSignet Version | Plugin Version | Status | Integration Guide                                                                       |
| --------------- | --------------- | -------------- | ------ | --------------------------------------------------------------------------------------- |
| MOSIP 1.2.x     | 1.7.0           | 1.3.x          | Stable | [MOSIP Integration](https://docs.mosip.io/1.2.0/interoperability/integrations/e-signet) |
| MOSIP 1.1.x     | 1.5.x           | 1.2.x          | Legacy | Legacy MOSIP                                                                            |
| Sunbird RC 2.x  | 1.7.0           | 1.0.x          | Stable | Sunbird Integration                                                                     |
| Custom API      | 1.7.0           | Custom         | Custom | [Plugin Development](/broken/pages/1aa0f8fdc037c33a84204a6aa52eec4ae59b02ab)            |

To install eSignet with plugins, navigate to the `esignet` folder inside `deploy` and run:

```sh
./install.sh
```

{% hint style="info" %}
A top-level wrapper is also available — `./install-esignet.sh`, run directly from the `deploy` folder. It prompts once for "with plugins" vs. "without plugins," moves into the `esignet` folder for you, and always installs the OIDC UI in the same run. This is a shortcut over the step-by-step process below, not a different mechanism.
{% endhint %}

The script asks you to choose a plugin:

1. `esignet-mock-plugin`
2. `mosip-identity-plugin`
3. `sunbird-rc-plugin`

Answer with the option number — `1`, `2`, or `3`.

#### `esignet-mock-plugin`

Choosing the mock plugin needs no further chained prompts — installation completes automatically, giving you eSignet with a mock identity provider integration, primarily for testing and demonstration: simulating authentication and authorization flows without connecting to a real identity system.

During installation, the script also prompts you to configure the key manager. You can accept the defaults or provide custom values.

{% hint style="info" %}
PKCS#12 is the file-based key management option (as opposed to SoftHSM or an external hardware HSM) — your signing keys live in a keystore file mounted into the pod, rather than in a separate HSM service. It's the simplest option to get running, since it needs no extra service to deploy: a default 100 MB volume and a working keystore at `/home/mosip/config/local.p12` are provisioned automatically. At the `KEYMANAGER_PKCS12_FILE_PATH` prompt, press Enter to accept this default; only provide a custom path if you already have your own PKCS#12 keystore file to mount instead.
{% endhint %}

* **Volume size**: 100 MB by default.
* **Configuration path**: `/home/mosip/config`, via the MOSIP ConfigMap.
*   **PKCS#12 file**: defaults to `/home/mosip/config/local.p12`, or provide a custom path when prompted:

    ```sh
    Provide KEYMANAGER_PKCS12_FILE_PATH [default: /home/mosip/config/local.p12]:
    ```

**Key points:**

* The mock plugin provides sample endpoints and data that mimic real-world identity operations.
* Use the mock relying party and OIDC UI to test the complete eSignet flow.
* No onboarding with MOSIP or Sunbird RC is required.
* Not recommended for production, but useful for development, testing, and API validation.

After installation, test eSignet using the mock relying party tools and the provided Postman collections.

#### `mosip-identity-plugin`

Choosing the MOSIP identity plugin prompts you for the following, each with a default in-cluster URL you can override:

1. `mosip.esignet.authenticator.ida.cert-url`
2. `mosip.esignet.authenticator.ida.kyc-auth-url`
3. `mosip.esignet.authenticator.ida.kyc-exchange-url`
4. `mosip.esignet.authenticator.ida.send-otp-url`
5. `mosip.esignet.binder.ida.key-binding-url`
6. `mosip.esignet.authenticator.ida.get-certificates-url`
7. `mosip.esignet.authenticator.ida.auth-token-url`
8. `mosip.esignet.authenticator.ida.audit-manager-url`
9. `mosip.esignet.authenticator.ida.otp-channels` (defaults to `email,phone`)

{% hint style="info" %}
We recommend accepting the script's defaults for all nine prompts above rather than overriding them individually. Each of these URLs is itself built from an underlying `*.domain` property (e.g. `mosip.esignet.ida.auth.domain`, `mosip.esignet.authmanager.domain`) that falls back to an in-cluster short hostname such as `http://ida-auth.ida` or `http://authmanager.kernel`. There's a simpler way to point all nine at your real MOSIP IDA environment at once, rather than overriding each individually.

Once the plugin is deployed, add a **new** environment variable to the eSignet deployment. `MOSIP_API_INTERNAL_HOST` doesn't exist in the chart's `values.yaml` by default (its `extraEnvVars` block ships fully commented out), so this is an addition rather than a value to change:

```yaml
extraEnvVars: |
  - name: MOSIP_API_INTERNAL_HOST
    value: https://api-internal.sandbox.xyz.net   # replace with your environment's real internal API host
```

Setting this one property overrides every `*.domain` fallback at once — `ida.auth.domain`, `ida.otp.domain`, `ida.internal.domain`, `authmanager.domain`, and so on — replacing all the in-cluster short hostnames with your real host in a single change.

After the deployment picks this up, update the `idaclientsecret` field (`MOSIP_IDA_CLIENT_SECRET`, sourced from the `mosip_ida_client_secret` key in the `keycloak-client-secrets` Kubernetes secret) with the real value for your environment.
{% endhint %}

**HSM**

After the IDA URL prompts, the same install script asks which HSM backend the plugin should use for key management. If you've deployed eSignet before, note that this is a change: HSM selection used to happen earlier, as part of `install-prereq.sh`; it now happens here, as part of installing the plugin itself.

You're offered two choices:

1. **SoftHSM** — software-based, installed via Helm. This is the only path the script currently supports.
2. **Hardware HSM** — choosing this exits the script immediately with a message to contact the platform team. There's no option to connect an existing hardware HSM through this prompt; that has to be arranged separately.

#### `sunbird-rc-plugin`

Choosing the Sunbird RC plugin prompts you for:

1. `mosip.esignet.sunbird-rc.registry-get-url` — the URL for the Sunbird registry `get` API.

**HSM**

The same install script then asks which HSM backend to use for key management, with the same two choices and the same caveat as above: **SoftHSM** is the only supported path today, and **Hardware HSM** exits the script with a message to contact the platform team.

Once these decisions are made, eSignet installation should complete successfully. If an error occurs, delete the existing chart and retry, or resolve the underlying issue first.

#### OIDC UI Installation

Once eSignet installation completes, you're prompted for the OIDC UI deployment:

1. `esignetthemes` — choose `blue` or `orange` for the default eSignet theme (press Enter for the default), or provide a URL for a custom theme.
2. `defaultlang` — the default language for eSignet (press Enter for `en`).
3. `idprovidername` — the name to display in place of "eSignet" on the login page and elsewhere.

{% hint style="info" %}
If you use the `./install-esignet.sh` wrapper mentioned earlier, OIDC UI installation isn't a separate phase you trigger — it's bundled into the same run automatically, alongside whichever plugin module you chose.
{% endhint %}

### Multi-Plugin Deployment (Same Cluster)

{% hint style="info" %}
If you're deploying a single plugin in a cluster, none of this section applies.
{% endhint %}

Deploying multiple plugins in the same cluster requires a few manual changes to the deployment scripts:

* Create a new database for the plugin from the `db_scripts` directory:
  * Update `dbName`, `dbUser`, `host`, and `port` in `init_values.yaml` (in `db_scripts`) for the plugin being deployed.
  * Run `./init_db.sh` from the `db_scripts` directory to create the database.
* Update the namespace and `mosip-esignet-host` domain in `esignet-global.yaml` for the plugin being deployed.
* Update the namespace, eSignet service name, and SoftHSM name in the `esignet` directory's `install.sh` script for the plugin being deployed.
* Update the namespace and service name in the `oidc-ui` directory's `install.sh` script for the plugin being deployed.
* If these values change for the MOSIP identity plugin, update the namespace and eSignet service name in the `partner-onboarder` install script too.

#### Example: Sunbird plugin deployment

* Namespace: `esignet-sunbird`
* `mosip-esignet-host`: `esignet-sunbird.sandbox.mosip.net`
* eSignet service name: `esignet-sunbird`
* OIDC service name: `oidc-ui-sunbird`

### Onboarding

If you installed eSignet with the MOSIP identity plugin, MISP onboarding must be completed next. If you're using the mock plugin, no MISP onboarding is required — skip this step.

#### Onboarding eSignet as a MISP Partner (MOSIP ID Plugin)

The partner-onboarder exchanges certificates for the eSignet MISP partner. It wraps the `mosip/partner-onboarder` Helm chart and interactively collects configuration before running the onboarding job. **This is a manual step you run yourself** — it isn't triggered automatically by `install-esignet.sh` or any other script.

**Prerequisites**

* **Report storage** (the install script asks which one you want):
  * **S3** — have ready: S3 host, region, bucket name, access key, secret key.
  *   **NFS** — on your NFS server:

      ```sh
      mkdir -p /srv/nfs/mosip/<sandbox>/onboarder/
      chmod 777 /srv/nfs/mosip/<sandbox>/onboarder
      ```

      Add to `/etc/exports`:

      ```
      /srv/nfs/mosip/<sandbox>/onboarder *(rw,sync,no_root_squash,no_all_squash,insecure,subtree_check)
      ```

      Then apply and restart:

      ```sh
      sudo exportfs -rav
      sudo systemctl restart nfs-kernel-server
      ```

      Have the NFS server IP and path ready for the script prompt.
* **Keycloak** (choose one):
  * **External** — have ready: Keycloak URL, admin username/password, PMS domain (e.g. `api-internal.sandbox.mosip.net`), and PMS client secret.
  * **Internal** — the script automatically copies `keycloak-env-vars`, `keycloak`, and `keycloak-client-secrets` from the `keycloak` namespace into `esignet`. This requires `../deploy/copy_cm_func.sh` to exist and the source configmaps/secrets to already be present in the `keycloak` namespace.
* **SSL/domain status** — you'll be asked whether you have a public domain with a valid SSL certificate. Answering "no" enables insecure mode for endpoints without valid certificates.

**`values.yaml` — key fields to set**

```yaml
onboarding:
  modules:
    - name: esignet
      enabled: true

  propertiesOverride:
    esignet:
      POLICY_NAME: mpolicy-default-esignet
      POLICY_GROUP_NAME: mpolicygroup-default-esignet
      PARTNER_KC_USERNAME: mpartner-default-esignet
      PARTNER_ORGANIZATION_NAME: IIITB
      PARTNER_TYPE: Misp_Partner
      PARTNER_DOMAIN: MISP
      PARTNER_MANAGER_USERNAME: esignet-kc-mockusername
      PARTNER_MANAGER_PASSWORD: esignet-kc-mockpassword
      EXTERNAL_URL: https://esignet.sandbox.mosip.net
```

Replace the partner identity fields (`PARTNER_ORGANIZATION_NAME`, `PARTNER_TYPE`, `PARTNER_DOMAIN`, `PARTNER_MANAGER_USERNAME`/`PASSWORD`) and `EXTERNAL_URL` with values for your environment. For S3 or NFS report storage, uncomment the corresponding block in `values.yaml`.

**Run it**

```sh
./install.sh [kubeconfig]
```

You'll be walked through, in order:

1. Public domain/SSL validation (answer `Y` or `n` — an empty answer fails with `'flag' was not provided`).
2. `values.yaml` confirmation.
3. Report storage selection (complete S3 **or** complete NFS details, not a partial mix of both).
4. Keycloak setup (external credentials, or internal auto-copy).

Under the hood, the script creates the `esignet` namespace, disables Istio sidecar injection, updates Helm repos, installs the `mosip/partner-onboarder` chart, waits for the job to complete, restarts the `esignet` deployment, and cleans up temporary configmaps.

**Troubleshooting**

| Issue                                 | Resolution                                                                                                    |
| ------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `KER-ATH-401: Authentication Failed`  | Provide the correct `mosip-deployment-client` secret key.                                                     |
| Certificate validity error            | Ask an admin to add a grace period in the configuration.                                                      |
| `ida-cred` certificate upload error   | Expected on a second run — safe to ignore if the certificate already exists.                                  |
| `'flag' was not provided`             | Answer the SSL prompt with a non-empty `Y` or `n`.                                                            |
| Script exits after the storage prompt | Provide complete S3 **or** complete NFS details, not a partial mix.                                           |
| `copy_cm_func.sh` errors              | Verify the script exists at `../deploy/` and the source configmaps/secrets exist in the `keycloak` namespace. |

Reference: [`partner-onboarder`](https://github.com/mosip/esignet/tree/release-2.0.x/partner-onboarder) on the `release-2.0.x` branch.

#### Onboarding Relying Parties

The onboarder script described here works against PMS (Partner Management Service) **1.3.0-beta5 and above**. If your deployment runs an earlier PMS version, use [Manually Onboarding Relying Parties for PMS 1.2.2.x and Below](on-prem-deployment-guide.md#manually-onboarding-relying-parties-for-pms-122x-and-below) instead.

See [Onboarding Pre-requisites](/broken/pages/0ccd7887c0a848daf4bd719806adb034f51ce0b8) for detailed onboarding steps.

{% hint style="info" %}
**Prerequisites:** make sure the mock relying party services are deployed and running before starting. Deploying the mock relying party portal is optional if you already have your own relying party portal — see [mosip/esignet-mock-services](https://github.com/mosip/esignet-mock-services) for the default implementation.

Download and import `eSignet-with-mock.postman_environment.json` and `eSignet.postman_collection.json` from the `postman-collection` folder in the repo.
{% endhint %}

{% stepper %}
{% step %}
### Fetch the Authentication Token

Go to "OIDC Client Mgmt" → "Mock" → "Get Auth Token." Update `client_secret` (from `keycloak-client-secrets`) and `iam_url` (the Keycloak URL, from the `keycloak-host` → `keycloak-external-url` configmap entry) in the request body.
{% endstep %}

{% step %}
### Fetch the CSRF Token

Go to "OIDC Client Mgmt" → "Mock" → "Get CSRF Token," updating the `url` field as needed.
{% endstep %}

{% step %}
### Update the Request Fields for OIDC Client Creation

Before running "Create OIDC Client," update `url`, `logo-uri`, `redirect-uri`, `client-name`, and `client-id`.
{% endstep %}

{% step %}
### Update the Client ID in the Deployment

Once the client is created and activated, update `clientId` in the mock-relying-party-ui deployment.
{% endstep %}

{% step %}
### Update the Client Private Key

Retrieve `client-private-key` from the eSignet-with-mock Postman environment, base64-encode it, and update it in the mock-relying-party service secret.
{% endstep %}
{% endstepper %}

{% hint style="info" %}
This workaround is based on a walkthrough with the DevOps team rather than official onboarder documentation — validate it end-to-end in your own environment before relying on it. Revisit it once PMS 1.2.2.x support is no longer needed.
{% endhint %}

#### Manually Onboarding Relying Parties for PMS 1.2.2.x and Below

On PMS (Partner Management Service) version 1.2.2.x or earlier, the standard onboarder run won't complete cleanly on its own: the `create-oidc-client` step fails with an HTTP 404, because it calls a PMS API path that doesn't exist yet on 1.2.2.x. Every other step succeeds normally — only OIDC client creation needs to be finished manually, against the older PMS path.

{% stepper %}
{% step %}
### Run the onboarder as normal

Expect it to fail specifically at the `create-oidc-client` step with a 404 — on PMS 1.2.2.x and below, this is expected, not a sign that something else went wrong.
{% endstep %}

{% step %}
### Retrieve the run's report or logs

These contain the failed request:

* From MinIO: `s3/onboarder/reports/MOCK_RP_OIDC/<timestamp>/mock-rp-oidc.html`
* Or from the onboarder job's pod logs, if you don't have MinIO access.
{% endstep %}

{% step %}
### Extract the request body and the auth token

Extract the request body and the auth token used in the failed `create-oidc-client` call, from that report or log.
{% endstep %}

{% step %}
### Manually resend the request

Manually resend the same request — same body, same token — to the legacy PMS endpoint instead:

```
POST /v1/partnermanager/oauth/client
```
{% endstep %}

{% step %}
### Update the mock relying party UI

Point the mock relying party UI at the new client ID returned by that manual call:

```sh
kubectl set env deploy/mock-relying-party-ui CLIENT_ID=<new>
```
{% endstep %}
{% endstepper %}

### Verify Deployment

Check the status of eSignet pods after deployment:

```sh
kubectl get pods -n esignet
```

### eSignet API Test Rig Installation

`esignet-apitestrig` tests the APIs and the end-to-end functional flow of the eSignet modules — see [esignet-apitestrig](https://github.com/mosip/esignet/tree/release-2.0.x/deploy/esignet-apitestrig).

### Uninstalling eSignet

To completely remove eSignet from your Kubernetes environment:

```sh
./delete-all.sh
```

## Documentation

* [Onboarding Pre-requisites](../develop/integration/relying-party/relying-party-onboarding.md) — before you request registration as a relying party.
* [Onboarding Form](../develop/integration/relying-party/integrate-with-e-signet.md) — requesting registration as a relying party.
* [Integration and Discovery Endpoint](../develop/integration/relying-party/integration-options-and-discovery-endpoints.md) _(page to be added)_
* [Development and Integration with eSignet](../develop/integration/relying-party/development-and-integration-with-esignet.md) — what it takes to connect your application as a relying party.

{% hint style="info" %}
Having the mock relying party portal installed is helpful for verifying the complete eSignet flow end to end.
{% endhint %}
