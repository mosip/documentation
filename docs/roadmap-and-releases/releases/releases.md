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

{% tabs %}
{% tab title="Pre-Releases" icon="flask" %}
**Pre-release**&#x20;

* [v1.2.1.1-RC.1](v1.2.1.1-rc.1/) (1 Jun 2026)
{% endtab %}

{% tab title="Component Releases" icon="puzzle-piece-simple" %}
**Component releases between v1.2.1.0 and v1.2.1.1 (17 releases) · 26 Dec 2025 – 22 Sep 2026**

<table><thead><tr><th width="120.7109375">Date</th><th>Component</th><th width="82.44140625">Version</th><th width="87.6328125">Type</th><th width="181.390625">Description</th><th></th></tr></thead><tbody><tr><td>21 Sep 2026</td><td>API Test Commons</td><td>v1.7.0</td><td></td><td>Dynamic ID-schema handling, OTP/SMTP listener reliability and report masking improvements.</td><td><a href="api-test-commons-releases/v1.7.0.md">View details →</a></td></tr><tr><td>2 Sep 2026</td><td>Partner Management System</td><td>1.2.2.4</td><td><mark style="background-color:green;">Patch</mark></td><td>Stronger automation tests, simpler database upgrade and rollback scripts, SonarCloud fixes.</td><td><a href="partner-management-system-1.2.2.4-patch/">View details →</a></td></tr><tr><td>28 Jul 2026</td><td>Android Registration Client</td><td>v1.1.1</td><td><mark style="background-color:green;">Patch</mark></td><td>Code quality, security configuration and maintainability fixes.</td><td><a href="android-registration-client-v1.1.1/">View details →</a></td></tr><tr><td>5 Jun 2026</td><td>Android Registration Client</td><td>v1.1.0</td><td><mark style="background-color:blue;">Minor</mark></td><td>Java 21 support, security hardening and interoperability improvements.</td><td><a href="android-registration-client-v1.1.0/">View details →</a></td></tr><tr><td>28 May 2026</td><td>MOSIP Component Release (15 repos)</td><td>v1.3.1</td><td><mark style="background-color:green;">Patch</mark></td><td>Corrects invalid licence folder paths across multiple repositories.</td><td><a href="mosip-component-release-v1.3.1.md">View details →</a></td></tr><tr><td>20 May 2026</td><td>Partner Management System Revamp</td><td>1.3.0-beta.5</td><td><mark style="background-color:orange;">Beta</mark></td><td>Onboarding for Credential and Manual Adjudication partners; DataShare policy validation.</td><td><a href="partner-management-system-revamp-1.3.0-beta.5/">View details →</a></td></tr><tr><td>20 May 2026</td><td>API Test Commons</td><td>v1.6.0</td><td></td><td>Authentication handling, DSL request and response logging, configuration clean-up.</td><td><a href="api-test-commons-releases/v1.6.0.md">View details →</a></td></tr><tr><td>22 Apr 2026</td><td>Registration Processor &#x26; ID Repository</td><td>1.2.1.3 &#x26; 1.2.3.0</td><td><mark style="background-color:purple;">Major</mark></td><td>Fixes email handles with underscores and tightens biometric-update validation.</td><td><a href="registration-processor-1.2.1.3-and-id-repository-1.2.3.0/">View details →</a></td></tr><tr><td>20 Apr 2026</td><td>DSL Orchestrator &#x26; Packet Creator</td><td>v1.2.2.0</td><td><mark style="background-color:blue;">Minor</mark></td><td>DSL release for environments running on Java 11.</td><td><a href="v1.2.2.0-dsl.md">View details →</a></td></tr><tr><td>10 Apr 2026</td><td>Android Registration Client</td><td>v1.0.1</td><td></td><td>Less hard-coded configuration, fuller audit logging and security improvements.</td><td><a href="android-registration-client-v1.0.1/">View details →</a></td></tr><tr><td>25 Mar 2026</td><td>DSL Orchestrator &#x26; Packet Creator</td><td>v1.4.0</td><td><mark style="background-color:blue;">Minor</mark></td><td>Wider test coverage, better reporting and more reliable execution.</td><td><a href="v1.4.0-dsl.md">View details →</a></td></tr><tr><td>25 Mar 2026</td><td>API Test Commons</td><td>v1.5.0</td><td></td><td>Test data generation, authentication utilities and security handling.</td><td><a href="api-test-commons-releases/v1.5.0.md">View details →</a></td></tr><tr><td>24 Mar 2026</td><td>Infra (Rapid Deployment)</td><td>0.2.0</td><td><mark style="background-color:blue;">Minor</mark></td><td>Adds eSignet 1.4.2 integration to the rapid deployment model.</td><td><a href="0.2.0-infra.md">View details →</a></td></tr><tr><td>4 Feb 2026</td><td>Partner Management System Revamp</td><td>1.3.0-beta.4</td><td><mark style="background-color:orange;">Beta</mark></td><td>ABIS partner type, simpler admin onboarding, OIDC client options and notifications.</td><td><a href="partner-management-system-revamp-1.3.0-beta.4/">View details →</a></td></tr><tr><td>22 Jan 2026</td><td>Infra (Rapid Deployment)</td><td>0.1.0</td><td></td><td>Stability and configuration fixes, expanded deployment documentation.</td><td><a href="0.1.0-infra.md">View details →</a></td></tr><tr><td>22 Jan 2026</td><td>ID Authentication &#x26; Resident</td><td>1.2.1.3</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes to the Resident and ID Authentication automation scripts for Infra 0.1.0.</td><td><a href="id-authentication-1.2.1.3-and-resident-1.2.1.3.md">View details →</a></td></tr><tr><td>22 Jan 2026</td><td>API Test Commons</td><td>v1.3.6</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes a configuration issue found after v1.3.5.</td><td><a href="api-test-commons-releases/v1.3.6.md">View details →</a></td></tr></tbody></table>
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
### MOSIP Platform v1.2.1.0

