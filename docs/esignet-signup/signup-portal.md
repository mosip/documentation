---
description: Simplifying user registration and identity verification.
hidden: true
---

# Signup Portal

## Signup Portal

#### Objective & Rationale:

In today’s digital world, secure and accessible identity verification is key to connecting people with essential services like healthcare, education, and government programs. While the **eSignet Authentication** module solves the identity verification, there is still a need to address the onboarding of users in non-digital environments. For example, several countries have good coverage on non-digital ID issuance, but would like to enable these users to obtain a digital identity. In certain countries, there are several ID’s that together provide an overall coverage rather than a single ID. In most of the case, the new on-field registration is not a good choice due to the cost and time-consuming methods. Empowering a voluntary program to self-register for a digital identity can work seamlessly in these cases. The **eSignet’s Signup Module**, a core component of the eSignet platform, offers a seamless and inclusive way for individuals to establish their digital identities. By prioritizing self-registration and progressive verification, the Signup module ensures that everyone can participate in the digital ecosystem regardless of background or access to technology. In this document, we dive into why and how eSignet’s signup process promotes inclusion, supports self-registration, and builds trust through its innovative assurance model.

**Please note:** This is not an alternative to the proper registration process. This is just a module that helps in digitalizing the existing ID (One or More) using a unique process with varying assurance level.

#### The Power of Self-Registration

The eSignet Signup Module is built around **self-registration**, empowering users to take control of their digital identity creation without complex prerequisites. Here’s how it works:

1. **Simple Onboarding**: Users can sign up with basic information, such as a mobile number and password, without needing immediate verification. This low-barrier entry ensures that anyone with a phone or internet access can create a profile.
2. **Progressive KYC Integration**: After initial registration, users can add **Know Your Customer (KYC)** details, such as National ID, passport, or tax ID, at their own pace, enhancing their profile over time.
3. **User-Controlled Process**: Self-registration allows users to manage their profiles independently, reducing reliance on intermediaries and making the process more accessible.

This self-service approach is especially impactful in regions with limited access to traditional identity infrastructure, enabling users to start their digital journey with minimal friction.

#### Promoting Inclusion Through Design

Inclusion is at the heart of eSignet’s mission, and the Signup Module is designed to ensure **'no one is left behind'** in the digital identity ecosystem. Here’s how:

* **Multilingual Support**: Built with **React JS**, the signup portal offers a responsive, multilingual interface, catering to diverse linguistic communities and breaking down language barriers.
* **Accessible Authentication Methods**: Support for OTP (via SMS/email), biometrics, and QR codes accommodates users with varying technological access. For instance, individuals in rural areas with basic phones can use OTP, while those with smartphones can opt for biometrics.
* **No Mandatory Verification at Signup**: Unlike traditional systems requiring upfront documentation, eSignet allows registration without immediate KYC, critical for underserved populations lacking formal IDs.
* **Liveness Detection for All**: Integration with a **liveness engine** enables face authentication over the web, ensuring secure verification even for users with standard devices.
* **Flexible ID Registry Integration**: The module connects to any ID registry (e.g., MOSIP) via runtime plugins, making it adaptable to diverse national identity systems.

By prioritizing accessibility and flexibility, eSignet promotes **financial inclusion** and bridges the **digital divide**, empowering marginalized communities to engage in the digital economy.

#### Assurance Model and Progressive KYC

The eSignet Signup Module’s **assurance model** is a cornerstone of its trust-building framework, ensuring that user identities are reliable while remaining accessible. Coupled with **progressive KYC**, this approach allows users to gradually enhance their digital profiles, balancing inclusivity with security. Here’s why this model is effective:

* **Multiple Assurance Levels for Gradual Trust Building**: eSignet assigns **assurance levels** to user profiles based on the type and verification status of identity proofs provided. For example, a basic profile with just a mobile number may have a low assurance level, while adding a verified National ID or biometric data increases it. This tiered system allows users with varying types of proofs—such as government IDs, passports, or tax IDs—to progressively improve their profile’s legitimacy. Even users with limited documentation can start with basic credentials and work toward higher assurance over time.
* **Scoring of Multiple Proofs**: The assurance model can incorporate **scoring mechanisms** to evaluate the reliability of multiple identity proofs. For instance, combining a verified National ID with biometric liveness detection results in a higher score than a single proof. This cumulative approach ensures that relying parties receive a clear, quantifiable measure of trust, tailored to their risk tolerance.
* **User-Driven Progression**: Progressive KYC empowers users to **choose their own path** to achieving higher assurance levels. Unlike rigid systems that demand all documentation upfront, eSignet lets users add KYC details at their convenience. This flexibility is crucial for individuals who may need time to gather documents or lack immediate access to certain proofs, ensuring they can still participate in the digital ecosystem.
* **Cost Efficiency**: By allowing users to start with minimal verification and add KYC incrementally, eSignet keeps **costs low** for both users and service providers. Users avoid the burden of obtaining expensive or hard-to-access documents upfront, while relying parties can integrate eSignet’s lightweight verification process without significant infrastructure investment.
* **Compliance for Relying Parties**: The assurance model ensures that relying parties, such as **financial institutions**, meet regulatory requirements for identity verification. By providing verified data with clear assurance levels, eSignet enables compliance with anti-money laundering (AML) and KYC regulations, reducing risk while streamlining onboarding.

Progressive KYC is an ideal starting point because it balances **inclusivity** with **trust**. It lowers barriers for users, especially in underserved communities, while providing relying parties with a scalable, compliant framework to verify identities as needed.

#### **How Signup Builds Trust**

Beyond the assurance model, Signup enhances trust through several features:

* **Liveness Detection**: The liveness engine ensures that the person registering is physically present, reducing fraud risks, particularly for high-stakes applications like banking or government services.
* **Privacy-First Approach**: User consent is mandatory before data is shared with relying parties, ensuring transparency and compliance with global privacy standards.
* **Secure Technology Stack**: The Signup Module uses **Java**, **Spring Framework**, and **PostgreSQL** for secure data storage, with **Redis** for caching and **Kafka** for scalable asynchronous operations. The **Key Manager** handles cryptographic security.

These elements create a trustworthy ecosystem where users feel confident, and relying parties can rely on verified data to reduce fraud and streamline processes.

#### Summary

The **Signup Module** redefines how digital identities can be created—**independently, securely, and progressively**. It is built to:

* Enable **voluntary self-registration**
* Support **progressive KYC and assurance scoring**
* Promote **inclusion, accessibility, and user control**
* Function **independently or alongside eSignet**
* Scale securely across different use cases and ecosystems

The Signup Module is not just a form—it's a gateway to digital participation for millions who are otherwise left behind.

## Documentation

* [Components](develop/components-signup-portal.md)
* [Integration of the Signup portal with eSignet](develop/integration-guide-signup-portal/integration-with-esignet-portal.md)
