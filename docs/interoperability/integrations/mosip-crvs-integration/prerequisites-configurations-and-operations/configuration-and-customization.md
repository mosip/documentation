---
description: >-
  Configure credential-sharing policies and WebSub notifications for MOSIP–CRVS
  integration.
hidden: true
---

# Configuration & Customization

### Overview

This page covers policy-level configuration for MOSIP–CRVS integration. Use it to control what MOSIP shares with CRVS. This applies after packet processing. It focuses on credential sharing and WebSub notifications.

#### What you configure

* How CRVS is set up as a MOSIP partner for receiving notifications
* What identifier MOSIP shares with CRVS (PSUT vs UIN vs VID)
* Which WebSub topics CRVS subscribes to (credentials vs packet status)
* Country-specific policy and privacy choices

{% hint style="info" %}
CRVS is the **source of truth** for vital events. MOSIP trusts CRVS-provided event data. MOSIP focuses on technical validations.
{% endhint %}

### Partner policy configuration

CRVS must be onboarded as a MOSIP partner before MOSIP can push events. At a minimum, configure:

* A **credential sharing policy** that defines what MOSIP can disclose.
* WebSub **subscription(s)** pointing to CRVS callback endpoints.

See also:

* [Security & Authentication](prerequisites/security-and-authentication.md)
* [Notifications & Event Handling](../notifications-and-event-handling.md)

### Credential sharing policy

#### Policy Options

Countries can customize credential sharing based on their requirements:

1. **Default (Recommended)**: Share PSUT token

PSUT is a partner-scoped token. It avoids exposing the resident’s raw identifier. It supports credential printing and correlation within CRVS.

* Protects UIN privacy
* Allows credential printing
* Minimizes PII exposure

2. **Option 2**: Share UIN directly

* Simplest approach
* Higher privacy risk and broader blast radius
* Use only if CRVS has strong data protection

3. **Option 3**: Share VID

* Temporary identifier
* Better privacy than UIN
* Requires VID management

4. **Option 4**: Share PSUT + VID

* Balanced approach
* Flexibility for different use cases

{% hint style="warning" %}
Sharing **UIN** is not recommended unless legally mandated. Prefer PSUT and/or VID to reduce exposure of sensitive identifiers.
{% endhint %}

### WebSub topic configuration

MOSIP publishes two event streams that CRVS may subscribe to:

* **Credential issuance notifications** (e.g., identity created after an infant birth flow).
* **Packet status updates** (e.g., processed / rejected with reason codes).

Keep credential sharing and packet tracking as separate subscriptions. This simplifies filtering and operational troubleshooting.

### Country-specific customizations

Common customization points:

* Choose the identifier to share (PSUT, VID, UIN).
* Adjust what attributes are included in the credential payload.
* Support multiple CRVS systems by onboarding each as a separate partner.
* Implement local governance rules for retention, audit, and access controls.

***

### Learn more

* [Core Integration Principles](../integration-overview-and-context/core-integration-principles.md)
* [Notifications & Event Handling](../notifications-and-event-handling.md)
* [Operational Considerations](operational-considerations/)

***

Crude Content

#### eSignet Authentication Flow

**Overview**

eSignet is MOSIP's authentication service that enables secure identity verification. For CRVS integration, eSignet is used to authenticate informants/parents before submitting registration requests to MOSIP.

**When is eSignet Used?**

* During birth registration (to authenticate parent/informant)
* For demographic update requests
* When CRVS does not collect biometric data of the applicant

**Authentication Flow**

1. CRVS redirects user to eSignet for authentication
2. User completes authentication (e.g., OTP, biometric)
3. eSignet generates authentication token
4. CRVS receives token and includes it in MOSIP request
5. MOSIP validates token for audit and authorization

### Partner Certificate Management

### API Security (TLS, Encryption)

### Access Control & Authorization

### Audit & Compliance Requirements

***

Crude Content -

Operational Considerations

#### **2. Create Client ID/Role for the CRVS** <a href="#id-1.-create-client-id-role-for-the-crvs" id="id-1.-create-client-id-role-for-the-crvs"></a>

As part of the integration approach, two specific API’s are exposed:

1. Create a packet API from the MOSIP packet manager module to create a packet
2. Trigger the API from the registration processor module to process the packet.

allowing external systems (in this case, CRVS) to use these APIs to initiate requests.

To facilitate this, the external system must be assigned a specific new client ID and secret, ensuring secure and authenticated communication. Additionally, a new, specific role should be created for the external user, which will be associated with the API request in subsequent calls for packet creation and processing.

This role helps MOSIP validate and verify that the request is coming from an authorized and authentic source, ensuring secure and accurate handling of the registration process. By associating the role with the API request, MOSIP can properly authenticate the external system and manage permissions for the request flow.

Read on to learn more about the specific steps involved

**Create the Client**

* **Log in to Keycloak Admin Console**
  * Access the keycloak admin console.
  * Ensure you have the necessary administrative privileges to create clients.
* **Select Your Realm**
  * If you are not already in the desired realm, switch to it from the top-left drop-down menu. The realm should be the one where you want to create the client.
* **Create a New Client**
  * In the left-hand menu, go to **Clients** and click on **Create**.
* **Enter the Client Details**
  * **Client ID**: Enter `mosip-crvs1-client` as the client ID (or a relevant name based on your deployment).
  * **Client Protocol**: Select `openid-connect`.
  * **Root URL**: Leave this field blank or enter the URL if required.
