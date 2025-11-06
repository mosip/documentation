---
description: >-
  Reference information to help relying parties select the appropriate ID system
  and proceed with integration.
---

# Integration Options and Discovery Endpoints

eSignet supports integration with both **Mock ID** and **MOSIP ID** systems for authentication and identity verification.

The **integration flow and configuration steps** remain identical for both options, the only difference lies in the **discovery endpoints**, which determine the environment and underlying ID system you connect to.

{% hint style="info" %}
Note: The two options listed here — **Mock ID** and **MOSIP ID** — are provided **only for testing and proof-of-concept (POC)** purposes within the [**MOSIP Collab environment**](https://collab.mosip.net/).
{% endhint %}

{% hint style="info" %}
In real-world deployments, eSignet can be configured to work with **national ID systems or other identity providers** as per the country’s implementation and integration requirements.
{% endhint %}

#### **Understanding Discovery Endpoints** <a href="#understanding-discovery-endpoints" id="understanding-discovery-endpoints"></a>

A **discovery endpoint** is a standard part of the **OpenID Connect (OIDC)** specification.\
It provides a **metadata document** (commonly located at `/.well-known/openid-configuration`) that allows relying parties (RPs) to automatically discover key configuration details for integrating with the identity provider (IdP).

**Each discovery document mainly includes:**

1. Authorization, Token, and UserInfo endpoint URLs
2. Supported scopes, claims, and grant types
3. Public keys for token signature validation
4. Supported authentication methods and response types

**For more details refer** [**here**](https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderMetadata)**.**

#### **Why Discovery Endpoints Matter for Relying Parties** <a href="#why-discovery-endpoints-matter-for-relying-parties" id="why-discovery-endpoints-matter-for-relying-parties"></a>

For developers and integrators, discovery endpoints simplify setup by:

1. **Automating configuration:** No need to hardcode or manually maintain endpoint URLs.
2. **Ensuring consistency:** RPs always use up-to-date endpoint details published by eSignet.
3. **Reducing errors:** Helps avoid misconfigurations in authorization or token flows.

### **Discovery Endpoints for Mock ID and MOSIP ID Integration** <a href="#discovery-endpoints-for-mock-id-and-mosip-id-integration" id="discovery-endpoints-for-mock-id-and-mosip-id-integration"></a>

#### **1. Mock ID Integration**

Use this option to integrate with a **Mock ID system**, which is designed to **simulate a real ID system** for **testing and development purposes**.

Please refer [here](https://esignet-mock.collab.mosip.net/) for the Mock ID discovery endpoints.\


**Purpose:**

1. Enables developers to test authentication flows safely.
2. Returns claims and responses similar to production with mock user data.
3. Ideal for validating OIDC client configuration and redirect flows.

#### **2. MOSIP ID Integration**

Use this option if you want to use a **MOSIP ID** for your **use case demonstrations or integration testing**.

Please refer [here](https://esignet-mosipid.collab.mosip.net/) for the MOSIP ID discovery endpoints.\


**Purpose:**

1. Connects to the live MOSIP identity system for real user authentication.
2. Returns genuine user claims and ID tokens after successful login.
3. Suitable for end-to-end verification before deployment.
