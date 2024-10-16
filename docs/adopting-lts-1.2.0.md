# 📋 Adopting LTS 1.2.0

MOSIP periodically releases new versions of the platform, tagged with their version numbers.

Asymmetric Amoeba is the latest stable Long Term Support (LTS 1.2.0) version. This release focuses on easy manageability, usability, enhanced performance, robustness, security, inclusivity, and comprehensive documentation. Additionally, **multiple languages** are now supported across modules.

LTS versions get patch releases with minor and major updates, as and when required.

**SUPPORTED FOR A MINIMUM OF 5 YEARS**

LTS 1.2.0 was released in February 2022 and will be supported at the minimum until February 2027.

_What happens after five years?_

* Support will be available for migration to the next LTS version for two years following its release.
* Adopter inputs and experiences will be factored in to fine-tune subsequent versions.

## Benefits of Long Term Support

LTS releases offer:

* Completely implemented roadmap features
* Frozen API and data formats
* Tooling, add-ons and extensions
* Compatible components and solutions in the marketplace
* Compliance and certification programs
* Active support
  * Proactive security updates
  * Patches for bugs
  * Periodical cumulative updates of functional, non-functional fixes and patches
  * Support for ecosystem partners for integration and implementation
* Additional support to adopting countries under MOU for versions under active support
  * L3 support to adopting countries
  * Training and capacity building
  * Technical advisory on ID and use case implementations

## What’s New in LTS 1.2.0

MOSIP's current LONG TERM SUPPORT RELEASE is v1.2.0. The section below highlights the key features, benefits, and new modules added.

**Functional Benefits**

* New Admin UI with robust APIs
* New Partner Management Portal UI with robust APIs
* New Resident Portal with robust APIs

**Other Benefits**

* Enhanced security
* Finer documentation
* Enhanced mechanism to evaluate performance
* Improved service-level performance
* Standalone stages of registration processing

**Tools & Add-ons**

* Anonymous profiling to cater to analytical needs
* Improved reporting for better forecasting and efficient decision-making
* V3 Deployment Architecture
* Dockerized test automation

**Newer Modules Compatible with LTS**

* eSignet
* Inji
* OpenG2P
* OpenCRVS
* Compliance Tool Kit
* Android RegClient

The existing adopters of pre-LTS stable versions can:

* Get access to the full feature set, latest tools, and add-on modules
* Get access to the best tier of support
* Get access to periodic updates and fixes
* Utilise the upgrade window to avoid falling into unsupported mode

### Upgrading to LTS 1.2.0

**Standard Procedure for LTS Migration**

1. **Discussing** migration and communication strategies (relying parties, stakeholders etc.)
2. **Prioritising** a list of issues that must be fixed before migration
3. **Understanding and analysing**, in detail, latest changes and customised features
4. **Identifying** sequencing of components and infra to be migrated
5. **Discussing** ways and means to automate specific steps
6. **Migrating** using upgrade scripts: DB, template, config, seed data, etc.
   * Phased migration: sandbox, staging, production
7. **Hardening** security
8. **Marking off** checklist template items

_Note_:

* The time and effort involvement depends on customisation requirements.
* Without customisations, the time needed would be about 2-3 months.
  * Time to deploy: 2 weeks
  * Time to execute upgrade scripts: 2-3 weeks
  * Time taken to test/ verify:
    * Two days for environment sanity using test rig automation
    * 3-4 weeks for full blown testing for all the modules