**26 Dec 2025** · Platform release · Major · <mark style="background-color:purple;">LTS</mark>

Stable, production-ready migration from Java 11 to Java 21, consolidating the 1.2.1.0 beta cycle.

[View platform release →](v1.2.1.0/)
{% endhint %}

{% tabs %}
{% tab title="Pre Release" icon="flask" %}
**Pre-releases**

* 1.2.1.0-beta.1&#x20;
  * [Part 4](1.2.1.0-beta.1-part-4/) (10 Jul 2025)
  * [Part 3](1.2.1.0-beta.1-part-3.md) (18 Mar 2025)
  * [Part 2](1.2.1.0-beta.1-part-2/) (16 Dec 2024)&#x20;
  * [Part 1](1.3.0-beta.1-mock-service-and-converters.md) (26 Nov 2024)
{% endtab %}

{% tab title="Component Releases" icon="puzzle-piece-simple" %}
**Component releases between 1.2.0.4 and v1.2.1.0 (7 releases) · 27 Oct 2025 – 25 Dec 2025**

<table><thead><tr><th width="100.1875">Date</th><th>Component</th><th width="104.22265625">Version</th><th width="86.484375">Type</th><th width="164.30078125">Description</th><th></th></tr></thead><tbody><tr><td>24 Dec 2025</td><td>DSL Orchestrator &#x26; Packet Creator</td><td>v1.3.0</td><td><mark style="background-color:blue;">Minor</mark></td><td>Java 21 compatibility with stability, performance and scalability gains.</td><td><a href="v1.3.0-dsl.md">View details →</a></td></tr><tr><td>1 Dec 2025</td><td>Android Registration Client</td><td>v1.0.0</td><td></td><td>GA release with GPS tracking and applicant biometric correction.</td><td><a href="android-registration-client-v1.0.0/">View details →</a></td></tr><tr><td>28 Nov 2025</td><td>API Test Commons</td><td>v1.3.5</td><td></td><td>Feature and stability update to the functional test framework.</td><td><a href="api-test-commons-releases/v1.3.5.md">View details →</a></td></tr><tr><td>27 Nov 2025</td><td>Partner Management System</td><td>1.2.2.3</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes critical functional bugs and automation issues.</td><td><a href="partner-management-system-1.2.2.3/">View details →</a></td></tr><tr><td>17 Nov 2025</td><td>ID Repository &#x26; ID Authentication</td><td>1.2.2.4 &#x26; 1.2.1.2</td><td><mark style="background-color:green;">Patch</mark></td><td>Critical bug fixes, automation reliability and infra compatibility.</td><td><a href="1.2.2.4-id-repository-and-1.2.1.2-id-authentication/">View details →</a></td></tr><tr><td>13 Nov 2025</td><td>Partner Management System Revamp</td><td>1.3.0-beta.3</td><td><mark style="background-color:orange;">Beta</mark></td><td>End-to-end support for MISP partners.</td><td><a href="partner-management-system-revamp-1.3.0-beta.3/">View details →</a></td></tr><tr><td>27 Oct 2025</td><td>Infra (Rapid Deployment)</td><td>0.1.0-beta.1</td><td><mark style="background-color:orange;">Beta</mark></td><td>First beta of the rapid deployment infrastructure.</td><td><a href="0.1.0-beta-mosip-rapid-deployment-infrastructure.md">View details →</a></td></tr></tbody></table>
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.4

