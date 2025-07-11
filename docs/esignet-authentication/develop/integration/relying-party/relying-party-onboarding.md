# Relying Party Onboarding

This guide helps the developers of the relying party to get started with their development environment.

## Pre-requisites

**Setup your development machine:**

* Choose the technology stack (PHP, Python, Java, Node, Kotlin, Swift etc).
* Choose your OPENID client library as per your chosen tech stack. Please refer this link here for reference.
  * Userinfo JWT can be signed and encrypted or just signed. Choose your JWT plugin to decrypt , verify parse your JWT.
* Create keys - eSignet only supports confidential clients with the private-key-jwt authentication method. Make sure to store the private key in the password-protected safe storage(production-grade hardened machines/vault/HSM). The public key should be shared with the eSignet. It is extremely dangerous to use the same key pair in test or development, or production environments. Make sure to use a different set of keys for each environment. It is suggested to rotate the keys after every 6-12 months and regenerate if the keys are compromised.
  * The public key shared with eSignet is expected to be in JSON Web Key format.
  * The key pair generated should be set by default for “signing” usage.

**Note**: Only the RSA key format is supported. We are working on adding other key formats.

* Design your callback API. The callback API is redirected by eSignet over the user's browser upon successful / failed authentication. As best practice, please ensure the callback API can render the UX as soon as possible, so the user is aware of the progress. Please note that the user is redirected on both success and failure authentication. On failure, the user will be redirected with an error code and without an authorization code. So, based on the authentication response relying party portal needs to take the necessary action before allowing the user to move forward.

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

## 5. Await Client ID

Once the required information is submitted, the ID provider will process your registration and issue a **Client ID**. This ID will uniquely identify your application in all future authentication requests.

## 6. Be Aware of Additional Requirements

Some eSignet providers may have **non-technical onboarding requirements** (e.g., legal agreements, privacy policies, business verification). These are outside the scope of this document and should be discussed directly with the provider.
