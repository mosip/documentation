# Relying Party Onboarding

This guide helps the developers of the relying party to get started with their development environment.

## Pre-requisites

Before integrating with eSignet, ensure the following setup is completed:

### 1. Prepare Your Development Environment

* Select your preferred technology stack (e.g., PHP, Python, Java, Node, Kotlin, Swift, etc.).
* Choose an appropriate **OpenID Connect client library** for your selected stack. _(Refer to the library list here.)_

### 2. Plan for UserInfo JWT Handling

* eSignet returns the UserInfo response as a **signed or signed-and-encrypted JWT**.
* Choose a compatible JWT plugin to **decrypt, verify, and parse** the UserInfo JWT.

### 3. Generate and Manage Cryptographic Keys

* eSignet supports only **confidential clients** using the **private\_key\_jwt** client authentication method.
* Generate a key pair and store the **private key** securely in password-protected, hardened storage (machine, vault, HSM).
* Share the **public key** with eSignet in **JSON Web Key (JWK)** format.
* Use **different key pairs for development, test, and production**—never reuse keys across environments.
* Rotate keys every **6–12 months**, or immediately if compromised.
* The generated key pair must default to **"signing"** usage.

{% hint style="info" %}
Only **RSA** key format is currently supported; additional key formats are planned.
{% endhint %}

### 4. Design Your Callback API

* The callback API is the endpoint to which eSignet redirects the user’s browser after authentication success or failure.
* Ensure the callback can **render a user interface promptly**, keeping the user informed of the authentication result.
* On **successful authentication**, the user is redirected with an **authorization code**.
* On **failure**, the user is redirected **without a code**, but with an **error code**.
* The relying party must handle the callback response appropriately before allowing the user to proceed.

## Onboarding Your Relying Party (RP) as an OIDC Client with an ID Provider

To onboard your application or service as an OpenID Connect (OIDC) client with an Identity Provider (IDP) such as eSignet, follow the steps below. These steps ensure that your RP is registered correctly and can request user authentication and claims securely.

## 1. Prepare Your Public Key

Before registration, generate a key pair and have your **public key** ready. This public key will be shared with the ID provider to establish trust and enable secure communication.

## 2. Request Client Registration

Contact the eSignet provider (or relevant ID provider) and provide the following details:

* **Public Key**: The same public key generated earlier.
* **Client/Application Name**: This name will be displayed to users on the eSignet authentication and consent screens.
* **Claims (Attributes) Required**: Specify the list of user attributes your application needs.
  * Clearly indicate **mandatory** vs. **optional** claims.
  * Claim values and formats can be referenced from the eSignet `.well-known` configuration endpoint.

## 3. Submit Application Branding

To provide a seamless user experience, submit the following for display during authentication:

* **Application Logo**
* **Organization Logo**

These visuals will appear on the eSignet authentication and consent pages.

## 4. Define Callback URLs (Redirect URIs)

Specify the redirect URIs that the ID provider will use to return authentication responses. For development and QA environments, use the following patterns:

**Supported for Development/QA:**

* `http://localhost:<portnumber>/*`
* `http://127.0.0.1:<portnumber>/*`
* `http://<your-server-ip>:<portnumber>/*`
* `my.phone.app://oauth/*` (For mobile apps with deep linking)

Wildcard patterns (_`*`_) are acceptable for development but **should be avoided in production** due to security risks.\_

**Unsupported URL Patterns:**

* `\\*`
* `http*` (invalid wildcard usage)
* `https://*` (invalid wildcard usage)
* `https://domain*`
* `residentapp://*`

{% hint style="warning" %}
Redirect URIs can either be fully qualified URLs or partial URLs with wildcards. Allowing partial URLs with wildcards provides flexibility for clients, enabling them to use multiple URLs by changing only certain paths or query parameters without frequently updating the client configuration.\
However, when using the redirect URI in the authorize API call and the token API call, it must be a fully qualified URL and must be identical in both calls. If the redirect URI differs between these calls, an "invalid assertion" error will occur. Additionally, if the redirect URI does not match any of the registered redirect URIs, the request will fail with an "invalid redirect URI" error.
{% endhint %}

## 5. Await Client ID

Once the required information is submitted, the ID provider will process your registration and issue a **Client ID**. This ID will uniquely identify your application in all future authentication requests.
