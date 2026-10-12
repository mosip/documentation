---
hidden: true
---

# Releases

## Release history

Latest releases at the top. Platform releases are consolidation milestones. Component releases are independent updates, listed under the platform release they follow. See the [versioning policy](versioning-policy.md) for how releases are named.

<i class="fa-layer-group">:layer-group:</i> **Platform release**: consolidated platform version <i class="fa-cube">:cube:</i> **Component release**: individual or grouped component update <i class="fa-flask">:flask:</i> **Pre-release**: beta or release candidate of a platform release

{% hint style="success" icon="cube" %}
**Resident Services v1.3.2**

**28 Sep 2026** · Component release · <mark style="background-color:green;">Patch</mark>

Fixes OTP handling in the API test rig and adds 43 automated test cases.

[View release notes →](resident-services-v1.3.2.md)
{% endhint %}

{% hint style="info" icon="layer-group" %}
### MOSIP Platform v1.2.1.1

**23 Sep 2026** · Platform release · Major · <mark style="background-color:blue;">Latest platform</mark> <mark style="background-color:purple;">LTS</mark>

Performance, stability and resource optimisation across the Registration Processor pipeline.

<a href="v1.2.1.1/" class="button primary">View platform release</a>
{% endhint %}

{% hint style="warning" icon="flask" %}
**Pre-release** · [v1.2.1.1-RC.1](v1.2.1.1-rc.1/) (1 Jun 2026)
{% endhint %}

<details>

<summary>Component releases between v1.2.1.0 and v1.2.1.1 (17 releases) · 26 Dec 2025 – 22 Sep 2026</summary>

| Date        | Component                              | Version           | Type                                                | Description                                                                                 |                                                                             |
| ----------- | -------------------------------------- | ----------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------- |
| 21 Sep 2026 | API Test Commons                       | v1.7.0            |                                                     | Dynamic ID-schema handling, OTP/SMTP listener reliability and report masking improvements.  | [View details →](api-test-commons-releases/v1.7.0.md)                       |
| 2 Sep 2026  | Partner Management System              | 1.2.2.4           | <mark style="background-color:green;">Patch</mark>  | Stronger automation tests, simpler database upgrade and rollback scripts, SonarCloud fixes. | [View details →](partner-management-system-1.2.2.4-patch/)                  |
| 28 Jul 2026 | Android Registration Client            | v1.1.1            | <mark style="background-color:green;">Patch</mark>  | Code quality, security configuration and maintainability fixes.                             | [View details →](android-registration-client-v1.1.1/)                       |
| 5 Jun 2026  | Android Registration Client            | v1.1.0            | <mark style="background-color:blue;">Minor</mark>   | Java 21 support, security hardening and interoperability improvements.                      | [View details →](android-registration-client-v1.1.0/)                       |
| 28 May 2026 | MOSIP Component Release (15 repos)     | v1.3.1            | <mark style="background-color:green;">Patch</mark>  | Corrects invalid licence folder paths across multiple repositories.                         | [View details →](mosip-component-release-v1.3.1.md)                         |
| 20 May 2026 | Partner Management System Revamp       | 1.3.0-beta.5      | <mark style="background-color:orange;">Beta</mark>  | Onboarding for Credential and Manual Adjudication partners; DataShare policy validation.    | [View details →](partner-management-system-revamp-1.3.0-beta.5/)            |
| 20 May 2026 | API Test Commons                       | v1.6.0            |                                                     | Authentication handling, DSL request and response logging, configuration clean-up.          | [View details →](api-test-commons-releases/v1.6.0.md)                       |
| 22 Apr 2026 | Registration Processor & ID Repository | 1.2.1.3 & 1.2.3.0 | <mark style="background-color:purple;">Major</mark> | Fixes email handles with underscores and tightens biometric-update validation.              | [View details →](registration-processor-1.2.1.3-and-id-repository-1.2.3.0/) |
| 20 Apr 2026 | DSL Orchestrator & Packet Creator      | v1.2.2.0          | <mark style="background-color:blue;">Minor</mark>   | DSL release for environments running on Java 11.                                            | [View details →](v1.2.2.0-dsl.md)                                           |
| 10 Apr 2026 | Android Registration Client            | v1.0.1            |                                                     | Less hard-coded configuration, fuller audit logging and security improvements.              | [View details →](android-registration-client-v1.0.1/)                       |
| 25 Mar 2026 | DSL Orchestrator & Packet Creator      | v1.4.0            | <mark style="background-color:blue;">Minor</mark>   | Wider test coverage, better reporting and more reliable execution.                          | [View details →](v1.4.0-dsl.md)                                             |
| 25 Mar 2026 | API Test Commons                       | v1.5.0            |                                                     | Test data generation, authentication utilities and security handling.                       | [View details →](api-test-commons-releases/v1.5.0.md)                       |
| 24 Mar 2026 | Infra (Rapid Deployment)               | 0.2.0             | <mark style="background-color:blue;">Minor</mark>   | Adds eSignet 1.4.2 integration to the rapid deployment model.                               | [View details →](0.2.0-infra.md)                                            |
| 4 Feb 2026  | Partner Management System Revamp       | 1.3.0-beta.4      | <mark style="background-color:orange;">Beta</mark>  | ABIS partner type, simpler admin onboarding, OIDC client options and notifications.         | [View details →](partner-management-system-revamp-1.3.0-beta.4/)            |
| 22 Jan 2026 | Infra (Rapid Deployment)               | 0.1.0             |                                                     | Stability and configuration fixes, expanded deployment documentation.                       | [View details →](0.1.0-infra.md)                                            |
| 22 Jan 2026 | ID Authentication & Resident           | 1.2.1.3           | <mark style="background-color:green;">Patch</mark>  | Fixes to the Resident and ID Authentication automation scripts for Infra 0.1.0.             | [View details →](id-authentication-1.2.1.3-and-resident-1.2.1.3.md)         |
| 22 Jan 2026 | API Test Commons                       | v1.3.6            | <mark style="background-color:green;">Patch</mark>  | Fixes a configuration issue found after v1.3.5.                                             | [View details →](api-test-commons-releases/v1.3.6.md)                       |