**27 Oct 2025** · Platform release · Patch · <mark style="background-color:purple;">LTS</mark>

Aligns MOSIP components with the new infrastructure repository for the rapid deployment model.

[View platform release →](1.2.0.4.md)
{% endhint %}

{% tabs %}
{% tab title="Pre-Releases" icon="flask" %}
**N/A**
{% endtab %}

{% tab title="Component Releases" icon="puzzle-piece-simple" %}
**Component releases between 1.2.0.3 and 1.2.0.4 (4 releases) · 5 Sep 2025 – 26 Oct 2025**

<table><thead><tr><th width="105.5625">Date</th><th>Component</th><th width="85.06640625">Version</th><th width="86.1171875">Type</th><th width="171.27734375">Description</th><th></th></tr></thead><tbody><tr><td>22 Sep 2025</td><td>API Test Commons</td><td>v1.3.4</td><td><mark style="background-color:green;">Patch</mark></td><td>Helm chart enhancements.</td><td><a href="api-test-commons-releases/v1.3.4.md">Release-Notes →</a></td></tr><tr><td>5 Sep 2025</td><td>Admin Services</td><td>1.2.1.3</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes to the Admin Services automation test suites.</td><td><a href="1.2.1.3-admin-services.md">View details →</a></td></tr><tr><td>5 Sep 2025</td><td>Pre Registration</td><td>1.2.0.3</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes to the Pre-Registration automation test suites.</td><td><a href="1.2.0.3-pre-registration.md">View details →</a></td></tr><tr><td>5 Sep 2025</td><td>DSL Orchestrator &#x26; Packet Creator</td><td>v1.2.1.0</td><td><mark style="background-color:blue;">Minor</mark></td><td>Biometric variation generation and new test scenarios.</td><td><a href="dsl-v1.2.1.0.md">View details →</a></td></tr></tbody></table>
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.3

**5 Sep 2025** · Platform release · Patch · <mark style="background-color:purple;">LTS</mark>

Patch update that improves platform performance and resolves critical bugs.

[View platform release →](1.2.0.3.md)
{% endhint %}

{% tabs %}
{% tab title="Pre-Releases" icon="flask" %}
**N/A**
{% endtab %}

{% tab title="Component Releases" icon="puzzle-piece-simple" %}
**Component releases between 1.2.0.2 and 1.2.0.3 (27 releases) · 5 Apr 2024 – 4 Sep 2025**

