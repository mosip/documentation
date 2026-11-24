# Partner Management Service 1.3.0

**Release Number:** 1.3.0

**Release Date:** 21 Nov, 2026

### Overview <a href="#overview" id="overview"></a>

Partner Management System (PMS) Revamp [1.3.0](https://github.com/mosip/partner-management-services/tree/v1.3.0) introduces support for onboarding a new partner type and includes enhancements to multiple APIs, Biometric Extractor Provider configuration, and partner certificate expiry notifications.&#x20;

### Key Features & Enhancements

**1. Support for Online Verification Partner Onboarding**

This release introduces support for a new partner type called Online Verification Partner with complete end-to-end onboarding capabilities in PMS.

Added support for:

* Partner creation for Online Verification Partners.
* Policy request creation support for Partner Admins.
* Biometric Extractor Provider mapping support as part of the policy request workflow.
* Deactivation support for Online Verification Partners.
* End-to-end onboarding lifecycle support for Online Verification Partners across PMS workflows.

Please refer to the [User Guide](../../../id-lifecycle-management/support-systems/partner-management-services/functional-overview/online-verification-partner-onboarding.md) for detailed instructions and configuration steps.

**2. New Fields in Biometric Extractor Provider Configuration and Policy Mapping Workflow**

"Attribute Name" and "Credential Data Format" fields have been added to the Biometric Extractor Provider Configuration and the Policy Mapping workflow. This is applicable for both Credential Partner and Online Verification Partner.

**3. Partner Certificate Expiry Notifications for MOSIP Internal Default Partners**

Partner certificate expiry notifications have been enabled for MOSIP Internal default partners.

**4. API Enhancements**

Multiple APIs have been enhanced as part of this release for improved design, performance, and structure, resulting in more robust and consistent API behavior.

**5. New API for Credential Type Lookup by Partner and Policy**

Added a new API to fetch credential type(s) mapped to a partner for a given policy using `partnerId` and `policyId`, directly from the `partner_policy_credential_type` table. This enables admins to manage partner configurations and lets partners verify their mapped credential type(s) with a direct lookup.

{% hint style="info" %}
**Note:** For Device, SBI and FTM partners, IDA uses PMS only for certificate trust chain validation, so changes to these partners in PMS do not affect IDA. For all other partners, all PMS workflows are supported in IDA.
{% endhint %}

### Deprecated APIs <a href="#deprecated-apis" id="deprecated-apis"></a>

| API Endpoint                      | Method | Deprecation Description                                                                                                         | Replacement Endpoint                                                    |
| --------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| /admin-partners                   | GET    | The response does not include `logoUrl` and `additionalInfo` — fields required by the Resident Services.                        | GET /admin-partners/v2                                                  |
| /admin-partners/{partnerId}       | GET    | The response does not include `logoUrl` and `additionalInfo` — fields required by the Resident Services.                        | GET /admin-partners/v2/{partnerId}                                      |
| /partners/{partnerId}/contact/add | POST   | The pms.partner\_contact table is not kept in sync with the partner's main record. The PartnerContact class is also deprecated. | <p>PUT /partners/{partnerId}<br><br>PUT<br>/partners/v2/{partnerId}</p> |

### User Stories <a href="#user-stories" id="user-stories"></a>

| Feature                                                      | Issue ID                                                                 | Summary                                                                                                                          |
| ------------------------------------------------------------ | ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| Online Verification Partner Onboarding                       | [1852](https://github.com/mosip/partner-management-services/issues/1852) | Create Online Verification Partner                                                                                               |
|                                                              | [1853](https://github.com/mosip/partner-management-services/issues/1853) | View Online Verification Partner Details in PMS Portal                                                                           |
|                                                              | [1854](https://github.com/mosip/partner-management-services/issues/1854) | Upload / Re-Upload Online Verification Partner Certificate in PMS Portal                                                         |
|                                                              | [1855](https://github.com/mosip/partner-management-services/issues/1855) | Deactivate Online Verification Partner in PMS Portal                                                                             |
|                                                              | [1856](https://github.com/mosip/partner-management-services/issues/1856) | Approve or Reject Online Verification Partner Policy Requests in PMS Portal                                                      |
|                                                              | [1879](https://github.com/mosip/partner-management-services/issues/1879) | Request Policy for Online Verification Partner in PMS Portal                                                                     |
|                                                              | [1880](https://github.com/mosip/partner-management-services/issues/1880) | Tabular View of Online Verification Partner Policy Requests in PMS Portal                                                        |
|                                                              | [1881](https://github.com/mosip/partner-management-services/issues/1881) | Map Biometric Extractor Provider Configuration for Online Verification Partner Policy Request                                    |
|                                                              | [1882](https://github.com/mosip/partner-management-services/issues/1882) | Map Credential Type for Online Verification Partner Policy Request                                                               |
|                                                              | [1883](https://github.com/mosip/partner-management-services/issues/1883) | View Online Verification Partner Policy Request Details                                                                          |
| Delete Biometric Extractor Provider Configuration            | [1757](https://github.com/mosip/partner-management-services/issues/1757) | Partner Admin: Delete Biometric Extractor Provider Configuration                                                                 |
|                                                              | [1899](https://github.com/mosip/partner-management-services/issues/1899) | Add new endpoint PATCH /bio-extractor-configurations/{bioExtractorConfigurationId}                                               |
| Enhancement: Add new fields to Biometric Provider Extraction | [1897](https://github.com/mosip/partner-management-services/issues/1897) | Add “Attribute Name” & "Credential Data Format" fields to Biometric Extractor Provider Configuration and Policy Mapping Workflow |
|                                                              | [1997](https://github.com/mosip/partner-management-services/issues/1997) | Add attribute name and credential data format fields in POST`/bio-extractor-configurations`                                      |
|                                                              | [2000](https://github.com/mosip/partner-management-services/issues/2000) | Add attribute name and credential data format fields in Response in GET `/bio-extractor-configurations`                          |
|                                                              | [2001](https://github.com/mosip/partner-management-services/issues/2001) | Add attribute name and credential data format fields in GET `/bio-extractor-configurations/{bioExtractorConfigurationId}`        |
|                                                              | [1999](https://github.com/mosip/partner-management-services/issues/1999) | Add attribute name and credential data format fields in POST `/partner-policy-requests/{requestId}/bio-extractors-request`       |
| API Enhancements                                             | [1860](https://github.com/mosip/partner-management-services/issues/1860) | Update bio-extractors request POST endpoint to use requestId                                                                     |
|                                                              | [1861](https://github.com/mosip/partner-management-services/issues/1861) | Update credential-types request POST endpoint to use requestId                                                                   |
|                                                              | [1864](https://github.com/mosip/partner-management-services/issues/1864) | Update notifications GET endpoint response fields                                                                                |
|                                                              | [1893](https://github.com/mosip/partner-management-services/issues/1893) | MISP License API Refactor & UUID-Based Resource Migration                                                                        |
|                                                              | [1943](https://github.com/mosip/partner-management-services/issues/1943) | Create new API GET /partners/{partnerId}/credentialtypes/{policyId}                                                              |
|                                                              | [1950](https://github.com/mosip/partner-management-services/issues/1950) | Add V2 Admin Partner Endpoints and Extend Partner Creation Payload - logoUrl & additionalInfo                                    |
| Internal Partner Certificate Expiry Notifications            | [1985](https://github.com/mosip/partner-management-services/issues/1985) | Enable Partner Certificate expiry Notifications for MOSIP Internal default partners                                              |

## Known Issues <a href="#known-issues" id="known-issues"></a>

Please refer [here](https://github.com/mosip/partner-management-services/issues?q=label%3Aknown_issue) for the full list of known issues.

| Issue ID                                                                 | Summary                                                                                                                     |
| ------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------- |
| [2105](https://github.com/mosip/partner-management-services/issues/2105) | PMS-Revamp - Policy Group Selection Fails for Authentication partner with long Organization name and username.              |
| [1773](https://github.com/mosip/partner-management-services/issues/1773) | PMS Revamp- Partner ID/Username allows more than 36 characters during registration but fails at login with validation error |

### Repositories Released <a href="#repositories-released" id="repositories-released"></a>

| Repository                        | Branch        | Release Tag                                                                |
| --------------------------------- | ------------- | -------------------------------------------------------------------------- |
| mosip-partner-management-services | release-1.3.x | [v1.3.0](https://github.com/mosip/partner-management-services/tree/v1.3.0) |
| mosip-partner-management-ui       | release-1.3.x | [v1.3.0](https://github.com/mosip/partner-management-portal/tree/v1.3.0)   |
| mosip-config                      | release-1.3.x | [v1.3.2](https://github.com/mosip/mosip-config/tree/v1.3.2)                |

### Compatible Modules <a href="#compatible-modules" id="compatible-modules"></a>

| Module/ Repo            | Tags                                                             |
| ----------------------- | ---------------------------------------------------------------- |
| eSignet                 | [v1.8.0](https://github.com/mosip/esignet/tree/v1.8.0)           |
| Keymanager              | [v1.4.1](https://github.com/mosip/keymanager/tree/v1.4.1)        |
| ID Authentication (IDA) | [v1.3.1](https://github.com/mosip/id-authentication/tree/v1.3.1) |
| Registration            | [v1.3.1](https://github.com/mosip/registration/tree/v1.3.1)      |
| ID Repo                 | [v1.3.1](https://github.com/mosip/id-repository/tree/v1.3.1)     |
| Keycloak                | [v1.3.0](https://github.com/mosip/keycloak/tree/v1.3.0)          |
| Resident service        | [v1.3.0](https://github.com/mosip/resident-services/tree/v1.3.0) |
| Websub                  | [v1.3.2](https://github.com/mosip/websub/tree/v1.3.2)            |

### DB Changes <a href="#db-changes" id="db-changes"></a>

**Partner Management Services**

* Please refer the [link here](https://github.com/mosip/partner-management-services/blob/master/db_upgrade_scripts/mosip_pms/sql/1.2.2.4_to_1.3.0_upgrade.sql) for the DB upgrade script
* Please refer the [link here](https://github.com/mosip/partner-management-services/blob/master/db_upgrade_scripts/mosip_pms/sql/1.2.2.4_to_1.3.0_rollback.sql) for the DB rollback script

### Configuration Changes <a href="#configuration-changes" id="configuration-changes"></a>

**Partner Management Services:**

Below properties are updated for PMS:

1. `mosip.pms.bioextractor.allowed.template.attribute.names=individualbiometrics,introducerbiometrics`

For a comprehensive view of all configuration properties in PMS, please [refer here](https://github.com/mosip/partner-management-services/blob/master/partner/partner-management-service/src/main/resources/bootstrap.properties).

**Mosip Config:**

Below properties are updated in mosip-config for PMS:

1. `mosip.pms.required.roles=PARTNER_ADMIN`
2. `mosip.pms.required.roles.internalservices=CREDENTIAL_REQUEST`

For a comprehensive view of all configuration properties in mosip-config, please [refer here](https://github.com/mosip/mosip-config/blob/master/partner-management-default.properties).

## Learn More <a href="#learn-more" id="learn-more"></a>

* [Services](https://github.com/mosip/partner-management-services/tree/master)
* [Partner Management Portal](https://github.com/mosip/partner-management-portal/tree/master)
* [Features](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/overview/features)
* [End User Guides](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/functional-overview)
* [Technical Guide](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/develop)

#### Test Report <a href="#test-report" id="test-report"></a>

For details on the test results, [refer here](test-report.md).<br>
