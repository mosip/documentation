---
description: A Modern and Inclusive Digital Identity Authentication Solution
---

# eSignet Authentication

## Overview

**eSignet Auth** is a modular, standalone identity authentication service designed to enable secure and flexible user verification across digital ecosystems. Built on **open standards**, it implements **OAuth 2.0 and OpenID Connect** protocols, functioning as both an **authorization server** and a **resource server**.

#### 1. Designed for Inclusivity

eSignet Auth ensures that digital authentication is accessible and adaptable for all, regardless of device type or user capability.

* **Multiple Authentication Factors**\
  Supports a variety of methods including **OTP** (for feature phones), **biometrics** (iris, face, fingerprint), and **wallet-based face authentication** (for smartphone users). These modes ensure inclusive access across different user demographics and contexts.
* **Customizable Authentication Workflows**\
  Flexible by design, eSignet Auth can be tailored to meet country-specific, sector-specific, or application-specific requirements. New authentication methods can be easily added and existing flows modified without major system changes.

#### 2. Standards-Based ID Authentication with High Assurance

eSignet Auth delivers secure identity verification through a **standards-compliant** and **assurance-driven** approach.

* **OAuth 2.0 and OpenID Connect Based**\
  Uses established OAuth 2.0 flows and OpenID Connect for secure, token-based identity authentication, enabling seamless and reliable integration with existing systems.
* **Support for High Assurance Biometrics**\
  Enables robust identity authentication using **iris**, **face**, or **fingerprint** recognition. These high-assurance modalities are ideal for accessing sensitive services such as healthcare, financial services, and government platforms.

This combination of standards compliance and biometric authentication ensures strong, verifiable digital identities with configurable assurance levels.

#### 3. How It Builds Trust

Trust is foundational to eSignet Auth’s architecture, achieved through strong privacy controls, consent-driven design, and secure token handling.

* **Consented User Data Sharing**\
  Personal data is shared only after explicit, informed user consent. The consent flow is embedded into the authentication process and mandatory for data access.
* **No Data Storage**\
  eSignet Auth does **not store any personally identifiable information (PII)**. It acts solely as a verification and authentication layer, reducing exposure to privacy risks.
* **Prevention of Unwanted Profiling**\
  Issues **partner-specific user tokens** for each relying party, ensuring that user activity cannot be tracked or correlated across services—thus preserving privacy and stopping cross-service profiling.

#### 4. Seamless Integration Across Ecosystems

eSignet Auth is built for flexibility, allowing it to plug into various components across digital identity and service delivery ecosystems.

* **Compatible with Any ID System**\
  Integrates easily with any centralized or federated identity system. Its standards-based framework allows it to work with a wide variety of ID registries and data structures.
* **Connects with Any Relying Party (Service Portal)**\
  Service providers—such as banks, government departments, healthcare portals, and telecom services—can authenticate users through eSignet Auth with minimal integration effort. The use of standard APIs and protocols enables quick and secure onboarding.

This ecosystem-agnostic design ensures that eSignet Auth can serve as a unifying layer for identity authentication across sectors.

#### 5. Summary

[**eSignet Auth**](../esignet-authentication/features.md) is a powerful, secure, and inclusive authentication module that can be deployed as part of a digital ID system or independently.

It offers:

* Inclusive access through multiple, customizable authentication methods
* Secure and standards-compliant identity verification using OAuth 2.0 and OpenID Connect
* High-assurance options via biometric authentication (iris, face, fingerprint)
* Consent-driven data handling with no storage of user PII
* Prevention of user profiling across services
* Easy integration with any identity system or service provider
* Open-source and vendor-neutral, ensuring no lock-in and full transparency

Whether used by governments, enterprises, or technology providers, **eSignet Auth** delivers a trusted, flexible, and future-ready solution for digital identity authentication.

Please take a moment to watch the video below to explore valuable insights into eSignet and its wide array of powerful features!

{% embed url="https://www.youtube.com/watch?v=ZfUPRv71s_0" %}

## Documentation

* [Technology Stack](../readme/technology/technology-stack.md)
* [Components](develop/components.md)
* [Try It Out](test/try-it-out/)
* [Integrate with eSignet](test/try-it-out/integrate-with-e-signet.md)
