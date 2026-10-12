---
hidden: true
---

# Releases

## Variant A: cards and expandables

### Release history

Latest releases at the top. Platform releases are consolidation milestones. Component releases are independent updates, listed under the platform release they follow.

<i class="fa-layer-group">:layer-group:</i> **Platform release**: consolidated platform version <i class="fa-cube">:cube:</i> **Component release**: individual or grouped component update

{% hint style="success" icon="cube" %}
**Resident Services v1.3.2**

**28 Sep 2026** · Component release · <mark style="background-color:green;">Patch</mark>

Fixes OTP handling in the API test rig and adds 43 automated test cases.

[View release notes →](resident-services-v1.3.2.md)
{% endhint %}

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform v1.2.1.1

**23 Sep 2026** · Platform release · <mark style="background-color:blue;">Latest platform</mark> <mark style="background-color:purple;">LTS</mark>

Performance, stability and resource optimisation across the Registration Processor pipeline.

Pre-release: [v1.2.1.1-RC.1](v1.2.1.1-rc.1/) (1 Jun 2026)

<a href="v1.2.1.1/" class="button primary">View platform release</a>
{% endhint %}

<details>

<summary>Component releases after v1.2.1.1 (1 release) · 23 Sep 2026 – Present</summary>

| Date        | Component         | Version | Type                                               | Description                                                              |                                               |
| ----------- | ----------------- | ------- | -------------------------------------------------- | ------------------------------------------------------------------------ | --------------------------------------------- |
| 28 Sep 2026 | Resident Services | v1.3.2  | <mark style="background-color:green;">Patch</mark> | Fixes OTP handling in the API test rig and adds 43 automated test cases. | [View details →](resident-services-v1.3.2.md) |

</details>

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

</details>

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform v1.2.1.0

**26 Dec 2025** · Platform release · <mark style="background-color:purple;">LTS</mark>

Stable, production-ready migration from Java 11 to Java 21, consolidating the 1.2.1.0 beta cycle.

Pre-releases: 1.2.1.0-beta.1 [Part 1](1.3.0-beta.1-mock-service-and-converters.md) (26 Nov 2024) · [Part 2](1.2.1.0-beta.1-part-2/) (16 Dec 2024) · [Part 3](1.2.1.0-beta.1-part-3.md) (18 Mar 2025) · [Part 4](1.2.1.0-beta.1-part-4/) (10 Jul 2025)

[View platform release →](v1.2.1.0/)
{% endhint %}

<details>

<summary>Component releases between 1.2.0.4 and v1.2.1.0 (7 releases) · 27 Oct 2025 – 25 Dec 2025</summary>

| Date        | Component                         | Version           | Type                                               | Description                                                              |                                                                        |
| ----------- | --------------------------------- | ----------------- | -------------------------------------------------- | ------------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| 24 Dec 2025 | DSL Orchestrator & Packet Creator | v1.3.0            | <mark style="background-color:blue;">Minor</mark>  | Java 21 compatibility with stability, performance and scalability gains. | [View details →](v1.3.0-dsl.md)                                        |
| 1 Dec 2025  | Android Registration Client       | v1.0.0            |                                                    | First 1.0 release of the tablet-based registration client.               | [View details →](android-registration-client-v1.0.0/)                  |
| 28 Nov 2025 | API Test Commons                  | v1.3.5            |                                                    | Feature and stability update to the functional test framework.           | [View details →](api-test-commons-releases/v1.3.5.md)                  |
| 27 Nov 2025 | Partner Management System         | 1.2.2.3           | <mark style="background-color:green;">Patch</mark> | Fixes critical functional bugs and automation issues.                    | [View details →](partner-management-system-1.2.2.3/)                   |
| 17 Nov 2025 | ID Repository & ID Authentication | 1.2.2.4 & 1.2.1.2 | <mark style="background-color:green;">Patch</mark> | Critical bug fixes, automation reliability and infra compatibility.      | [View details →](1.2.2.4-id-repository-and-1.2.1.2-id-authentication/) |
| 13 Nov 2025 | Partner Management System Revamp  | 1.3.0-beta.3      | <mark style="background-color:orange;">Beta</mark> | End-to-end support for MISP partners.                                    | [View details →](partner-management-system-revamp-1.3.0-beta.3/)       |
| 27 Oct 2025 | Infra (Rapid Deployment)          | 0.1.0-beta.1      | <mark style="background-color:orange;">Beta</mark> | First beta of the rapid deployment infrastructure.                       | [View details →](0.1.0-beta-mosip-rapid-deployment-infrastructure.md)  |

</details>

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.4

**27 Oct 2025** · Platform release · <mark style="background-color:green;">Patch</mark> <mark style="background-color:purple;">LTS</mark>

Aligns MOSIP components with the new infrastructure repository for the rapid deployment model.

[View platform release →](1.2.0.4.md)
{% endhint %}

***

## Variant B: the same cards inside an Updates block

Only the first three entries, to test the layout. The Updates block prints each date in a column on the left, which is the nearest GitBook equivalent of the timeline rail.

### Release history

{% updates format="full" %}
{% update date="2026-09-28" %}
##

{% hint style="success" icon="cube" %}
**Resident Services v1.3.2**

Component release · <mark style="background-color:green;">Patch</mark>

Fixes OTP handling in the API test rig and adds 43 automated test cases.

[View release notes →](resident-services-v1.3.2.md)
{% endhint %}
{% endupdate %}

{% update date="2026-09-23" %}
##

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform v1.2.1.1

Platform release · <mark style="background-color:blue;">Latest platform</mark> <mark style="background-color:purple;">LTS</mark>

Performance, stability and resource optimisation across the Registration Processor pipeline.

Pre-release: [v1.2.1.1-RC.1](v1.2.1.1-rc.1/) (1 Jun 2026)

<a href="v1.2.1.1/" class="button primary">View platform release</a>
{% endhint %}

<details>

<summary>Component releases after v1.2.1.1 (1 release) · 23 Sep 2026 – Present</summary>

| Date        | Component         | Version | Type                                               | Description                                                              |                                               |
| ----------- | ----------------- | ------- | -------------------------------------------------- | ------------------------------------------------------------------------ | --------------------------------------------- |
| 28 Sep 2026 | Resident Services | v1.3.2  | <mark style="background-color:green;">Patch</mark> | Fixes OTP handling in the API test rig and adds 43 automated test cases. | [View details →](resident-services-v1.3.2.md) |

</details>
{% endupdate %}

{% update date="2025-12-26" %}
##

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform v1.2.1.0

Platform release · <mark style="background-color:purple;">LTS</mark>

Stable, production-ready migration from Java 11 to Java 21, consolidating the 1.2.1.0 beta cycle.

[View platform release →](v1.2.1.0/)
{% endhint %}
{% endupdate %}
{% endupdates %}
