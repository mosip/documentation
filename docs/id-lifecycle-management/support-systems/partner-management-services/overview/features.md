# Features

## Overview

The Partner Management System (PMS) provides a centralized platform for onboarding, governing, and managing partners integrating with the MOSIP ecosystem.

It enables secure partner registration, certificate trust establishment, policy configuration, and operational approvals while ensuring compliance with MOSIP security and governance requirements.

PMS supports multiple partner types and enforces role-based access through integration with Keycloak. The system offers a modern, intuitive user interface for both Partner Users and Partner Admins, enabling efficient management of partner lifecycles, certificates, policies, authentication services, devices, and notifications.

## Ease of Use and Usability Enhancements

### Self-Registration and User Access

PMS allows partners to [self-register](../functional-overview/end-user-guide.md#partner-self-registration) through a guided and partially automated process, reducing the need for manual intervention. During registration, users provide organizational and contact details and explicitly consent to Terms and Conditions, which clearly describe how personal and organizational data will be used within PMS. Self Registration can be done for below partners:

1. [Authentication Partner](../functional-overview/end-user-guide.md)
2. [Credential Partner](../functional-overview/onboard-credential-partner.md)
3. [FTM Partner](../functional-overview/ftm-chip-provider.md)
4. [Device Provider Partner](../functional-overview/device-provider.md)

Once registered, partners can log in using their email or username and password. Password recovery is supported through the “Forgot Password” option, enabling secure credential reset without administrative involvement.

{% hint style="info" %}
**Note:** From PMS version **1.3.0 – beta 4 onward**, Partner Admin users are no longer required to self-register via the PMS UI. Instead, they are created directly in Keycloak and assigned the appropriate Partner Admin role.
{% endhint %}

### Interface and User Experience

The PMS interface has undergone a comprehensive UI and UX revamp. The system now follows a card-based design approach that allows users to quickly identify and access available services. Each card represents a major functional area and includes concise descriptions to improve discoverability.

The user profile section, accessible from the top-right corner, displays the organization name and username and provides options to access the user profile or log out. The interface is optimized for desktop and laptop usage, with responsive layouts ensuring usability across supported screen sizes.

## Partner Admin Capabilities

### Admin Dashboard

The [Partner Admin Dashboard](../functional-overview/partner-administration.md#partner-admin-dashboard) serves as the central control panel for governance and operational oversight. It presents all major administrative functions as individual cards, including certificate management, partner onboarding, policy governance, authentication services, and device approvals.

The dashboard also highlights pending approval counts for Partner Policy Linking, SBI–Device, and FTM Chip requests, allowing Partner Admins to quickly identify actions requiring attention.

### Certificate Trust Store Management

PMS provides a centralized [Certificate Trust Store](../functional-overview/partner-administration.md#certificate-trust-store) to establish cryptographic trust across the partner ecosystem. Partner Admins can [upload, view, and download Root and Intermediate CA certificates](../functional-overview/end-user-guide.md#upload-root-ca-and-sub-ca), which form the foundation of trust validation for all partner certificates.

The system continuously tracks certificate validity and triggers expiry notifications to prevent service disruption. Uploaded certificates are validated for structure and integrity before being accepted into the trust store.

## Partner Onboarding and Management

### Partner Types Supported

PMS supports onboarding and lifecycle management for multiple partner types, including Authentication Partners, MISP Partners, ABIS Partners, Device Providers, FTM Chip Providers, and Credential Partners. Each partner type is governed by role-specific permissions and service capabilities.

### Partner Management

Partners can be viewed in both [list and detailed views](../functional-overview/partner-administration.md#view-partners). Depending on the partner type and onboarding mode, Partner Admins can deactivate partners, download original and MOSIP-signed certificates, and manage policy associations.

For **self-registered partners**, PMS supports certificate download and lifecycle management. For [**MISP Partners**](../functional-overview/misp-partner-onboarding.md) , [**ABIS Partners**](../functional-overview/abis-partner-onboarding-by-partner-admin.md) and [**Manual Adjudication Partners**](../functional-overview/onboard-manual-adjudication-partner.md) onboarding and management are handled exclusively by Partner Admins through the PMS UI.

## Policy Management and Governance

PMS provides comprehensive [policy governance](../functional-overview/policy-manager.md) through Policy Groups and individual policies. Policy Groups act as logical containers for related policies and enable structured access control across partner types.

These activities are performed by users assigned the [**Policy Manager**](../functional-overview/policy-manager.md) role in Keycloak. Once a user is created in Keycloak and granted the Policy Manager role, they can manage policies within PMS.

Within a Policy Group, a Policy Manager can [create Authentication Policies and Data Share Policies](../functional-overview/policy-manager.md#create-policy), and MISP Policies, edit policies in draft state, publish policies, clone policies across Policy Groups, and deactivate policies when no active partner–policy mappings exist

### Partner Policy Linking

Once a Policy Group is assigned, partners can request policies through the [Partner Policy Linking](../functional-overview/partner-administration.md#partner-policy-linking) module. Partner Admins review these requests and can [approve or reject](../functional-overview/end-user-guide.md#approvereject-policy) them through a structured workflow.

Enhancements are available for MISP Partners, allowing Partner Admins to manage MISP-specific policy associations through a dedicated tabular interface.

**Note:** For [**ABIS Partners**](../functional-overview/abis-partner-onboarding-by-partner-admin.md#abis-partner-policy-linking), [**Manual Adjudication Partners**](../functional-overview/onboard-manual-adjudication-partner.md) **and** [**Credential Partners**](../functional-overview/onboard-credential-partner.md) only **Data Share Policies** must be selected during policy linking.

## Authentication Services

### OIDC Client Management

PMS enables Authentication Partners to [create, manage, and associate OIDC Clients](../functional-overview/end-user-guide.md#oidc-client) with approved policies. Users can view OIDC Client details in both tabular and detailed views, including client identifiers and configuration settings.

Partner Admins and authorized Partner Users can access a **read-only view** of OIDC Client details to review mandatory and additional information without modifying configurations.

**Note:** For PMS deployments using eSignet versions **1.6.1 and higher**, OIDC Client creation includes additional information fields to support enhanced customization for relying parties.

### API Key Management

[API Keys](../functional-overview/end-user-guide.md#api-key) can be generated for approved policies to enable secure access to authentication services. Generated keys are visible in a tabular view and can be deactivated as required.

API Keys automatically deactivate upon expiry. By default, newly generated API Keys are configured with a long expiration duration (100 years), though this value can be overridden through admin-level configuration.

## Device and Biometric Ecosystem Management

### SBI and Device Management

[Device Providers](../functional-overview/device-provider.md) can register SBIs and associate devices under them. SBIs and devices must be submitted for [Partner Admin approval](../functional-overview/partner-administration.md#sbi-approval) before activation. PMS supports viewing, approving, rejecting, and deactivating SBIs and devices.

**Note:** Orphaned devices (devices without an associated SBI) can only be rejected by Partner Admins. SBIs and associated devices are automatically deactivated upon expiry.

### FTM Chip Management

[FTM Chip Providers](../functional-overview/ftm-chip-provider.md) can add, view, and deactivate FTM chip details and manage FTM chip certificates. [Partner Admins review and approve or reject](../functional-overview/partner-administration.md#ftm-chip-approval) submitted FTM chip requests.

## MISP Services

PMS includes a dedicated [MISP Services](../functional-overview/misp-partner-onboarding.md#misp-license-key) module for managing MISP License Keys. Partner Admins can generate new license keys, regenerate them with updated validity, view existing keys, and deactivate active keys.

If multiple license keys are generated for the same Partner ID, only the latest key remains active in the ID Authentication (IDA) module. License keys automatically deactivate upon expiry.

**Note:** Selecting a Policy Group and linking policies is optional for MISP Partners, but it is strongly recommended before generating a MISP License Key.

## Notifications and Alerts

PMS provides proactive [notifications](../functional-overview/pms-notification.md) through both the PMS portal and email. Notifications cover certificate expiries (Root, Intermediate, Partner, FTM Chip),MISP License Keys, API Keys, SBIs, and weekly summary updates for Partner Admins.

Notifications are sent at defined intervals: 30 days before expiry, 15 days before expiry, and daily reminders starting 10 days prior to expiry. Weekly summary notifications are sent every seven days.

Email notifications are delivered in the language selected during user registration, while PMS portal notifications follow the language selected at login.

Please refer [here](../functional-overview/pms-notification.md) for more details

**Note:** Portal notifications older than 60 days are automatically deleted.

## Audit Logging and Traceability

PMS captures audit logs for all certificate and expiry-related notifications, including both portal and email notifications. Logs are recorded for success and failure events and include metadata such as module name, notification ID, and event type.

For weekly summary notifications, audit logs are generated even when no expiring items are identified, ensuring consistent traceability across notification cycles.

## Browser, Language, and Compatibility Support

PMS fully supports Chrome, Firefox, Edge, and Safari browsers. The UI is optimized for standard desktop and laptop screen sizes with responsive layouts.

Multi-language support is enabled. However, only English, Arabic, and French resource bundles are provided by default. Additional languages must be added directly in the UI code and require recompilation.