{% hint style="info" %}

{% endhint %}

</details>



### **26 Dec 2025 to**&#x20;



{% hint style="info" icon="layer-group" %}
#### MOSIP Platform v1.2.1.0

**26 Dec 2025** · Platform release · Major · <mark style="background-color:purple;">LTS</mark>

Stable, production-ready migration from Java 11 to Java 21, consolidating the 1.2.1.0 beta cycle.

[View platform release →](v1.2.1.0/)
{% endhint %}

{% hint style="warning" icon="flask" %}
**Pre-releases** · 1.2.1.0-beta.1 [Part 1](1.3.0-beta.1-mock-service-and-converters.md) (26 Nov 2024) · [Part 2](1.2.1.0-beta.1-part-2/) (16 Dec 2024) · [Part 3](1.2.1.0-beta.1-part-3.md) (18 Mar 2025) · [Part 4](1.2.1.0-beta.1-part-4/) (10 Jul 2025)
{% endhint %}

{% tabs %}
{% tab title="Pre Release" icon="gamepad-modern" %}
**Table Structure**

**Pre-releases** · 1.2.1.0-beta.1 [Part 1](1.3.0-beta.1-mock-service-and-converters.md) (26 Nov 2024) · [Part 2](1.2.1.0-beta.1-part-2/) (16 Dec 2024) · [Part 3](1.2.1.0-beta.1-part-3.md) (18 Mar 2025) · [Part 4](1.2.1.0-beta.1-part-4/) (10 Jul 2025)
{% endtab %}

{% tab title="Component Releases" %}
Component releases between 1.2.0.4 and v1.2.1.0 (7 releases) · 27 Oct 2025 – 25 Dec 2025



| Date        | Component                         | Version           | Type                                               | Description                                                              |                                                                        |
| ----------- | --------------------------------- | ----------------- | -------------------------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| 24 Dec 2025 | DSL Orchestrator & Packet Creator | v1.3.0            | <mark style="background-color:blue;">Minor</mark>  | Java 21 compatibility with stability, performance and scalability gains. | [View details →](v1.3.0-dsl.md)                                        |
| 1 Dec 2025  | Android Registration Client       | v1.0.0            |                                                    | GA release with GPS tracking and applicant biometric correction.         | [View details →](android-registration-client-v1.0.0/)                  |
| 28 Nov 2025 | API Test Commons                  | v1.3.5            |                                                    | Feature and stability update to the functional test framework.           | [View details →](api-test-commons-releases/v1.3.5.md)                  |
| 27 Nov 2025 | Partner Management System         | 1.2.2.3           | <mark style="background-color:green;">Patch</mark> | Fixes critical functional bugs and automation issues.                    | [View details →](partner-management-system-1.2.2.3/)                   |
| 17 Nov 2025 | ID Repository & ID Authentication | 1.2.2.4 & 1.2.1.2 | <mark style="background-color:green;">Patch</mark> | Critical bug fixes, automation reliability and infra compatibility.      | [View details →](1.2.2.4-id-repository-and-1.2.1.2-id-authentication/) |
| 13 Nov 2025 | Partner Management System Revamp  | 1.3.0-beta.3      | <mark style="background-color:orange;">Beta</mark> | End-to-end support for MISP partners.                                    | [View details →](partner-management-system-revamp-1.3.0-beta.3/)       |
| 27 Oct 2025 | Infra (Rapid Deployment)          | 0.1.0-beta.1      | <mark style="background-color:orange;">Beta</mark> | First beta of the rapid deployment infrastructure.                       | [View details →](0.1.0-beta-mosip-rapid-deployment-infrastructure.md)  |
{% endtab %}
{% endtabs %}











