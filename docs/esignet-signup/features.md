# Features

## **Features Overview**

The **Signup Service** in eSignet provides a secure, user-friendly, and standards-based platform for user onboarding and identity verification. It supports a wide spectrum of use cases—from **basic profile creation** to **high-assurance identity verification**—making it suitable for both public and private sector services.

Below are the **core capabilities** of the Signup module:

## **1. Create User Profile with Minimum Details**

The Signup module allows users to create a profile using **basic personal information**, enabling fast and seamless onboarding. Users can optionally set a **password** during registration, allowing the profile to function as a standalone password-based account when required.

#### **Dynamic Signup Form (Schema-Driven UI)**

Earlier, the Signup form was static and offered limited flexibility in modifying field labels, types, or structure. The module now features a **schema-driven dynamic form**, enabling:

* Full customization of fields (add, update, delete)
* Support for multiple input types such as:
  * Photo capture
  * Dropdowns
  * Date pickers
  * And more
* Adaptability to the relying party’s specific onboarding requirement<br>

Refer to the [detailed form schema and configuration documentation](https://github.com/mosip/esignet-signup/blob/master/docs/design/dynamic-forms.md).

## **2. SignUp with Video eKYC**

For services requiring **stronger identity verification**, the Signup module supports a complete **video eKYC flow**. This allows relying parties to collect **verified claims** through a secure, real-time video interaction.

As part of this enhancement, eSignet has implemented the [**OpenID Identity Assurance 1.0**](features.md#identity-assurance-flow-ekyc-verification) flow to enable the **processing, verification, and storage of verified claims** once a user chooses to undergo video eKYC.

eSignet’s implementation of the [OpenID Identity Assurance 1.0](https://docs.esignet.io/readme/standards#id-2.-interoperability) profile ensures that verified identity attributes collected during video eKYC are handled securely, consistently, and in a standards-aligned manner.

Video eKYC can be triggered based on the relying party’s onboarding requirements:

* **Immediately after initial registration**, or
* **As part of a high-assurance onboarding flow**

Refer the [technical documentation](https://github.com/mosip/esignet-signup/blob/master/docs/design/identity-verification.md)

[End-user guide for the Video eKYC flow](test/end-user-guide/signup-and-login-with-otp-for-verified-claims.md)

Please keep reading for more details in the OpenID identity assurance 1.0 spec.

### Identity Assurance Flow (eKYC Verification)

For regulated industries such as **banking, insurance, and digital governance**, eSignet singup supports a robust Identity Assurance Flow that offers **high-confidence verification at login**.

This flow includes but not limited to:

* **Real-time video-based KYC (eKYC)**\
  Live video verification ensures the person signing in is the rightful identity holder.
* **Government-issued document scanning**\
  Scans and validates official identity documents for authenticity.
* **Biometric validation**\
  Optional biometric checks (such as facial recognition) to further strengthen identity verification.

This ensures that only verified individuals gain access to sensitive services, reducing fraud and enhancing compliance with national and international regulatory standards.

### Powered by OpenID Connect Assurance Extension

The eSignet Sign-Up and Identity Assurance processes are built on the [**OpenID Connect (OIDC) Assurance Extension**](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html), which enhances the trustworthiness of identity claims.

This includes:

* **Verification Status**\
  Identifies whether a claim (e.g., name, ID number) is self-declared or verified by a trusted source.
* **Verification Process Details**\
  Captures how each claim was verified—via biometric checks, document validation, or video-based processes—and by whom.
* **Assurance Level**\
  Communicates the level of confidence in the verification, helping relying parties make informed decisions about trust and access.

This structured metadata provides transparency and trust in digital identities, especially critical in environments with high compliance requirements.

## **3. Password Reset & Update**

The Signup module provides built-in support for:

* **Password reset** (in case a user forgets their password)
* **Password update** (when the user wants to change an existing password)

These flows are implemented with strong security safeguards to ensure users can recover or modify their credentials **without compromising identity integrity**.

### Summary

The eSignet Sign-Up Service is a comprehensive solution for digital identity onboarding and verification. Whether you're offering public healthcare, digital banking, or secure citizen services, it empowers you to:

* Onboard users with flexibility and speed
* Apply tiered identity verification based on use case
* Meet compliance standards with verified identity metadata
* Provide a seamless and secure experience across web and mobile platforms
