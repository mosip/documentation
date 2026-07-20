# Security & Authentication

### Overview

In MOSIP–CRVS integration, **Security & Authentication** is the setup you need so CRVS can interact with MOSIP **safely and with the right permissions**.

It covers:

* **How CRVS gets authorized to call MOSIP APIs** (Keycloak OAuth2 client, secret, role, access token).
* **How informants/introducers are authenticated** via **eSignet**, and how the resulting token is passed to MOSIP for validation and audit.
* The broader security controls you’ll typically enforce around the integration (certificates/TLS, access control, audit requirements).

### OAuth2 Client Setup & Authentication

As part of the integration approach, two specific APIs are exposed:

1. Create a packet API from the MOSIP packet manager module to create a packet
2. Trigger the API from the registration processor module to process the packet

allowing external systems (in this case, CRVS) to use these APIs to initiate requests.

To facilitate this, the external system must be assigned a specific new client ID and secret, ensuring secure and authenticated communication. Additionally, a new, specific role should be created for the external user, which will be associated with the API request in subsequent calls for packet creation and processing.

This role helps MOSIP validate and verify that the request is coming from an authorized and authentic source, ensuring secure and accurate handling of the registration process.

### Create Client ID/Role for the CRVS

**Create the Client**

1. **Log in to Keycloak Admin Console**
   * Access the keycloak admin console.
   * Ensure you have the necessary administrative privileges to create clients.
2. **Select Your Realm**
   * If you are not already in the desired realm, switch to it from the top-left drop-down menu. The realm should be the one where you want to create the client.
3. **Create a New Client**
   * In the left-hand menu, go to **Clients** and click on **Create**.
4. **Enter the Client Details**
   * **Client ID**: Enter `mosip-crvs1-client` as the client ID (or a relevant name based on your deployment).
   * **Client Protocol**: Select `openid-connect`.
   * **Root URL**: Leave this field blank or enter the URL if required.
5. **Save the Client**
   * After entering the necessary details, click **Save** to create the client.

Once the client is created, please update the properties in the locations below:

1. `auth.server.admin.allowed.audience` In the [Packet manager default properties](https://github.com/mosip/mosip-config/blob/v1.2.4.0/packet-manager-default.properties#L24).
2. `auth.server.admin.allowed.audience` In the [Registration processor default properties](https://github.com/mosip/mosip-config/blob/v1.2.4.0/registration-processor-default.properties#L996).

> **Note:** The client name specified here is a placeholder and can be customised to suit the specific requirements of the System Integrator SI/CRVS.

**Configuring the Client**

1. **Access the Settings Tab**
   * After creating the client, navigate to the **Settings** tab.
2. **Configure Client Settings**
   * **Access Type**: Set this to **confidential** if you intend to use client credentials for authentication.
   * **Service Accounts Enabled**: Turn this option **ON** if you are using client credentials flow for secure communication.
   * **Valid Redirect URIs**: Enter `*` (or specify specific URLs if known and necessary).
3. **Save the Changes**
   * Once the configuration is complete, click **Save** to apply the changes.

**Generate and Note the Secret Key**

* Navigate to the **Credentials** tab.
* If you selected the **confidential** access type, keycloak will generate a **Secret Key**. Note this secret as it will be used for authentication in subsequent API calls.

**Creating the Role**

1. **Go to the Roles Section**
   * In the Keycloak Admin Console, under your realm, navigate to **Roles**.
2. **Create a New Role**
   * Click on **Add Role**.
   * Enter the following details:
     * **Role Name**: `ONLINE_REGISTRATION_CLIENT`
   * Click **Save** to create the role.

**Assigning the Role to the Client**

1. **Assign the Role to the Client**
   * Go back to the **Clients** section and select the client `mosip-crvs1-client` that you previously created.
2. **Navigate to Service Account Roles**
   * Under the **Service Account Roles** tab (this tab is visible only if **Service Accounts Enabled** is turned on), click on **Add Role**.
3. **Select the Role**
   * From the **Client Roles** dropdown, select either `realm-management` or your specific desired client role (if the role is specific to a client).
   * Add the `ONLINE_REGISTRATION_CLIENT` role to the selected client.

### Fetch Access Token to Call the APIs

Once the role is created and mapped to the client ID. As a follow-up step, below keycloak API is to be called to authenticate the CRVS associated with the new role. In the response of the API, there is an access token returned in the response header. This is the access token that should be used when initiating any request using the packet manager API.

**Authenticate Endpoint:** `{domainname}/v1/authmanager/authenticate/clientidsecretkey`

**Method:** POST

**API Request Structure:**

```json
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": "{{appId}}",
    "clientId": "{{clientId}}",
    "secretKey": "{{secretKey}}"
  },
  "requesttime": "{{requestTime}}",
  "version": "string"
}
```

In the API above, the fields Client ID and Secret key are the values created in the previous steps, as mentioned above. Once the authentication is successful, in the response header, we will receive an access token, which is to be noted and used for the subsequent packet manager API request.

***

## Learn More

* [**Partner Management Services**](../../../../../id-lifecycle-management/support-systems/partner-management-services/partners.md) - Learn about partner onboarding processes, policy management, and certificate lifecycle for Authentication Partners, MISP Partners, and credential partners who integrate with MOSIP.
* [**eSignet Configuration**](https://github.com/mosip/documentation/blob/1.2.0/docs/integrations/esignet/configuring-esignet.md) - Configure eSignet as an OIDC authentication provider, including MISP partner onboarding, ID Authentication integration, and authentication flow setup for CRVS identity verification.
* [**ID Authentication Services**](https://github.com/mosip/documentation/blob/1.2.0/docs/id-authentication-services.md) - Understand MOSIP's authentication architecture, including KYC authentication, OTP services, biometric verification, and internal authentication APIs used by partners.
* [**Key Manager**](../../../../../id-lifecycle-management/supporting-components/keymanager/) - Explore key and certificate management, including partner certificate upload, encryption/decryption operations, and HSM integration for secure cryptographic operations.