<table><thead><tr><th width="104.12890625">Date</th><th>Component</th><th width="104">Version</th><th width="78.55078125">Type</th><th width="188.59765625">Description</th><th></th></tr></thead><tbody><tr><td>29 Aug 2025</td><td>Partner Management System Revamp</td><td>1.3.0-beta.2</td><td><mark style="background-color:orange;">Beta</mark></td><td>Java 21 upgrade; FTM chip certificate, SBI and API key notifications.</td><td><a href="partner-management-system-revamp-1.3.0-beta.2/">View details →</a></td></tr><tr><td>8 Aug 2025</td><td>Android Registration Client</td><td>v0.12.0</td><td><mark style="background-color:orange;">Beta</mark></td><td>Forgot password, AID QR code scan and Lost UIN.</td><td><a href="android-registration-client-0.12.0/">View details →</a></td></tr><tr><td>24 Jul 2025</td><td>Partner Management System Revamp</td><td>1.3.0-beta.1</td><td><mark style="background-color:orange;">Beta</mark></td><td>Java 21 upgrade and certificate expiry notifications.</td><td><a href="pms-revamp-1.3.0-beta.1.md">View details →</a></td></tr><tr><td>7 Jul 2025</td><td>ID Repository</td><td>1.2.2.2</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes to the ID Repository automation test suites.</td><td><a href="1.2.2.2-id-repository.md">View details →</a></td></tr><tr><td>7 Jul 2025</td><td>ID Authentication</td><td>1.2.1.1-beta</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes to the ID Authentication automation test suites.</td><td><a href="1.2.1.1-beta-id-authentication.md">View details →</a></td></tr><tr><td>7 Jul 2025</td><td>Pre Registration</td><td>1.2.0.2</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes to the Pre-Registration automation test suites.</td><td><a href="1.2.0.2-pre-registration.md">View details →</a></td></tr><tr><td>7 Jul 2025</td><td>Resident Services</td><td>1.2.1.2</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes to the Resident Services automation test suites.</td><td><a href="1.2.1.2-resident-services.md">View details →</a></td></tr><tr><td>7 Jul 2025</td><td>Admin Services</td><td>1.2.1.2</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes to the Admin Services automation test suites.</td><td><a href="1.2.1.2-admin-services.md">View details →</a></td></tr><tr><td>5 Jul 2025</td><td>Partner Management System Revamp</td><td>1.2.2.2</td><td><mark style="background-color:green;">Patch</mark></td><td>Fixes backward compatibility with earlier MOSIP platform versions.</td><td><a href="pms-revamp-v1.2.2.2.md">View details →</a></td></tr><tr><td>1 Jul 2025</td><td>API Test Commons</td><td>v1.3.3</td><td><mark style="background-color:green;">Patch</mark></td><td>Watchdog-based execution control, richer reporting and Slack notifications.</td><td><a href="api-test-commons-releases/v1.3.3.md">View details →</a></td></tr><tr><td>27 May 2025</td><td>Registration</td><td>v1.2.1.1</td><td><mark style="background-color:green;">Patch</mark></td><td>Critical fixes for Credential Requestor, Registration Processor and Notification.</td><td><a href="registration-v1.2.1.1.md">View details →</a></td></tr><tr><td>21 May 2025</td><td>Partner Management System Revamp</td><td>1.2.2.1</td><td><mark style="background-color:green;">Patch</mark></td><td>Makes PMS Revamp backward compatible with earlier MOSIP platform versions.</td><td><a href="pms-revamp-release-1.2.2.1-patch/">View details →</a></td></tr><tr><td>16 Apr 2025</td><td>Registration Processor</td><td>v1.2.1.0</td><td></td><td>Supports packet creation from external sources for easier integration.</td><td><a href="v1.2.1.0-registration-processor/">View details →</a></td></tr><tr><td>9 Apr 2025</td><td>Android Registration Client</td><td>v0.11.0</td><td></td><td>Handles during new registration, operator onboarding updates and dashboard.</td><td><a href="android-registration-client-v0.11.0/">View details →</a></td></tr><tr><td>27 Mar 2025</td><td>API Test Commons</td><td>v1.3.2</td><td></td><td>YAML loading improvements, security fixes and bug resolutions.</td><td><a href="api-test-commons-releases/v1.3.2.md">View details →</a></td></tr><tr><td>10 Mar 2025</td><td>Partner Management System</td><td>1.2.2.0</td><td></td><td>New Partner Management System UI with all legacy features.</td><td><a href="partner-management-system-1.2.2.0/">View details →</a></td></tr><tr><td>28 Jan 2025</td><td>Resident Services</td><td>v0.9.1</td><td><mark style="background-color:green;">Patch</mark></td><td>Bug fixes, security and performance improvements after v0.9.0.</td><td><a href="resident-services-v0.9.1/">View details →</a></td></tr><tr><td>28 Jan 2025</td><td>API Test Commons</td><td>v1.3.1</td><td></td><td>Enhancements and bug fixes to the functional tests.</td><td><a href="api-test-commons-releases/v1.3.1.md">View details →</a></td></tr><tr><td>8 Jan 2025</td><td>Registration Processor &#x26; ID Repository</td><td>1.2.0.2</td><td></td><td>Custom Handle support during new registration with the Android Registration Client.</td><td><a href="1.2.0.2-reg-processor-and-id-repo/">View details →</a></td></tr><tr><td>12 Dec 2024</td><td>API Test Commons</td><td>v1.3.0</td><td></td><td>New features and enhancements to the functional tests.</td><td><a href="api-test-commons-releases/v1.3.0.md">View details →</a></td></tr><tr><td>10 Sep 2024</td><td>Android Registration Client</td><td>0.11.0-beta.1</td><td><mark style="background-color:orange;">Beta</mark></td><td>Supervisor's approval and manual application upload or export.</td><td><a href="android-registration-client-0.11.0-beta.1/">View details →</a></td></tr><tr><td>3 Sep 2024</td><td>Partner Management System</td><td>1.3.0-dp.1</td><td><mark style="background-color:orange;">Developer Preview</mark></td><td>First step of the PMS revamp: the new Partner Management Portal.</td><td><a href="partner-management-system-1.3.0-dp1/">View details →</a></td></tr><tr><td>26 Aug 2024</td><td>MOSIP Config</td><td>1.2.2.0</td><td></td><td>Routes biometric data updates correctly to manual adjudication.</td><td><a href="1.2.2.0-mosip-config.md">View details →</a></td></tr><tr><td>5 Aug 2024</td><td>API Test Commons</td><td>v1.2.1</td><td></td><td>New features and enhancements to the functional tests.</td><td><a href="api-test-commons-releases-1.md">View details →</a></td></tr><tr><td>14 Jun 2024</td><td>Android Registration Client</td><td>v0.10.0</td><td><mark style="background-color:orange;">Beta</mark></td><td>Operator onboarding and dashboard.</td><td><a href="android-registration-client-v0.10.0/">View details →</a></td></tr><tr><td>30 May 2024</td><td>Resident Services</td><td>0.9.0</td><td></td><td>Resident self-services; runs on MOSIP platform 1.2.0.1.</td><td><a href="resident-services-0.9.0/">View details →</a></td></tr><tr><td>3 May 2024</td><td>ID Authentication</td><td>1.2.1.0</td><td></td><td>Resolves UIN and VID related errors during authentication.</td><td><a href="1.2.1.0/">View details</a></td></tr></tbody></table>
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.2