* **Save the Client**
  * After entering the necessary details, click **Save** to create the client.

Once the client is created, please update the properties in the locations below:

1. `auth.server.admin.allowed.audience` In the [Packet manager default properties](https://github.com/mosip/mosip-config/blob/v1.2.4.0/packet-manager-default.properties#L24).
2. `auth.server.admin.allowed.audience` In the [Registration processor default properties](https://github.com/mosip/mosip-config/blob/v1.2.4.0/registration-processor-default.properties#L996).

{% hint style="info" %}
**Note:** The client name specified here is a placeholder and can be customised to suit the specific requirements of the System Integrator SI/CRVS.
{% endhint %}

**Configuring the Client**

* **Access the Settings Tab**
  * After creating the client, navigate to the **Settings** tab.
* **Configure Client Settings**
  * **Access Type**: Set this to **confidential** if you intend to use client credentials for authentication.
  * **Service Accounts Enabled**: Turn this option **ON** if you are using client credentials flow for secure communication.
  * **Valid Redirect URIs**: Enter `*` (or specify specific URLs if known and necessary).
* **Save the Changes**
  * Once the configuration is complete, click **Save** to apply the changes.

**Generate and note the Secret key**

* Navigate to the **Credentials** tab.
* If you selected the **confidential** access type, keycloak will generate a **Secret Key**. Note this secret as it will be used for authentication in subsequent API calls.

**Creating the Role**

* **Go to the Roles Section**
  * In the Keycloak Admin Console, under your realm, navigate to **Roles**.
* **Create a New Role**
  * Click on **Add Role**.
  * Enter the following details:
    * **Role Name**: `ONLINE_REGISTRATION_CLIENT`
  * Click **Save** to create the role.

#### **Assigning the Role to the Client**

* **Assign the Role to the Client**
  * Go back to the **Clients** section and select the client `mosip-crvs1-client` that you previously created.
* **Navigate to Service Account Roles**
  * Under the **Service Account Roles** tab (this tab is visible only if **Service Accounts Enabled** is turned on), click on **Add Role**.
* **Select the Role**
  * From the **Client Roles** dropdown, select either `realm-management` or your specific desired client role (if the role is specific to a client).
  * Add the `ONLINE_REGISTRATION_CLIENT` role to the selected client.

#### **3. Fetch Access Token to Call the APIs** <a href="#id-2.-fetch-access-token-to-call-the-apis" id="id-2.-fetch-access-token-to-call-the-apis"></a>

Once the role is created and mapped to the client ID. As a follow-up step, below keycloak API is to be called to authenticate the CRVS associated with the new role. In the response of the API, there is an access token returned in the response header. This is the access token that should be used when initiating any request using the packet manager API.\
\
**Authenticate Endpoint:** {domainname}/v1/authmanager/authenticate/clientidsecretkey

**Method:** POST

**API Request Structure:**

```json
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": {{appId}},
    "clientId": {{clientId}},
    "secretKey": {{secretKey}}
  },
  "requesttime": "{{requestTime}}",
  "version": "string"
```

In the API above, the fields Client ID and Secret key are the values created in the previous steps, as mentioned above. Once the authentication is successful, in the response header, we will receive an access token, which is to be noted and used for the subsequent packet manager API request.

***

### Prerequisites & System Setup

This section outlines the technical requirements for integrating a Civil Registration and Vital Statistics (CRVS) system with MOSIP, applicable to any country implementation. It covers the necessary prerequisites and configurations to facilitate a seamless and secure connection between the two systems. Depending on the country's implementation model and agreements, these steps may be carried out by the System Integrator (SI) or the CRVS team.

#### Pre-integration Checklist

Before beginning integration, ensure the following are in place:

1. **MOSIP Platform Readiness**
   * MOSIP deployed and operational
   * Partner management module configured
   * eSignet service running
   * WebSub hub configured
   * Keycloak admin access available
2. **CRVS System Readiness**
   * CRVS system can generate API requests
   * CRVS has webhook endpoint for receiving notifications
   * CRVS can process WebSub notifications
   * CRVS implements eSignet authentication flow
3. **Network and Security**
   * Secure network connectivity between CRVS and MOSIP
   * TLS certificates configured
   * Firewall rules configured
4. **Data Readiness**
   * Field mapping agreed between CRVS and MOSIP
   * Mandatory attributes defined
   * Data validation rules documented

#### Configuring Pre-requisite Steps

#### **1. ID schema Configuration:** <a href="#id-schema-configuration" id="id-schema-configuration"></a>

To initiate any registration request, the country must define an ID schema based on the specific requirements for CRVS integration. The sample ID schema can be referred to [here](https://github.com/mosip/documentation/blob/1.2.0/docs/_files/id-schema/id-schema-sample.json) and should be customized to include all required fields for packet generation per the country’s requirements. This schema governs the structure of the data submitted to MOSIP for processing and storage in the Identity Repository.

{% hint style="info" %}
**Note:** MOSIP advises adopting and customizing the latest released ID schema version to meet country-specific needs.
{% endhint %}

For comprehensive guidance on defining and customizing the ID schema in MOSIP, please refer to the [documentation here](https://docs.mosip.io/1.2.0/id-lifecycle-management/identity-management/id-schema)