<details>

<summary>Component releases between 1.2.0.4 and v1.2.1.0 (7 releases) · 27 Oct 2025 – 25 Dec 2025</summary>

| Date        | Component                         | Version           | Type                                               | Description                                                              |                                                                        |
| ----------- | --------------------------------- | ----------------- | -------------------------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| 24 Dec 2025 | DSL Orchestrator & Packet Creator | v1.3.0            | <mark style="background-color:blue;">Minor</mark>  | Java 21 compatibility with stability, performance and scalability gains. | [View details →](v1.3.0-dsl.md)                                        |
| 1 Dec 2025  | Android Registration Client       | v1.0.0            |                                                    | GA release with GPS tracking and applicant biometric correction.         | [View details →](android-registration-client-v1.0.0/)                  |
| 28 Nov 2025 | API Test Commons                  | v1.3.5            |                                                    | Feature and stability update to the functional test framework.           | [View details →](api-test-commons-releases/v1.3.5.md)                  |
| 27 Nov 2025 | Partner Management System         | 1.2.2.3           | <mark style="background-color:green;">Patch</mark> | Fixes critical functional bugs and automation issues.                    | [View details →](partner-management-system-1.2.2.3/)                   |
| 17 Nov 2025 | ID Repository & ID Authentication | 1.2.2.4 & 1.2.1.2 | <mark style="background-color:green;">Patch</mark> | Critical bug fixes, automation reliability and infra compatibility.      | [View details →](1.2.2.4-id-repository-and-1.2.1.2-id-authentication/) |
| 13 Nov 2025 | Partner Management System Revamp  | 1.3.0-beta.3      | <mark style="background-color:orange;">Beta</mark> | End-to-end support for MISP partners.                                    | [View details →](partner-management-system-revamp-1.3.0-beta.3/)       |
| 27 Oct 2025 | Infra (Rapid Deployment)          | 0.1.0-beta.1      | <mark style="background-color:orange;">Beta</mark> | First beta of the rapid deployment infrastructure.                       | [View details →](0.1.0-beta-mosip-rapid-deployment-infrastructure.md)  |

</details>

***