For detailed information on all the enhancements in the LTS 1.2.0 version, refer the [Release Notes](https://docs.mosip.io/1.2.0/releases/release-notes/enhancements).

See below for a brief overview of features and newly-added modules.

#### Admin Services

* LTS 1.2.0 features a new **full-blown admin console** with robust APIs
  * Admin application is a web-based application used by a privileged group of administrative personnel to manage various master data and resources like centres, devices, machines, users.
  * Along with the resource and data management, the admin can generate master keys, check registration status, retrieve lost RID, resume processing of paused packets etc.

To know more, read through the [Admin Portal User Guide](https://docs.mosip.io/1.2.0/modules/administration/admin-portal-user-guide).

#### Pre-registration and Registration

* A control panel has been added in the Registration Client for biometric and non-biometric devices and an for configurable settings. These settings gives the operator/supervisor better control of the system.
* The Registration Client is now capable of handling multiple time zone including the local time zone.
* A feature to **retrieve lost RID** has been added.

To know more, read the [Registration Client Settings page](https://docs.mosip.io/1.2.0/modules/registration-client/registration-client-settings-page).

#### ID Authentication

* **Authentication filters** have been added to ID Authentication.
* IDA is externalized through data sync via WebSub. This allows the relying parties to create their own IDA module or extend the existing IDA module.
* The ID Authentication module has been enhanced to retrieve any missing data such as credentials, partner data, and policies, in the event of a crash or time-out.
* The IDA database now stores the partner details, which includes data like the partner ID, policy ID, MISP ID, and API keys, to authenticate the above entities directly from IDA.

#### Partner Management

A new Partner Management Portal is available with robust APIs. This portal can be used by the partner admin, policy admin, and various MOSIP partners like authentication partners, device providers, FTM providers, and credential partners.

The partner portal has the following features:

* Self-registration of partners
* Partner-specific certificate upload
* Partner can add device models, FTM models, policy mapping, SBI details
* Partner and policy admins can approve/reject partner requests, create policies, and can add MOSIP-compliant CA (certificate authorities)

To know more, read through the [Partner Management Portal User Guide](https://docs.mosip.io/1.2.0/modules/partner-management-services/partner-management-portal).

#### Resident Services

* Resident portal is an online ID management system where the residents can avail services like download their UIN card, view history, lock/ unlock authentication types, generate/revoke VID, grievance redressal etc.
* To know more, read through [Resident Services](https://docs.mosip.io/1.2.0/modules/resident-services).

#### Hassle-free Upgrades

* Upgrade scripts are available that help in hassle free migration from 1.1.5.x to 1.2.0.x. These scripts will include the db upgrade scripts, template upgrade scripts, config upgrade scripts, MOSIP seed data upgrade scripts etc.

#### Deployment Architecture

* In LTS, support for legacy V2 deployment has been deprecated and the updated deployment method is V3 deployment that promises:
  * Enhanced security
  * High availability (owing to better load balancing)
  * Highly recommended for production
  * Performance enhancements

To learn more, read through [Deployment](https://docs.mosip.io/1.2.0/deploymentnew).

#### Improved Reporting

* LTS 1.2.0 provides a reporting framework for real-time streaming of data visualization on dashboards that gives a visual display of metrics and important data to track the status of various pre and post-enrolment processes. This data helps the ID issuers in improving efficiency, forecasting, and better decision-making. The framework has been used to create a set of default dashboards using Kibana.
* To know more, read through [Reporting](https://docs.mosip.io/1.2.0/modules/reporting).

#### Anonymous Profiling

* We have curated a data set called anonymous profile to cater to the analytic needs of the adopting countries which will help to assess the progress of ID programs.
* It is accessible to search engines such as elasticsearch.
* To know more, read through the [Anonymous Profiling Support](https://docs.mosip.io/1.2.0/id-lifecycle-management/anonymous-profiling-support).

#### Test Automation

* We now have a dockerized API test automation as opposed to the jar file execution due to which the entire process of automation has become faster owing to
  * Cron jobs that handle daily automation reports eliminating any need for manual trigger for test report generation.
  * Automatic language, environment, and secret key configuration.

To know more, read through [Automation Testing](https://docs.mosip.io/1.2.0/modules/automation-testing).

#### Enhanced Security

* Security should be built-in and not bolt-on. Taking our security checks to the next level, we completed a security audit as part of MOSIP 1.2.0 LTS (Asymmetric Amoeba), which was certified by Aujas.
* The components have been significantly tested for scale and performance. The adopting countries can now cater to their millions of customers with confidence.

#### Finer Documentation

* Documentation has evolved, thereby making a huge difference in resolving the issues of accessibility and assistive technology.
* The availability of comprehensive and well-devised user guides for all modules has helped the community to move one step closer towards simplified ways of working autonomously.

#### Performance Enhancements

* With the LTS 1.2.0 version, performance has been significantly improved.
* To know more, read through [Performance Test Reports](https://docs.mosip.io/1.2.0/releases/release-notes/performance-test-report).

## Newer Modules Compatible with LTS

#### eSignet

* eSignet allows easy login to any of the government services using a single credential and passwordless login using the supported authentication factors
* To know more, read through the [eSignet](https://docs.esignet.io/) documentation.

#### Inji

* A safe, trusted & inclusive mobile wallet and authenticator, that enables you to carry your digital IDs, prove your presence, (offline and online), and avail services in a snap.
* To know more, read through the [Inji](https://docs.mosip.io/inji/) documentation.

#### Compliance Tool Kit (CTK)

* the Compliance Tool Kit (CTK) is an online portal that can be used by MOSIP partners to test the compliance of their product developed as per specifications (specs) published/adopted by MOSIP.
* To know more, read through [Compliance Tool Kit](https://docs.mosip.io/compliance-tool-kit/versions/version-0.0.9) documentation.

#### OpenG2P

* OpenG2P is an open source platform upon which government-to-person (G2P) solutions can be built.
* The platform offers people facing processes such as onboarding into schemes, identity verification, and cash transfers to their bank accounts along with a self-serviced beneficiary portal.
* It also incorporates the government department facing features such as creation of registries and beneficiary lists, eligibility checks, scheme definition, payment disbursement and reconciliation.
* To know more, read through [OpenG2P](https://docs.openg2p.org/) documentation.

#### OpenCRVS

* OpenCRVS is a digital platform for recording a person's major life events like births, deaths, marriages, and divorces.
* It is a customisable open source solution designed for civil registration and it's essential services such as social protection, health care, education and economic and social opportunities.
