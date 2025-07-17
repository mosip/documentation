# Features

The eSignet Sign-Up Service provides a secure, user-friendly, and standards-based platform for user onboarding and identity verification. It is designed to support a wide range of use cases—from basic account creation to high-assurance identity verification making it suitable for both public and private sector services.

## User Profile Creation

eSignet offers multiple ways to incrementally create a user profile, based on the level of assurance and regulatory requirements of the relying party: \<!-- multiple or several and isn't it more inclined towards progressively adding upon the profile?>

### 1. KYC with Minimum Details

Users can sign up by providing basic personal information, validated against national ID systems like MOSIP. This allows for quick onboarding with foundational identity assurance.

### 2. Video eKYC

For services that require stronger verification, users can complete a **video-based KYC** process as part of the sign-up. This step is initiated automatically upon the user’s **first login** after registration, ensuring that identity is verified in real time through secure video interaction.

### 3. Create Profile with Password

Users have the option to create a traditional username/password profile. This supports both identity-linked and standalone account creation, depending on the integration setup.

### 4. Reset Password

eSignet includes a secure password reset flow, ensuring users can easily recover access to their accounts while maintaining identity integrity and system security.

## Identity Assurance Flow (eKYC Verification)

For regulated industries such as **banking, insurance, and digital governance**, eSignet singup supports a robust 'Identity Assurance Flow' that offers **high-confidence verification at login**.

This flow includes:

* **Real-time video-based KYC (eKYC)**\
  Live video verification ensures the person signing in is the rightful identity holder.
* **Government-issued document scanning**\
  Scans and validates official identity documents for authenticity.
* **Biometric validation**\
  Optional biometric checks (such as facial recognition) to further strengthen identity verification.

This ensures that only verified individuals gain access to sensitive services, reducing fraud and enhancing compliance with national and international regulatory standards.

## Powered by OpenID Connect Assurance Extension

The eSignet Sign-Up and Identity Assurance processes are built on the [**OpenID Connect (OIDC) Assurance Extension**](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html), which enhances the trustworthiness of identity claims.

This includes:

* **Verification Status**\
  Identifies whether a claim (e.g., name, ID number) is self-declared or verified by a trusted source.
* **Verification Process Details**\
  Captures how each claim was verified—via biometric checks, document validation, or video-based processes—and by whom.
* **Assurance Level**\
  Communicates the level of confidence in the verification, helping relying parties make informed decisions about trust and access.

This structured metadata provides transparency and trust in digital identities, especially critical in environments with high compliance requirements.

### Summary

The eSignet Sign-Up Service is a comprehensive solution for digital identity onboarding and verification. Whether you're offering public healthcare, digital banking, or secure citizen services, it empowers you to:

* Onboard users with flexibility and speed
* Apply tiered identity verification based on use case
* Meet compliance standards with verified identity metadata
* Provide a seamless and secure experience across web and mobile platforms