{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.4

**27 Oct 2025** · Platform release · Patch · <mark style="background-color:purple;">LTS</mark>

Aligns MOSIP components with the new infrastructure repository for the rapid deployment model.

[View platform release →](1.2.0.4.md)
{% endhint %}

<details>

<summary>Component releases between 1.2.0.3 and 1.2.0.4 (4 releases) · 5 Sep 2025 – 26 Oct 2025</summary>

| Date        | Component                         | Version  | Type                                               | Description                                            |                                                       |
| ----------- | --------------------------------- | -------- | -------------------------------------------------- | ------------------------------------------------------ | ----------------------------------------------------- |
| 22 Sep 2025 | API Test Commons                  | v1.3.4   | <mark style="background-color:green;">Patch</mark> | Helm chart enhancements.                               | [View details →](api-test-commons-releases/v1.3.4.md) |
| 5 Sep 2025  | Admin Services                    | 1.2.1.3  | <mark style="background-color:green;">Patch</mark> | Fixes to the Admin Services automation test suites.    | [View details →](1.2.1.3-admin-services.md)           |
| 5 Sep 2025  | Pre Registration                  | 1.2.0.3  | <mark style="background-color:green;">Patch</mark> | Fixes to the Pre-Registration automation test suites.  | [View details →](1.2.0.3-pre-registration.md)         |
| 5 Sep 2025  | DSL Orchestrator & Packet Creator | v1.2.1.0 | <mark style="background-color:blue;">Minor</mark>  | Biometric variation generation and new test scenarios. | [View details →](dsl-v1.2.1.0.md)                     |

</details>

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.3

**5 Sep 2025** · Platform release · Patch · <mark style="background-color:purple;">LTS</mark>

Patch update that improves platform performance and resolves critical bugs.

[View platform release →](1.2.0.3.md)
{% endhint %}

<details>

<summary>Component releases between 1.2.0.2 and 1.2.0.3 (27 releases) · 5 Apr 2024 – 4 Sep 2025</summary>

| Date        | Component                              | Version       | Type                                                            | Description                                                                         |                                                                  |
| ----------- | -------------------------------------- | ------------- | --------------------------------------------------------------- | ----------------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| 29 Aug 2025 | Partner Management System Revamp       | 1.3.0-beta.2  | <mark style="background-color:orange;">Beta</mark>              | Java 21 upgrade; FTM chip certificate, SBI and API key notifications.               | [View details →](partner-management-system-revamp-1.3.0-beta.2/) |
| 8 Aug 2025  | Android Registration Client            | v0.12.0       | <mark style="background-color:orange;">Beta</mark>              | Forgot password, AID QR code scan and Lost UIN.                                     | [View details →](android-registration-client-0.12.0/)            |
| 24 Jul 2025 | Partner Management System Revamp       | 1.3.0-beta.1  | <mark style="background-color:orange;">Beta</mark>              | Java 21 upgrade and certificate expiry notifications.                               | [View details →](pms-revamp-1.3.0-beta.1.md)                     |
| 7 Jul 2025  | ID Repository                          | 1.2.2.2       | <mark style="background-color:green;">Patch</mark>              | Fixes to the ID Repository automation test suites.                                  | [View details →](1.2.2.2-id-repository.md)                       |
| 7 Jul 2025  | ID Authentication                      | 1.2.1.1-beta  | <mark style="background-color:green;">Patch</mark>              | Fixes to the ID Authentication automation test suites.                              | [View details →](1.2.1.1-beta-id-authentication.md)              |
| 7 Jul 2025  | Pre Registration                       | 1.2.0.2       | <mark style="background-color:green;">Patch</mark>              | Fixes to the Pre-Registration automation test suites.                               | [View details →](1.2.0.2-pre-registration.md)                    |
| 7 Jul 2025  | Resident Services                      | 1.2.1.2       | <mark style="background-color:green;">Patch</mark>              | Fixes to the Resident Services automation test suites.                              | [View details →](1.2.1.2-resident-services.md)                   |
| 7 Jul 2025  | Admin Services                         | 1.2.1.2       | <mark style="background-color:green;">Patch</mark>              | Fixes to the Admin Services automation test suites.                                 | [View details →](1.2.1.2-admin-services.md)                      |
| 5 Jul 2025  | Partner Management System Revamp       | 1.2.2.2       | <mark style="background-color:green;">Patch</mark>              | Fixes backward compatibility with earlier MOSIP platform versions.                  | [View details →](pms-revamp-v1.2.2.2.md)                         |
| 1 Jul 2025  | API Test Commons                       | v1.3.3        | <mark style="background-color:green;">Patch</mark>              | Watchdog-based execution control, richer reporting and Slack notifications.         | [View details →](api-test-commons-releases/v1.3.3.md)            |
| 27 May 2025 | Registration                           | v1.2.1.1      | <mark style="background-color:green;">Patch</mark>              | Critical fixes for Credential Requestor, Registration Processor and Notification.   | [View details →](registration-v1.2.1.1.md)                       |
| 21 May 2025 | Partner Management System Revamp       | 1.2.2.1       | <mark style="background-color:green;">Patch</mark>              | Makes PMS Revamp backward compatible with earlier MOSIP platform versions.          | [View details →](pms-revamp-release-1.2.2.1-patch/)              |
| 16 Apr 2025 | Registration Processor                 | v1.2.1.0      |                                                                 | Supports packet creation from external sources for easier integration.              | [View details →](v1.2.1.0-registration-processor/)               |
| 9 Apr 2025  | Android Registration Client            | v0.11.0       |                                                                 | Handles during new registration, operator onboarding updates and dashboard.         | [View details →](android-registration-client-v0.11.0/)           |
| 27 Mar 2025 | API Test Commons                       | v1.3.2        |                                                                 | YAML loading improvements, security fixes and bug resolutions.                      | [View details →](api-test-commons-releases/v1.3.2.md)            |
| 10 Mar 2025 | Partner Management System              | 1.2.2.0       |                                                                 | New Partner Management System UI with all legacy features.                          | [View details →](partner-management-system-1.2.2.0/)             |
| 28 Jan 2025 | Resident Services                      | v0.9.1        | <mark style="background-color:green;">Patch</mark>              | Bug fixes, security and performance improvements after v0.9.0.                      | [View details →](resident-services-v0.9.1/)                      |
| 28 Jan 2025 | API Test Commons                       | v1.3.1        |                                                                 | Enhancements and bug fixes to the functional tests.                                 | [View details →](api-test-commons-releases/v1.3.1.md)            |
| 8 Jan 2025  | Registration Processor & ID Repository | 1.2.0.2       |                                                                 | Custom Handle support during new registration with the Android Registration Client. | [View details →](1.2.0.2-reg-processor-and-id-repo/)             |
| 12 Dec 2024 | API Test Commons                       | v1.3.0        |                                                                 | New features and enhancements to the functional tests.                              | [View details →](api-test-commons-releases/v1.3.0.md)            |
| 10 Sep 2024 | Android Registration Client            | 0.11.0-beta.1 | <mark style="background-color:orange;">Beta</mark>              | Supervisor's approval and manual application upload or export.                      | [View details →](android-registration-client-0.11.0-beta.1/)     |
| 3 Sep 2024  | Partner Management System              | 1.3.0-dp.1    | <mark style="background-color:orange;">Developer Preview</mark> | First step of the PMS revamp: the new Partner Management Portal.                    | [View details →](partner-management-system-1.3.0-dp1/)           |
| 26 Aug 2024 | MOSIP Config                           | 1.2.2.0       |                                                                 | Routes biometric data updates correctly to manual adjudication.                     | [View details →](1.2.2.0-mosip-config.md)                        |
| 5 Aug 2024  | API Test Commons                       | v1.2.1        |                                                                 | New features and enhancements to the functional tests.                              | [View details →](api-test-commons-releases-1.md)                 |
| 14 Jun 2024 | Android Registration Client            | v0.10.0       | <mark style="background-color:orange;">Beta</mark>              | Operator onboarding and dashboard.                                                  | [View details →](android-registration-client-v0.10.0/)           |
| 30 May 2024 | Resident Services                      | 0.9.0         |                                                                 | Resident self-services; runs on MOSIP platform 1.2.0.1.                             | [View details →](resident-services-0.9.0/)                       |
| 3 May 2024  | ID Authentication                      | 1.2.1.0       |                                                                 | Resolves UIN and VID related errors during authentication.                          | [View details →](1.2.1.0/)                                       |

</details>

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.2

**5 Apr 2024** · Platform release · <mark style="background-color:purple;">LTS</mark>

Fixes critical reported bugs to improve stability and usability.

[View platform release →](1.2.0.2/)
{% endhint %}

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.1

**19 Mar 2024** · Platform release · <mark style="background-color:purple;">LTS</mark>

Brings together everything released in beta, including the upgrade to V3 architecture, DSL automation scripts and the Credential Requestor Stage.

[View platform release →](release-notes-1.2.0.1/)
{% endhint %}

{% hint style="warning" icon="flask" %}
**Pre-releases** · [Beta 1](release-notes-1.2.0.1-beta/) (14 Oct 2022) · [Beta 2](release-notes-1.2.0.1-b2.md) (8 Jan 2023) · [Beta 3](release-notes-1.2.0.1-b3/) (14 Apr 2023) · [Beta 4](release-notes-1.2.0.1-b4/) (12 Jan 2024)
{% endhint %}

<details>

<summary>Component releases between 1.2.0 and 1.2.0.1 (3 releases) · 14 Feb 2022 – 18 Mar 2024</summary>

| Date        | Component                   | Version | Type                                                            | Description                                                |                                                           |
| ----------- | --------------------------- | ------- | --------------------------------------------------------------- | ---------------------------------------------------------- | --------------------------------------------------------- |
| 26 Feb 2024 | Android Registration Client | 0.9.0   | <mark style="background-color:orange;">Beta</mark>              | Device trust validation and transliteration.               | [View details →](release-notes-android-reg-client-0.9.0/) |
| 7 Nov 2023  | Android Registration Client | DP1     | <mark style="background-color:orange;">Developer Preview</mark> | First developer preview of the tablet registration client. | [View details →](release-notes-android-reg-client-dp1.md) |
| 12 Sep 2023 | Resident Services           | DP1     | <mark style="background-color:orange;">Developer Preview</mark> | Developer preview; runs on MOSIP platform 1.2.0.1-B3.      | [View details →](release-notes-resident-portal-dp1.md)    |

</details>

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0

**14 Feb 2022** · Platform release · Asymmetric Amoeba · <mark style="background-color:purple;">LTS</mark>

The Long Term Support release: manageability, usability, performance, security and support for multiple languages.

[View platform release →](release-notes/)
{% endhint %}

For releases before 1.2.0, see [Older Releases](https://docs.mosip.io/1.1.5/mosip-releases) in the previous version of the documentation.
