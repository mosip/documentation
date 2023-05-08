# ADOPTING LONG-TERM SUPPORT VERSION (1.2.0)

MOSIP periodically releases versions of the platform, tagged with their version numbers. 

Asymmetric Amoeba (1.2.0) is the latest stable version of LTS. This release focuses on easy manageability, usability, enhanced performance, robustness, security, inclusivity, and comprehensive documentation.

LTS versions get patch releases with minor and major updates as and when required.

* **SUPPORTED FOR A MINIMUM OF 5 YEARS**

Asymmetric Amoeba (1.2.0 LTS) was released in February 2022 and will be supported at the minimum until February 2027.

* What happens after the five years?

    * Support will be available for migration to next LTS version for two years.
    * Adopter inputs and experiences will be factored to fine tune during this duration.

## Benefits of Long-Term Support

LTS releases offer:

* Completely implemented roadmap features
* Frozen API and Data formats
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

## Details about the current stable LTS release

MOSIP's current LONG TERM SUPPORT RELEASE is v1.2.0 (Asymetric Amoeba). The section below highlights the key features, benefits and the new modules added.

### What’s New in Asymetric Amoeba

**FEATURES & FIXES**

**Functional benefits**

- New Admin UI with robust APIs
- New Partner Management Portal UI with robust APIs
- New Resident Portal with robust APIs

**Other benefits**

- Enhanced security
- Finer Documentation
- Enhanced mechanism to evaluate performance
- Improved service level performance
- Standalone stages of registration processing

**Tools & Add-ons**

- Anonymous profiling to cater to the analytic needs
- Improved reporting for better forecasting & efficient 
decision-making
- V3 Deployment Architecture
- Dockerized test automation

**Newer modules compatible with LTS**

- e-Signet
- Inji
- OpenG2P
- OpenCRVS
- Compliance Tool Kit
- Android RegClient

The existing adopters of pre-LTS stable versions can:
* Get access to the full feature set, latest tools, and add-on modules
* Get access to the best-tier of support
* Get access to periodic updates and fixes
* Utilise the upgrade window to avoid falling into unsupported mode

### Upgrading to ASYMMETRIC AMOEBA

**Standard Procedure for LTS Migration**

1. **Discussing** migration and communication strategies (relying parties, Stakeholders etc.)
2. **Prioritising** a list of issues that must be fixed before migration 
3. **Understanding and analysing**, in detail, latest changes and customised features
4. **Identifying** sequencing of components and infra to be migrated
5. **Discussing** ways and means to automate specific steps
6. **Migrating** using upgrade scripts- DB, template, config, seed data etc.
    * Phased migration: sandbox, staging, production
7. **Hardening** security
8. **Marking-off** checklist template items

_Note_:
* Time and effort involvement will depend on customisation needs.
* Without customisations, the time needed will be about 2-3 months.
    * Time to deploy: 2 weeks
    * Time to execute upgrade scripts:  2-3 weeks
    * Time taken to test/ verify:
        * Two days for environment sanity using test rig automation
        * 3-4 weeks for full blown testing for all the modules

For detailed information on all the enhancements in the LTS 1.2.0 version, refer the [Release Notes](https://docs.mosip.io/1.2.0/releases/release-notes/enhancements). However, let us briefly go over a couple of features and the newly added modules:

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
*	The ID Authentication module has been enhanced to retrieve any missing data such as credentials, partner data, and policies, in the event of a crash or time-out. 
* The IDA database now stores the partner details, which includes data like the partner ID, policy ID, MISP ID, and API keys, to authenticate the above entities directly from IDA.

#### Partner Management

A new Partner Management Portal is available with robust APIs. This portal can be used by the partner admin, policy admin, and various MOSIP partners like authentication partners, device providers, FTM providers, and credential partners.
 
The partner portal has the following features:
-	Self-registration of partners
-	Partner-specific certificate upload
-	Partner can add device models, FTM models, policy mapping, SBI details
-	Partner and policy admins can approve/reject partner requests, create policies, and can add MOSIP-compliant CA (certificate authorities)
	
To know more, read through the [Partner Management Portal User Guide](https://docs.mosip.io/1.2.0/modules/partner-management-services/partner-management-portal).

#### Resident Services

* Resident portal is an online ID management system where the residents can avail services like download their UIN card, view history, lock/ unlock authentication types, generate/revoke VID, grievance redressal etc.
* To know more, read through [Resident Services](https://docs.mosip.io/1.2.0/modules/resident-services).

#### Hassle-free Upgrades

* Upgrade scripts are available that help in hassle free migration from 1.1.5.x to 1.2.0.x. These scripts will include the db upgrade scripts, template upgrade scripts, config upgrade scripts, MOSIP seed data upgrade scripts etc.

#### Deployment architecture

* In LTS, support for legacy V2 deployment has been deprecated and the updated deployment method is V3 deployment that promises:
    * Enhanced security
    * High availability (owing to better load balancing)
    * Highly recommended for production
    * Performance enhancements

To learn more, read through the section on [Deployment](https://docs.mosip.io/1.2.0/deploymentnew).

#### Improved Reporting

* LTS 1.2.0 provides a reporting framework for real-time streaming of data visualization on dashboards that gives a visual display of metrics and important data to track the status of various pre and post-enrolment processes. This data helps the ID issuers in improving efficiency, forecasting, and better decision-making. The framework has been used to create a set of default dashboards using Kibana.
* To know more, read through [Reporting](https://docs.mosip.io/1.2.0/modules/reporting).

















