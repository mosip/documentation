# Onboarding Form

Once you've worked through [Onboarding Pre-requisites](relying-party-onboarding.md) and have your keys and callback endpoint ready, you can request registration as a relying party by completing the [onboarding form](https://docs.google.com/forms/d/e/1FAIpQLSerko7k1wiy1sjgfRSfRU5Bjkb7cKc0t2z0FmKt6mSLBqJGXQ/viewform). This is what lets us set up your application as a recognized OIDC client, and get you a seamless integration on the [MOSIP collab environment.](https://collab.mosip.net/)

### What You'll Provide

| Field                            | What It's For                                                             |
| -------------------------------- | ------------------------------------------------------------------------- |
| Public Key                       | Verifies your requests and lets eSignet encrypt data sent back to you     |
| Client / Application Name        | Shown to users on eSignet's authentication and consent screens            |
| Claims Required                  | The user attributes your application needs, and whether each is mandatory |
| Application & Organization Logos | Shown to users on eSignet's authentication and consent screens            |
| Callback URLs (Redirect URIs)    | Where eSignet sends the user back after authentication                    |

The sections below walk through each of these in more detail.

### 1. Public Key

Provide the same JWK-format public key you generated in [Onboarding Pre-requisites](relying-party-onboarding.md). This is what establishes trust between your application and eSignet and lets you use `private_key_jwt` authentication.

### 2. Client / Application Name

This name is displayed to users on eSignet's authentication and consent screens — it's how your users will recognize your application while completing login.

### 3. Claims (Attributes) Required

Specify the list of user attributes your application needs. For each claim:

* Clearly indicate whether it's **mandatory** or **optional**.
* Claim values and formats can be referenced from eSignet's `.well-known` configuration endpoint.

### 4. Application Branding

Submit your **application logo** and **organization logo**. Both appear on the eSignet authentication and consent pages during login, so users can recognize who they're signing in to.

### 5. Callback URLs (Redirect URIs)

Specify the redirect URIs eSignet should use to send authentication responses back to your application.

**Supported for development and QA:**

| Pattern                                  | Notes                              |
| ---------------------------------------- | ---------------------------------- |
| `http://localhost:<portnumber>/*`        |                                    |
| `http://127.0.0.1:<portnumber>/*`        |                                    |
| `http://<your-server-ip>:<portnumber>/*` |                                    |
| `my.phone.app://oauth/*`                 | For mobile apps using deep linking |

Wildcard patterns (`*`) are acceptable for development, but **should be avoided in production** due to the security risk of an overly broad match.

**Unsupported patterns:**

| Pattern           | Why                    |
| ----------------- | ---------------------- |
| `\\*`             | Invalid wildcard usage |
| `http*`           | Invalid wildcard usage |
| `https://*`       | Invalid wildcard usage |
| `https://domain*` | Invalid wildcard usage |
| `residentapp://*` | Invalid wildcard usage |

> **Note:** Redirect URIs can be either fully qualified URLs or partial URLs with wildcards. Wildcards give you flexibility to use multiple URLs by changing only certain paths or query parameters, without updating your client configuration every time. However, the redirect URI used in the authorize API call and the token API call must be a fully qualified URL, and must be identical in both calls — if they differ, you'll get an "invalid assertion" error. If the redirect URI doesn't match any of your registered URIs at all, the request fails with an "invalid redirect URI" error instead.

### 6. Await Your Client ID

Once you've submitted the required information, eSignet processes your registration and issues a **Client ID**. This ID uniquely identifies your application in every authentication request from here on.

***

Once you receive your eSignet credentials at the email address provided on the form, head to [Development and Integration with eSignet](development-and-integration-with-esignet.md) to complete your integration.