**5 Apr 2024** · Platform release · <mark style="background-color:purple;">LTS</mark>

Fixes critical reported bugs to improve stability and usability.

[View platform release →](1.2.0.2/)
{% endhint %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.1

**19 Mar 2024** · Platform release · <mark style="background-color:purple;">LTS</mark>

Brings together everything released in beta, including the upgrade to V3 architecture, DSL automation scripts and the Credential Requestor Stage.

[View platform release →](release-notes-1.2.0.1/)
{% endhint %}

{% tabs %}
{% tab title="First Tab" icon="flask" %}
**Pre-releases**

* [Beta 4](release-notes-1.2.0.1-b4/) (12 Jan 2024)
* [Beta 3](release-notes-1.2.0.1-b3/) (14 Apr 2023)
* [Beta 2](release-notes-1.2.0.1-b2.md) (8 Jan 2023)
* [Beta 1](release-notes-1.2.0.1-beta/) (14 Oct 2022)
{% endtab %}

{% tab title="Second Tab" icon="puzzle-piece-simple" %}
Component releases between 1.2.0 and 1.2.0.1 (3 releases) · 14 Feb 2022 – 18 Mar 2024

<table><thead><tr><th width="96.0703125">Date</th><th>Component</th><th width="101.83984375">Version</th><th width="103.421875">Type</th><th width="144.8828125">Description</th><th></th></tr></thead><tbody><tr><td>26 Feb 2024</td><td>Android Registration Client</td><td>0.9.0</td><td><mark style="background-color:orange;">Beta</mark></td><td>Device trust validation and transliteration.</td><td><a href="release-notes-android-reg-client-0.9.0/">View details →</a></td></tr><tr><td>7 Nov 2023</td><td>Android Registration Client</td><td>DP1</td><td><mark style="background-color:orange;">Developer Preview</mark></td><td>First developer preview of the tablet registration client.</td><td><a href="release-notes-android-reg-client-dp1.md">View details →</a></td></tr><tr><td>12 Sep 2023</td><td>Resident Services</td><td>DP1</td><td><mark style="background-color:orange;">Developer Preview</mark></td><td>Developer preview; runs on MOSIP platform 1.2.0.1-B3.</td><td><a href="release-notes-resident-portal-dp1.md">View details →</a></td></tr></tbody></table>
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0

**14 Feb 2022** · Platform release · Asymmetric Amoeba · <mark style="background-color:purple;">LTS</mark>

The Long Term Support release: manageability, usability, performance, security and support for multiple languages.

[View platform release →](release-notes/)
{% endhint %}

For releases before 1.2.0, see [Older Releases](https://docs.mosip.io/1.1.5/mosip-releases) in the previous version of the documentation.
