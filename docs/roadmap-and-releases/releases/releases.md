---
hidden: true
---

# Releases

## Release history

Latest releases at the top. Platform releases are consolidation milestones. Component releases are independent updates, listed under the platform release they follow. See the [versioning policy](versioning-policy.md) for how releases are named.

<i class="fa-layer-group">:layer-group:</i> **Platform release**: consolidated platform version <i class="fa-cube">:cube:</i> **Component release**: individual or grouped component update <i class="fa-flask">:flask:</i> **Pre-release**: beta or release candidate of a platform release

## Release history: proposed approach

{% hint style="warning" %}
Draft for review. This section shows the same releases as above, regrouped by how a deployment adopts them. The **Kind** and **Next platform release ships** columns are drafts to be confirmed.
{% endhint %}

**How to read this**

* **You adopt consolidated platform releases only:** read the platform cards and the **Included in This Release** tab. You can skip the other tabs.
* **You also adopt updates between platform releases:** find the platform release you run and open **Updates After This Release**. It lists everything released separately since then, until the next platform release.

**Kind of update**

* **Platform module:** a repository that ships in platform releases, released on its own between them.
* **Separate module:** a module with its own release line, such as Android Registration Client or Partner Management System.
* **Tooling:** test or deployment tooling, such as API Test Commons, DSL or Infra.





{% hint style="info" icon="layer-group" %}
#### MOSIP Platform v1.2.1.1

**23 Sep 2026** · Platform release · Major · <mark style="background-color:blue;">Latest platform</mark> <mark style="background-color:purple;">LTS</mark>

Performance, stability and resource optimisation across the Registration Processor pipeline.

<a href="v1.2.1.1/" class="button primary">View platform release</a>
{% endhint %}

{% tabs %}
{% tab title="Included in This Release" icon="cubes" %}
**Repositories shipped with v1.2.1.1 (19)**

| Repository           | Version                                                             |
| -------------------- | ------------------------------------------------------------------- |
| mosip-config         | [v1.3.1](https://github.com/mosip/mosip-config/tree/v1.3.1)         |
| mosip-data           | [v1.3.2](https://github.com/mosip/mosip-data/tree/v1.3.2)           |
| commons              | [v1.3.1](https://github.com/mosip/commons/tree/v1.3.1)              |
| khazana              | [v1.3.2](https://github.com/mosip/khazana/tree/v1.3.2)              |
| keymanager           | [v1.4.1](https://github.com/mosip/keymanager/tree/v1.4.1)           |
| registration         | [v1.3.1](https://github.com/mosip/registration/tree/v1.3.1)         |
| mosip-ref-impl       | [v1.3.1](https://github.com/mosip/mosip-ref-impl/tree/v1.3.1)       |
| id-repository        | [v1.3.1](https://github.com/mosip/id-repository/tree/v1.3.1)        |
| id-authentication    | [v1.3.1](https://github.com/mosip/id-authentication/tree/v1.3.1)    |
| mosip-mock-services  | [v1.3.1](https://github.com/mosip/mosip-mock-services/tree/v1.3.1)  |
| packet-manager       | [v1.3.1](https://github.com/mosip/packet-manager/tree/v1.3.1)       |
| durian               | [v1.3.1](https://github.com/mosip/durian/tree/v1.3.1)               |
| audit-manager        | [v1.3.2](https://github.com/mosip/audit-manager/tree/v1.3.2)        |
| biosdk-services      | [v1.3.1](https://github.com/mosip/biosdk-services/tree/v1.3.1)      |
| websub               | [v1.3.2](https://github.com/mosip/websub/tree/v1.3.2)               |
| artifactory-ref-impl | [v1.3.2](https://github.com/mosip/artifactory-ref-impl/tree/v1.3.2) |
| infra                | [v0.3.1](https://github.com/mosip/infra/tree/v0.3.1)                |
| k8s-infra            | [v1.2.1.3](https://github.com/mosip/k8s-infra/tree/v1.2.1.3)        |
| mosip-infra          | [v1.2.1.1](https://github.com/mosip/mosip-infra/tree/v1.2.1.1)      |

**Compatible modules (5)**

| Module                      | Compatible version                                                             |
| --------------------------- | ------------------------------------------------------------------------------ |
| partner-management-services | [v1.2.2.3](https://github.com/mosip/partner-management-services/tree/v1.2.2.3) |
| resident-ui                 | [v0.9.0](https://github.com/mosip/resident-ui/releases/tag/v0.9.0)             |
| eSignet                     | [v1.4.1](https://github.com/mosip/esignet/tree/v1.4.1)                         |
| registration-client         | [v1.2.0.2](https://github.com/mosip/registration-client/tree/v1.2.0.2)         |
| mosip-automation-test       | [v1.4.0](https://github.com/mosip/mosip-automation-tests/tree/v1.4.0)          |
{% endtab %}

{% tab title="Updates After This Release (1)" icon="puzzle-piece-simple" %}
**Released separately after v1.2.1.1 (1 release) · 23 Sep 2026 – Present**

| Date        | Release                                                 | Type                                               | Kind            | Description                                                              |
| ----------- | ------------------------------------------------------- | -------------------------------------------------- | --------------- | ------------------------------------------------------------------------ |
| 28 Sep 2026 | [Resident Services v1.3.2](resident-services-v1.3.2.md) | <mark style="background-color:green;">Patch</mark> | Platform module | Fixes OTP handling in the API test rig and adds 43 automated test cases. |
{% endtab %}

{% tab title="Pre-Releases (1)" icon="flask" %}
* [v1.2.1.1-RC.1](v1.2.1.1-rc.1/) (1 Jun 2026)
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform v1.2.1.0

**26 Dec 2025** · Platform release · Major · <mark style="background-color:purple;">LTS</mark>

Stable, production-ready migration from Java 11 to Java 21, consolidating the 1.2.1.0 beta cycle.

[View platform release →](v1.2.1.0/)
{% endhint %}

{% tabs %}
{% tab title="Included in This Release" icon="cubes" %}
**Repositories shipped with v1.2.1.0 (37)**

| Repository           | Version                                                             |
| -------------------- | ------------------------------------------------------------------- |
| admin-ui             | [v1.3.0](https://github.com/mosip/admin-ui/tree/v1.3.0)             |
| artifactory-ref-impl | [v1.3.0](https://github.com/mosip/artifactory-ref-impl/tree/v1.3.0) |
| admin-services       | [v1.3.0](https://github.com/mosip/admin-services/tree/v1.3.0)       |
| audit-manager        | [v1.3.0](https://github.com/mosip/audit-manager/tree/v1.3.0)        |
| biosdk-client        | [v1.3.0](https://github.com/mosip/biosdk-client/tree/v1.3.0)        |
| commons              | [v1.3.0](https://github.com/mosip/commons/tree/v1.3.0)              |
| id-authentication    | [v1.3.0](https://github.com/mosip/id-authentication/tree/v1.3.0)    |
| id-repository        | [v1.3.0](https://github.com/mosip/id-repository/tree/v1.3.0)        |
| otp-manager          | [v1.3.0](https://github.com/mosip/otp-manager/tree/v1.3.0)          |
| packet-manager       | [v1.3.0](https://github.com/mosip/packet-manager/tree/v1.3.0)       |
| demosdk              | [v1.3.0](https://github.com/mosip/demosdk/tree/v1.3.0)              |
| durian               | [v1.3.0](https://github.com/mosip/durian/tree/v1.3.0)               |
| keymanager           | [v1.3.0](https://github.com/mosip/keymanager/tree/v1.3.0)           |
| mosip-config         | [v1.3.0](https://github.com/mosip/mosip-config/tree/v1.3.0)         |
| captcha              | [v1.3.0](https://github.com/mosip/captcha/tree/v0.1.0)              |
| registration         | [v1.3.0](https://github.com/mosip/registration/tree/v1.3.0)         |
| digital-card-service | [v1.3.0](https://github.com/mosip/digital-card-service/tree/v1.3.0) |
| khazana              | [v1.3.0](https://github.com/mosip/khazana/tree/v1.3.0)              |
| mosip-openid-bridge  | [v1.3.0](https://github.com/mosip/mosip-openid-bridge/tree/v1.3.0)  |
| mosip-ref-impl       | [v1.3.0](https://github.com/mosip/mosip-ref-impl/tree/v1.3.0)       |
| print                | [v1.3.0](https://github.com/mosip/print/tree/v1.3.0)                |
| resident-services    | [v1.3.0](https://github.com/mosip/resident-services/tree/v1.3.0)    |
| websub               | [v1.3.0](https://github.com/mosip/websub/tree/v1.3.0)               |
| mosip-data           | [v1.3.0](https://github.com/mosip/mosip-data/tree/v1.3.0)           |
| k8s-infra            | [v1.2.1.1](https://github.com/mosip/k8s-infra/tree/v1.2.1.1)        |
| keycloak             | [v1.3.0](https://github.com/mosip/keycloak/tree/v1.3.0)             |
| mosip-file-server    | [v1.3.0](https://github.com/mosip/mosip-file-server/tree/v1.3.0)    |
| mosip-helm           | [v1.3.0](https://github.com/mosip/mosip-helm/tree/v1.3.0)           |
| mosip-infra          | [v1.2.1.0](https://github.com/mosip/mosip-infra/tree/v1.2.1.0)      |
| postgres-init        | [v1.3.0](https://github.com/mosip/postgres-init/tree/v1.3.0)        |
| bio-utils            | [v1.3.0](https://github.com/mosip/bio-utils/tree/v1.3.0)            |
| biosdk-services      | [v1.3.0](https://github.com/mosip/biosdk-services/tree/v1.3.0)      |
| converters           | [v1.3.0](https://github.com/mosip/converters/tree/v1.3.0)           |
| mosip-mock-services  | [v1.3.0](https://github.com/mosip/mosip-mock-services/tree/v1.3.0)  |
| nfiq                 | [v0.1.0](https://github.com/mosip/nfiq/tree/v0.1.0)                 |
| pre-registration     | [v1.3.0](https://github.com/mosip/pre-registration/tree/v1.3.0)     |
| pre-registration-ui  | [v1.3.0](https://github.com/mosip/pre-registration-ui/tree/v1.3.0)  |

**Compatible modules (5)**

| Module                     | Compatible version                                                             |
| -------------------------- | ------------------------------------------------------------------------------ |
| Partner Management Service | [v1.2.2.2](https://github.com/mosip/partner-management-services/tree/v1.2.2.2) |
| eSignet                    | [v1.4.1](https://github.com/mosip/esignet/tree/v1.4.1)                         |
| Resident Portal - UI       | [v0.9.0](https://github.com/mosip/resident-ui/releases/tag/v0.9.0)             |
| Registration Client        | [v1.2.0.2](https://github.com/mosip/registration-client/tree/v1.2.0.2)         |
| mosip-automation-tests     | [v1.3.0](https://github.com/mosip/mosip-automation-tests/tree/release-1.3.x)   |
{% endtab %}

{% tab title="Updates After This Release (17)" icon="puzzle-piece-simple" %}
**Released separately after v1.2.1.0 and before v1.2.1.1 (17 releases) · 26 Dec 2025 – 22 Sep 2026**

| Date        | Release                                                                                                               | Type                                                | Kind            | Next platform release (v1.2.1.1) ships                                                  | Description                                                                                 |
| ----------- | --------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | --------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| 21 Sep 2026 | [API Test Commons v1.7.0](api-test-commons-releases/v1.7.0.md)                                                        |                                                     | Tooling         |                                                                                         | Dynamic ID-schema handling, OTP/SMTP listener reliability and report masking improvements.  |
| 2 Sep 2026  | [Partner Management System 1.2.2.4](partner-management-system-1.2.2.4-patch/)                                         | <mark style="background-color:green;">Patch</mark>  | Separate module |                                                                                         | Stronger automation tests, simpler database upgrade and rollback scripts, SonarCloud fixes. |
| 28 Jul 2026 | [Android Registration Client v1.1.1](android-registration-client-v1.1.1/)                                             | <mark style="background-color:green;">Patch</mark>  | Separate module |                                                                                         | Code quality, security configuration and maintainability fixes.                             |
| 5 Jun 2026  | [Android Registration Client v1.1.0](android-registration-client-v1.1.0/)                                             | <mark style="background-color:blue;">Minor</mark>   | Separate module |                                                                                         | Java 21 support, security hardening and interoperability improvements.                      |
| 28 May 2026 | [MOSIP Component Release (15 repos) v1.3.1](mosip-component-release-v1.3.1.md)                                        | <mark style="background-color:green;">Patch</mark>  | Platform module | v1.3.2 of 5 of the 15: audit-manager, khazana, mosip-data, websub, artifactory-ref-impl | Corrects invalid licence folder paths across multiple repositories.                         |
| 20 May 2026 | [Partner Management System Revamp 1.3.0-beta.5](partner-management-system-revamp-1.3.0-beta.5/)                       | <mark style="background-color:orange;">Beta</mark>  | Separate module |                                                                                         | Onboarding for Credential and Manual Adjudication partners; DataShare policy validation.    |
| 20 May 2026 | [API Test Commons v1.6.0](api-test-commons-releases/v1.6.0.md)                                                        |                                                     | Tooling         |                                                                                         | Authentication handling, DSL request and response logging, configuration clean-up.          |
| 22 Apr 2026 | [Registration Processor & ID Repository 1.2.1.3 & 1.2.3.0](registration-processor-1.2.1.3-and-id-repository-1.2.3.0/) | <mark style="background-color:purple;">Major</mark> | Platform module |                                                                                         | Fixes email handles with underscores and tightens biometric-update validation.              |
| 20 Apr 2026 | [DSL Orchestrator & Packet Creator v1.2.2.0](v1.2.2.0-dsl.md)                                                         | <mark style="background-color:blue;">Minor</mark>   | Tooling         |                                                                                         | DSL release for environments running on Java 11.                                            |
| 10 Apr 2026 | [Android Registration Client v1.0.1](android-registration-client-v1.0.1/)                                             |                                                     | Separate module |                                                                                         | Less hard-coded configuration, fuller audit logging and security improvements.              |
| 25 Mar 2026 | [DSL Orchestrator & Packet Creator v1.4.0](v1.4.0-dsl.md)                                                             | <mark style="background-color:blue;">Minor</mark>   | Tooling         |                                                                                         | Wider test coverage, better reporting and more reliable execution.                          |
| 25 Mar 2026 | [API Test Commons v1.5.0](api-test-commons-releases/v1.5.0.md)                                                        |                                                     | Tooling         |                                                                                         | Test data generation, authentication utilities and security handling.                       |
| 24 Mar 2026 | [Infra (Rapid Deployment) 0.2.0](0.2.0-infra.md)                                                                      | <mark style="background-color:blue;">Minor</mark>   | Tooling         | infra v0.3.1                                                                            | Adds eSignet 1.4.2 integration to the rapid deployment model.                               |
| 4 Feb 2026  | [Partner Management System Revamp 1.3.0-beta.4](partner-management-system-revamp-1.3.0-beta.4/)                       | <mark style="background-color:orange;">Beta</mark>  | Separate module |                                                                                         | ABIS partner type, simpler admin onboarding, OIDC client options and notifications.         |
| 22 Jan 2026 | [Infra (Rapid Deployment) 0.1.0](0.1.0-infra.md)                                                                      |                                                     | Tooling         | infra v0.3.1                                                                            | Stability and configuration fixes, expanded deployment documentation.                       |
| 22 Jan 2026 | [ID Authentication & Resident 1.2.1.3](id-authentication-1.2.1.3-and-resident-1.2.1.3.md)                             | <mark style="background-color:green;">Patch</mark>  | Platform module |                                                                                         | Fixes to the Resident and ID Authentication automation scripts for Infra 0.1.0.             |
| 22 Jan 2026 | [API Test Commons v1.3.6](api-test-commons-releases/v1.3.6.md)                                                        | <mark style="background-color:green;">Patch</mark>  | Tooling         |                                                                                         | Fixes a configuration issue found after v1.3.5.                                             |
{% endtab %}

{% tab title="Pre-Releases (4)" icon="flask" %}
* [1.2.1.0-beta.1 Part 4](1.2.1.0-beta.1-part-4/) (10 Jul 2025)
* [1.2.1.0-beta.1 Part 3](1.2.1.0-beta.1-part-3.md) (18 Mar 2025)
* [1.2.1.0-beta.1 Part 2](1.2.1.0-beta.1-part-2/) (16 Dec 2024)
* [1.2.1.0-beta.1 Part 1](1.3.0-beta.1-mock-service-and-converters.md) (26 Nov 2024)
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
{% tab title="Included in This Release" icon="cubes" %}
**Repositories shipped with 1.2.0.4 (5)**

| Repository        | Version                                                             |
| ----------------- | ------------------------------------------------------------------- |
| keycloak          | [1.2.0.2](https://github.com/mosip/keycloak/tree/v1.2.0.2)          |
| k8s-infra         | [1.2.1.0](https://github.com/mosip/k8s-infra/tree/v1.2.1.0)         |
| mosip-file-server | [1.2.0.2](https://github.com/mosip/mosip-file-server/tree/v1.2.0.2) |
| mosip-config      | [1.2.4.3](https://github.com/mosip/mosip-config/tree/v1.2.4.3-beta) |
| mosip-helm        | [1.2.0.3](https://github.com/mosip/mosip-helm/tree/v1.2.0.3)        |
{% endtab %}

{% tab title="Updates After This Release (7)" icon="puzzle-piece-simple" %}
**Released separately after 1.2.0.4 and before v1.2.1.0 (7 releases) · 27 Oct 2025 – 25 Dec 2025**

| Date        | Release                                                                                                     | Type                                               | Kind            | Next platform release (v1.2.1.0) ships | Description                                                              |
| ----------- | ----------------------------------------------------------------------------------------------------------- | -------------------------------------------------- | --------------- | -------------------------------------- | ------------------------------------------------------------------------ |
| 24 Dec 2025 | [DSL Orchestrator & Packet Creator v1.3.0](v1.3.0-dsl.md)                                                   | <mark style="background-color:blue;">Minor</mark>  | Tooling         |                                        | Java 21 compatibility with stability, performance and scalability gains. |
| 1 Dec 2025  | [Android Registration Client v1.0.0](android-registration-client-v1.0.0/)                                   |                                                    | Separate module |                                        | GA release with GPS tracking and applicant biometric correction.         |
| 28 Nov 2025 | [API Test Commons v1.3.5](api-test-commons-releases/v1.3.5.md)                                              |                                                    | Tooling         |                                        | Feature and stability update to the functional test framework.           |
| 27 Nov 2025 | [Partner Management System 1.2.2.3](partner-management-system-1.2.2.3/)                                     | <mark style="background-color:green;">Patch</mark> | Separate module |                                        | Fixes critical functional bugs and automation issues.                    |
| 17 Nov 2025 | [ID Repository & ID Authentication 1.2.2.4 & 1.2.1.2](1.2.2.4-id-repository-and-1.2.1.2-id-authentication/) | <mark style="background-color:green;">Patch</mark> | Platform module |                                        | Critical bug fixes, automation reliability and infra compatibility.      |
| 13 Nov 2025 | [Partner Management System Revamp 1.3.0-beta.3](partner-management-system-revamp-1.3.0-beta.3/)             | <mark style="background-color:orange;">Beta</mark> | Separate module |                                        | End-to-end support for MISP partners.                                    |
| 27 Oct 2025 | [Infra (Rapid Deployment) 0.1.0-beta.1](0.1.0-beta-mosip-rapid-deployment-infrastructure.md)                | <mark style="background-color:orange;">Beta</mark> | Tooling         |                                        | First beta of the rapid deployment infrastructure.                       |
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
{% tab title="Included in This Release" icon="cubes" %}
**Repositories shipped with 1.2.0.3 (12)**

| Repository           | Version                                                                            |
| -------------------- | ---------------------------------------------------------------------------------- |
| mosip-config         | [v1.2.4.2](https://github.com/mosip/mosip-config/tree/v1.2.4.2)                    |
| commons              | [v1.2.0.2](https://github.com/mosip/commons/tree/v1.2.0.2)                         |
| mosip-openid-bridge  | [v1.2.0.2](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0.2)             |
| bio-utils            | [v1.2.0.4](https://github.com/mosip/bio-utils/tree/v1.2.0.4)                       |
| khazana              | [v1.2.0.2](https://github.com/mosip/khazana/tree/v1.2.0.2)                         |
| biosdk-client        | [v1.2.0.2](https://github.com/mosip/biosdk-client/tree/v1.2.0.2)                   |
| artifactory-ref-impl | [v1.2.0.4](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.4)            |
| registration         | [v1.2.1.2](https://github.com/mosip/registration/tree/v1.2.1.2)                    |
| durian               | [v1.2.0.2](https://github.com/mosip/durian/tree/v1.2.0.2)                          |
| id-authentication    | [v1.2.1.2-beta.1](https://github.com/mosip/id-authentication/tree/v1.2.1.2-beta.1) |
| id-repository        | [v1.2.2.3](https://github.com/mosip/id-repository/tree/v1.2.2.3)                   |
| packet-manager       | [v1.2.0.4](https://github.com/mosip/packet-manager/tree/v1.2.0.4)                  |
{% endtab %}

{% tab title="Updates After This Release (4)" icon="puzzle-piece-simple" %}
**Released separately after 1.2.0.3 and before 1.2.0.4 (4 releases) · 5 Sep 2025 – 26 Oct 2025**

| Date        | Release                                                        | Type                                               | Kind            | Next platform release (1.2.0.4) ships | Description                                            |
| ----------- | -------------------------------------------------------------- | -------------------------------------------------- | --------------- | ------------------------------------- | ------------------------------------------------------ |
| 22 Sep 2025 | [API Test Commons v1.3.4](api-test-commons-releases/v1.3.4.md) | <mark style="background-color:green;">Patch</mark> | Tooling         |                                       | Helm chart enhancements.                               |
| 5 Sep 2025  | [Admin Services 1.2.1.3](1.2.1.3-admin-services.md)            | <mark style="background-color:green;">Patch</mark> | Platform module |                                       | Fixes to the Admin Services automation test suites.    |
| 5 Sep 2025  | [Pre Registration 1.2.0.3](1.2.0.3-pre-registration.md)        | <mark style="background-color:green;">Patch</mark> | Platform module |                                       | Fixes to the Pre-Registration automation test suites.  |
| 5 Sep 2025  | [DSL Orchestrator & Packet Creator v1.2.1.0](dsl-v1.2.1.0.md)  | <mark style="background-color:blue;">Minor</mark>  | Tooling         |                                       | Biometric variation generation and new test scenarios. |
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.2

**5 Apr 2024** · Platform release · <mark style="background-color:purple;">LTS</mark>

Fixes critical reported bugs to improve stability and usability.

[View platform release →](1.2.0.2/)
{% endhint %}

{% tabs %}
{% tab title="Included in This Release" icon="cubes" %}
**Repositories shipped with 1.2.0.2 (7)**

| Repository                | Version                                                                      |
| ------------------------- | ---------------------------------------------------------------------------- |
| registration-client       | [v1.2.0.2](https://github.com/mosip/registration-client/tree/v1.2.0.2)       |
| mosip-mock-services       | [v1.2.0.2](https://github.com/mosip/mosip-mock-services/tree/v1.2.0.2)       |
| artifactory-ref-impl      | [v1.2.0.2](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.2)      |
| mosip-infra               | [v1.2.0.2](https://github.com/mosip/mosip-infra/tree/v1.2.0.2)               |
| mosip-helm                | [v1.2.0.2](https://github.com/mosip/mosip-helm/tree/v1.2.0.2)                |
| k8s-infra                 | [v1.2.0.2](https://github.com/mosip/k8s-infra/tree/v1.2.0.2)                 |
| partner-management-portal | [v1.2.0.2](https://github.com/mosip/partner-management-portal/tree/v1.2.0.2) |
{% endtab %}

{% tab title="Updates After This Release (27)" icon="puzzle-piece-simple" %}
**Released separately after 1.2.0.2 and before 1.2.0.3 (27 releases) · 5 Apr 2024 – 4 Sep 2025**

| Date        | Release                                                                                         | Type                                                            | Kind            | Next platform release (1.2.0.3) ships         | Description                                                                         |
| ----------- | ----------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | --------------- | --------------------------------------------- | ----------------------------------------------------------------------------------- |
| 29 Aug 2025 | [Partner Management System Revamp 1.3.0-beta.2](partner-management-system-revamp-1.3.0-beta.2/) | <mark style="background-color:orange;">Beta</mark>              | Separate module |                                               | Java 21 upgrade; FTM chip certificate, SBI and API key notifications.               |
| 8 Aug 2025  | [Android Registration Client v0.12.0](android-registration-client-0.12.0/)                      | <mark style="background-color:orange;">Beta</mark>              | Separate module |                                               | Forgot password, AID QR code scan and Lost UIN.                                     |
| 24 Jul 2025 | [Partner Management System Revamp 1.3.0-beta.1](pms-revamp-1.3.0-beta.1.md)                     | <mark style="background-color:orange;">Beta</mark>              | Separate module |                                               | Java 21 upgrade and certificate expiry notifications.                               |
| 7 Jul 2025  | [ID Repository 1.2.2.2](1.2.2.2-id-repository.md)                                               | <mark style="background-color:green;">Patch</mark>              | Platform module | id-repository v1.2.2.3                        | Fixes to the ID Repository automation test suites.                                  |
| 7 Jul 2025  | [ID Authentication 1.2.1.1-beta](1.2.1.1-beta-id-authentication.md)                             | <mark style="background-color:green;">Patch</mark>              | Platform module | id-authentication v1.2.1.2-beta.1             | Fixes to the ID Authentication automation test suites.                              |
| 7 Jul 2025  | [Pre Registration 1.2.0.2](1.2.0.2-pre-registration.md)                                         | <mark style="background-color:green;">Patch</mark>              | Platform module |                                               | Fixes to the Pre-Registration automation test suites.                               |
| 7 Jul 2025  | [Resident Services 1.2.1.2](1.2.1.2-resident-services.md)                                       | <mark style="background-color:green;">Patch</mark>              | Platform module |                                               | Fixes to the Resident Services automation test suites.                              |
| 7 Jul 2025  | [Admin Services 1.2.1.2](1.2.1.2-admin-services.md)                                             | <mark style="background-color:green;">Patch</mark>              | Platform module |                                               | Fixes to the Admin Services automation test suites.                                 |
| 5 Jul 2025  | [Partner Management System Revamp 1.2.2.2](pms-revamp-v1.2.2.2.md)                              | <mark style="background-color:green;">Patch</mark>              | Separate module |                                               | Fixes backward compatibility with earlier MOSIP platform versions.                  |
| 1 Jul 2025  | [API Test Commons v1.3.3](api-test-commons-releases/v1.3.3.md)                                  | <mark style="background-color:green;">Patch</mark>              | Tooling         |                                               | Watchdog-based execution control, richer reporting and Slack notifications.         |
| 27 May 2025 | [Registration v1.2.1.1](registration-v1.2.1.1.md)                                               | <mark style="background-color:green;">Patch</mark>              | Platform module | registration v1.2.1.2                         | Critical fixes for Credential Requestor, Registration Processor and Notification.   |
| 21 May 2025 | [Partner Management System Revamp 1.2.2.1](pms-revamp-release-1.2.2.1-patch/)                   | <mark style="background-color:green;">Patch</mark>              | Separate module |                                               | Makes PMS Revamp backward compatible with earlier MOSIP platform versions.          |
| 16 Apr 2025 | [Registration Processor v1.2.1.0](v1.2.1.0-registration-processor/)                             |                                                                 | Platform module | registration v1.2.1.2                         | Supports packet creation from external sources for easier integration.              |
| 9 Apr 2025  | [Android Registration Client v0.11.0](android-registration-client-v0.11.0/)                     |                                                                 | Separate module |                                               | Handles during new registration, operator onboarding updates and dashboard.         |
| 27 Mar 2025 | [API Test Commons v1.3.2](api-test-commons-releases/v1.3.2.md)                                  |                                                                 | Tooling         |                                               | YAML loading improvements, security fixes and bug resolutions.                      |
| 10 Mar 2025 | [Partner Management System 1.2.2.0](partner-management-system-1.2.2.0/)                         |                                                                 | Separate module |                                               | New Partner Management System UI with all legacy features.                          |
| 28 Jan 2025 | [Resident Services v0.9.1](resident-services-v0.9.1/)                                           | <mark style="background-color:green;">Patch</mark>              | Separate module |                                               | Bug fixes, security and performance improvements after v0.9.0.                      |
| 28 Jan 2025 | [API Test Commons v1.3.1](api-test-commons-releases/v1.3.1.md)                                  |                                                                 | Tooling         |                                               | Enhancements and bug fixes to the functional tests.                                 |
| 8 Jan 2025  | [Registration Processor & ID Repository 1.2.0.2](1.2.0.2-reg-processor-and-id-repo/)            |                                                                 | Platform module | registration v1.2.1.2, id-repository v1.2.2.3 | Custom Handle support during new registration with the Android Registration Client. |
| 12 Dec 2024 | [API Test Commons v1.3.0](api-test-commons-releases/v1.3.0.md)                                  |                                                                 | Tooling         |                                               | New features and enhancements to the functional tests.                              |
| 10 Sep 2024 | [Android Registration Client 0.11.0-beta.1](android-registration-client-0.11.0-beta.1/)         | <mark style="background-color:orange;">Beta</mark>              | Separate module |                                               | Supervisor's approval and manual application upload or export.                      |
| 3 Sep 2024  | [Partner Management System 1.3.0-dp.1](partner-management-system-1.3.0-dp1/)                    | <mark style="background-color:orange;">Developer Preview</mark> | Separate module |                                               | First step of the PMS revamp: the new Partner Management Portal.                    |
| 26 Aug 2024 | [MOSIP Config 1.2.2.0](1.2.2.0-mosip-config.md)                                                 |                                                                 | Platform module | mosip-config v1.2.4.2                         | Routes biometric data updates correctly to manual adjudication.                     |
| 5 Aug 2024  | [API Test Commons v1.2.1](api-test-commons-releases-1.md)                                       |                                                                 | Tooling         |                                               | New features and enhancements to the functional tests.                              |
| 14 Jun 2024 | [Android Registration Client v0.10.0](android-registration-client-v0.10.0/)                     | <mark style="background-color:orange;">Beta</mark>              | Separate module |                                               | Operator onboarding and dashboard.                                                  |
| 30 May 2024 | [Resident Services 0.9.0](resident-services-0.9.0/)                                             |                                                                 | Separate module |                                               | Resident self-services; runs on MOSIP platform 1.2.0.1.                             |
| 3 May 2024  | [ID Authentication 1.2.1.0](1.2.1.0/)                                                           |                                                                 | Platform module | id-authentication v1.2.1.2-beta.1             | Resolves UIN and VID related errors during authentication.                          |
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0.1

**19 Mar 2024** · Platform release · <mark style="background-color:purple;">LTS</mark>

Brings together everything released in beta, including the upgrade to V3 architecture, DSL automation scripts and the Credential Requestor Stage.

[View platform release →](release-notes-1.2.0.1/)
{% endhint %}

{% tabs %}
{% tab title="Included in This Release" icon="cubes" %}
**Repositories shipped with 1.2.0.1 (44)**

| Repository                  | Version                                                                        |
| --------------------------- | ------------------------------------------------------------------------------ |
| admin-ui                    | [v1.2.0.1](https://github.com/mosip/admin-ui/tree/v1.2.0.1)                    |
| artifactory-ref-impl        | [v1.2.0.1](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.1)        |
| admin-services              | [v1.2.0.1](https://github.com/mosip/admin-services/tree/v1.2.0.1)              |
| audit-manager               | [v1.2.0.1](https://github.com/mosip/audit-manager/tree/v1.2.0.1)               |
| biosdk-client               | [v1.2.0.1](https://github.com/mosip/biosdk-client/tree/v1.2.0.1)               |
| commons                     | [v1.2.0.1](https://github.com/mosip/commons/tree/v1.2.0.1)                     |
| id-authentication           | [v1.2.0.1](https://github.com/mosip/id-authentication/tree/v1.2.0.1)           |
| id-repository               | [v1.2.0.1](https://github.com/mosip/id-repository/tree/v1.2.0.1)               |
| otp-manager                 | [v1.2.0.1](https://github.com/mosip/otp-manager/tree/v1.2.0.1)                 |
| packet-manager              | [v1.2.0.1](https://github.com/mosip/packet-manager/tree/v1.2.0.1)              |
| demosdk                     | [v1.2.0.1](https://github.com/mosip/demosdk/tree/v1.2.0.1)                     |
| durian                      | [v1.2.0.1](https://github.com/mosip/durian/tree/v1.2.0.1)                      |
| keymanager                  | [v1.2.0.1](https://github.com/mosip/keymanager/tree/v1.2.0.1)                  |
| postgres-init               | [v1.2.0.1](https://github.com/mosip/postgres-init/tree/v1.2.0.1)               |
| partner-management-services | [v1.2.0.1](https://github.com/mosip/partner-management-services/tree/v1.2.0.1) |
| pre-registration            | [v1.2.0.1](https://github.com/mosip/pre-registration/tree/v1.2.0.1)            |
| print                       | [v1.2.0.1](https://github.com/mosip/print/tree/v1.2.0.1)                       |
| resident-services           | [v1.2.0.1](https://github.com/mosip/resident-services/tree/v1.2.0.1)           |
| registration                | [v1.2.0.1](https://github.com/mosip/registration/tree/v1.2.0.1)                |
| registration-client         | [v1.2.0.1](https://github.com/mosip/registration-client/tree/v1.2.0.1)         |
| mosip-openid-bridge         | [v1.2.0.1](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0.1)         |
| mosip-functional-tests      | [v1.2.0.1](https://github.com/mosip/mosip-functional-tests/tree/v1.2.0.1)      |
| biosdk-services             | [v1.2.0.1](https://github.com/mosip/biosdk-services/tree/v1.2.0.1)             |
| bio-utils                   | [v1.2.0.2](https://github.com/mosip/bio-utils/tree/v1.2.0.2)                   |
| mosip-config                | [v1.2.0.1](https://github.com/mosip/mosip-config/tree/v1.2.0.1)                |
| mosip-helm                  | [v1.2.0.1](https://github.com/mosip/mosip-helm/tree/v1.2.0.1)                  |
| keycloak                    | [v1.2.0.1](https://github.com/mosip/keycloak/tree/v1.2.0.1)                    |
| khazana                     | [v1.2.0.1](https://github.com/mosip/khazana/tree/v1.2.0.1)                     |
| mosip-automation-tests      | [v1.2.0.1](https://github.com/mosip/mosip-automation-tests/tree/v1.2.0.1)      |
| mosip-onboarding            | [v1.2.0.1](https://github.com/mosip/mosip-onboarding/tree/v1.2.0.1)            |
| mosip-data                  | [v1.2.0.1](https://github.com/mosip/mosip-data/tree/v1.2.0.1)                  |
| mosip-infra                 | [v1.2.0.1](https://github.com/mosip/mosip-infra/tree/v1.2.0.1)                 |
| mosip-ref-impl              | [v1.2.0.1](https://github.com/mosip/mosip-ref-impl/tree/v1.2.0.1)              |
| mosip-file-server           | [v1.2.0.1](https://github.com/mosip/mosip-file-server/tree/v1.2.0.1)           |
| mosip-mock-services         | [v1.2.0.1](https://github.com/mosip/mosip-mock-services/tree/v1.2.0.1)         |
| mock-smtp-sms               | [v1.0.0](https://github.com/mosip/mock-smtp-sms/tree/v1.0.0)                   |
| migration-utility           | [1.0.0](https://github.com/mosip/migration-utility/tree/v1.0.0)                |
| k8s-infra                   | [v1.2.0.1](https://github.com/mosip/k8s-infra/tree/v1.2.0.1)                   |
| reporting                   | [v1.2.0.1](https://github.com/mosip/reporting/tree/v1.2.0.1)                   |
| pre-registration-ui         | [v1.2.0.1](https://github.com/mosip/pre-registration-ui/tree/v1.2.0.1)         |
| digital-card-service        | [v1.2.0.1](https://github.com/mosip/digital-card-service/tree/v1.2.0.1)        |
| tusd-server                 | [v1.2.0.1](https://github.com/mosip/tusd-server/tree/v1.2.0.1)                 |
| converters                  | [v1.2.0.1](https://github.com/mosip/converters/tree/v1.2.0.1)                  |
| websub                      | [v1.2.0.1](https://github.com/mosip/websub/tree/v1.2.0.1)                      |
{% endtab %}

{% tab title="Updates After This Release (0)" icon="puzzle-piece-simple" %}
No separate component releases between 1.2.0.1 and 1.2.0.2 (19 Mar 2024 – 4 Apr 2024).
{% endtab %}

{% tab title="Pre-Releases (4)" icon="flask" %}
* [Beta 4](release-notes-1.2.0.1-b4/) (12 Jan 2024)
* [Beta 3](release-notes-1.2.0.1-b3/) (14 Apr 2023)
* [Beta 2](release-notes-1.2.0.1-b2.md) (8 Jan 2023)
* [Beta 1](release-notes-1.2.0.1-beta/) (14 Oct 2022)
{% endtab %}
{% endtabs %}

***

{% hint style="info" icon="layer-group" %}
#### MOSIP Platform 1.2.0

**14 Feb 2022** · Platform release · Asymmetric Amoeba · <mark style="background-color:purple;">LTS</mark>

The Long Term Support release: manageability, usability, performance, security and support for multiple languages.

[View platform release →](release-notes/)
{% endhint %}

{% tabs %}
{% tab title="Included in This Release" icon="cubes" %}
**Repositories shipped with 1.2.0 (35)**

| Repository                  | Version                                                                    |
| --------------------------- | -------------------------------------------------------------------------- |
| pre-registration-ui         | [v1.2.0](https://github.com/mosip/pre-registration-ui/tree/v1.2.0)         |
| pre-registration            | [v1.2.0](https://github.com/mosip/pre-registration/tree/v1.2.0)            |
| registration-client         | [v1.2.0](https://github.com/mosip/registration-client/tree/v1.2.0)         |
| registration                | [v1.2.0](https://github.com/mosip/registration/tree/v1.2.0)                |
| id-repository               | [v1.2.0](https://github.com/mosip/id-repository/tree/v1.2.0)               |
| id-authentication           | [v1.2.0](https://github.com/mosip/id-authentication/tree/v1.2.0)           |
| biosdk-client               | [v1.2.0](https://github.com/mosip/biosdk-client/tree/v1.2.0)               |
| biosdk-services             | [v1.2.0](https://github.com/mosip/biosdk-services/tree/v1.2.0)             |
| demosdk                     | [v1.2.0](https://github.com/mosip/demosdk/tree/v1.2.0)                     |
| admin-ui                    | [v1.2.0](https://github.com/mosip/admin-ui/tree/v1.2.0)                    |
| admin-services              | [v1.2.0](https://github.com/mosip/admin-services/tree/v1.2.0)              |
| resident-services           | [v1.2.0](https://github.com/mosip/resident-services/tree/v1.2.0)           |
| commons                     | [v1.2.0](https://github.com/mosip/commons/tree/v1.2.0)                     |
| packet-manager              | [v1.2.0](https://github.com/mosip/packet-manager/tree/v1.2.0)              |
| keymanager                  | [v1.2.0](https://github.com/mosip/keymanager/tree/v1.2.0)                  |
| audit-manager               | [v1.2.0](https://github.com/mosip/audit-manager/tree/v1.2.0)               |
| durian                      | [v1.2.0](https://github.com/mosip/durian/tree/v1.2.0)                      |
| websub                      | [v1.2.0](https://github.com/mosip/websub/tree/v1.2.0)                      |
| keycloak                    | [v1.2.0](https://github.com/mosip/keycloak/tree/v1.2.0)                    |
| bio-utils                   | [v1.2.0](https://github.com/mosip/bio-utils/tree/v1.2.0)                   |
| khazana                     | [v1.2.0](https://github.com/mosip/khazana/tree/v1.2.0)                     |
| mosip-openid-bridge         | [v1.2.0](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0)         |
| Partner-management-portal   | [v1.2.0](https://github.com/mosip/Partner-management-portal/tree/v1.2.0)   |
| partner-management-services | [v1.2.0](https://github.com/mosip/partner-management-services/tree/v1.2.0) |
| reporting                   | [v1.2.0](https://github.com/mosip/reporting/tree/v1.2.0)                   |
| print                       | [v1.2.0](https://github.com/mosip/print/tree/v1.2.0)                       |
| mosip-ref-impl              | [v1.2.0](https://github.com/mosip/mosip-ref-impl/tree/v1.2.0)              |
| artifactory-ref-impl        | [v1.2.0](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0)        |
| authentication-demo-ui      | [v1.2.0](https://github.com/mosip/authentication-demo-ui/tree/v1.2.0)      |
| mosip-config                | [v1.2.0](https://github.com/mosip/mosip-config/tree/v1.2.0)                |
| mosip-data                  | [v1.2.0](https://github.com/mosip/mosip-data/tree/v1.2.0)                  |
| mosip-mock-services         | [v1.2.0](https://github.com/mosip/mosip-mock-services/tree/v1.2.0)         |
| mosip-infra                 | [v1.2.0-rc1](https://github.com/mosip/mosip-infra/tree/v1.2.0-rc1)         |
| mosip-automation-tests      | [v1.2.0](https://github.com/mosip/mosip-automation-tests/tree/v1.2.0)      |
| mosip-functional-tests      | [v1.2.0](https://github.com/mosip/mosip-functional-tests/tree/v1.2.0)      |
{% endtab %}

{% tab title="Updates After This Release (3)" icon="puzzle-piece-simple" %}
**Released separately after 1.2.0 and before 1.2.0.1 (3 releases) · 14 Feb 2022 – 18 Mar 2024**

| Date        | Release                                                                      | Type                                                            | Kind            | Next platform release (1.2.0.1) ships | Description                                                |
| ----------- | ---------------------------------------------------------------------------- | --------------------------------------------------------------- | --------------- | ------------------------------------- | ---------------------------------------------------------- |
| 26 Feb 2024 | [Android Registration Client 0.9.0](release-notes-android-reg-client-0.9.0/) | <mark style="background-color:orange;">Beta</mark>              | Separate module |                                       | Device trust validation and transliteration.               |
| 7 Nov 2023  | [Android Registration Client DP1](release-notes-android-reg-client-dp1.md)   | <mark style="background-color:orange;">Developer Preview</mark> | Separate module |                                       | First developer preview of the tablet registration client. |
| 12 Sep 2023 | [Resident Services DP1](release-notes-resident-portal-dp1.md)                | <mark style="background-color:orange;">Developer Preview</mark> | Separate module |                                       | Developer preview; runs on MOSIP platform 1.2.0.1-B3.      |
{% endtab %}
{% endtabs %}

***





***

## Release history: proposed approach with coloured cards

{% hint style="warning" %}
Draft for review. The same content as the proposed approach with expandables above, with each update shown as a coloured card in place of a table row. The **Kind** and **next platform release** notes are drafts to be confirmed.
{% endhint %}

**How to read this**

* **You adopt consolidated platform releases only:** read the platform cards and open **Included in this release**. You can skip the other expandables.
* **You also adopt updates between platform releases:** find the platform release you run and open **Updates after this release**. It lists everything released separately since then, until the next platform release.

**Kind of update, shown by card colour**

* <mark style="background-color:blue;">Blue</mark> **Platform module:** a repository that ships in platform releases, released on its own between them.
* <mark style="background-color:green;">Green</mark> **Separate module:** a module with its own release line, such as Android Registration Client or Partner Management System.
* <mark style="background-color:orange;">Orange</mark> **Tooling:** test or deployment tooling, such as API Test Commons, DSL or Infra.
* <mark style="background-color:red;">Red</mark> **Critical patch:** reserved; no release is marked critical yet.



**Example**

<details>

<summary>Updates after this release (17) · until v1.2.1.1 · 26 Dec 2025 – 22 Sep 2026</summary>

{% hint style="warning" icon="screwdriver-wrench" %}
[**API Test Commons v1.7.0**](api-test-commons-releases/v1.7.0.md) · 21 Sep 2026 · Tooling

Dynamic ID-schema handling, OTP/SMTP listener reliability and report masking improvements.
{% endhint %}

{% hint style="success" icon="puzzle-piece-simple" %}
[**Partner Management System 1.2.2.4**](partner-management-system-1.2.2.4-patch/) · 2 Sep 2026 · <mark style="background-color:green;">Patch</mark> · Separate module

Stronger automation tests, simpler database upgrade and rollback scripts, SonarCloud fixes.
{% endhint %}

{% hint style="success" icon="puzzle-piece-simple" %}
[**Android Registration Client v1.1.1**](android-registration-client-v1.1.1/) · 28 Jul 2026 · <mark style="background-color:green;">Patch</mark> · Separate module

Code quality, security configuration and maintainability fixes.
{% endhint %}

{% hint style="success" icon="puzzle-piece-simple" %}
[**Android Registration Client v1.1.0**](android-registration-client-v1.1.0/) · 5 Jun 2026 · <mark style="background-color:blue;">Minor</mark> · Separate module

Java 21 support, security hardening and interoperability improvements.
{% endhint %}

{% hint style="info" icon="cube" %}
[**MOSIP Component Release (15 repos) v1.3.1**](mosip-component-release-v1.3.1.md) · 28 May 2026 · <mark style="background-color:green;">Patch</mark> · Platform module

Corrects invalid licence folder paths across multiple repositories.

Next platform release (v1.2.1.1) ships v1.3.2 of 5 of the 15: audit-manager, khazana, mosip-data, websub, artifactory-ref-impl.
{% endhint %}

{% hint style="success" icon="puzzle-piece-simple" %}
[**Partner Management System Revamp 1.3.0-beta.5**](partner-management-system-revamp-1.3.0-beta.5/) · 20 May 2026 · <mark style="background-color:orange;">Beta</mark> · Separate module

Onboarding for Credential and Manual Adjudication partners; DataShare policy validation.
{% endhint %}

{% hint style="warning" icon="screwdriver-wrench" %}
[**API Test Commons v1.6.0**](api-test-commons-releases/v1.6.0.md) · 20 May 2026 · Tooling

Authentication handling, DSL request and response logging, configuration clean-up.
{% endhint %}

{% hint style="info" icon="cube" %}
[**Registration Processor & ID Repository 1.2.1.3 & 1.2.3.0**](registration-processor-1.2.1.3-and-id-repository-1.2.3.0/) · 22 Apr 2026 · <mark style="background-color:purple;">Major</mark> · Platform module

Fixes email handles with underscores and tightens biometric-update validation.
{% endhint %}

{% hint style="warning" icon="screwdriver-wrench" %}
[**DSL Orchestrator & Packet Creator v1.2.2.0**](v1.2.2.0-dsl.md) · 20 Apr 2026 · <mark style="background-color:blue;">Minor</mark> · Tooling

DSL release for environments running on Java 11.
{% endhint %}

{% hint style="success" icon="puzzle-piece-simple" %}
[**Android Registration Client v1.0.1**](android-registration-client-v1.0.1/) · 10 Apr 2026 · Separate module

Less hard-coded configuration, fuller audit logging and security improvements.
{% endhint %}

{% hint style="warning" icon="screwdriver-wrench" %}
[**DSL Orchestrator & Packet Creator v1.4.0**](v1.4.0-dsl.md) · 25 Mar 2026 · <mark style="background-color:blue;">Minor</mark> · Tooling

Wider test coverage, better reporting and more reliable execution.
{% endhint %}

{% hint style="warning" icon="screwdriver-wrench" %}
[**API Test Commons v1.5.0**](api-test-commons-releases/v1.5.0.md) · 25 Mar 2026 · Tooling

Test data generation, authentication utilities and security handling.
{% endhint %}

{% hint style="warning" icon="screwdriver-wrench" %}
[**Infra (Rapid Deployment) 0.2.0**](0.2.0-infra.md) · 24 Mar 2026 · <mark style="background-color:blue;">Minor</mark> · Tooling

Adds eSignet 1.4.2 integration to the rapid deployment model.

Next platform release (v1.2.1.1) ships infra v0.3.1.
{% endhint %}

{% hint style="success" icon="puzzle-piece-simple" %}
[**Partner Management System Revamp 1.3.0-beta.4**](partner-management-system-revamp-1.3.0-beta.4/) · 4 Feb 2026 · <mark style="background-color:orange;">Beta</mark> · Separate module

ABIS partner type, simpler admin onboarding, OIDC client options and notifications.
{% endhint %}

{% hint style="warning" icon="screwdriver-wrench" %}
[**Infra (Rapid Deployment) 0.1.0**](0.1.0-infra.md) · 22 Jan 2026 · Tooling

Stability and configuration fixes, expanded deployment documentation.

Next platform release (v1.2.1.1) ships infra v0.3.1.
{% endhint %}

{% hint style="info" icon="cube" %}
[**ID Authentication & Resident 1.2.1.3**](id-authentication-1.2.1.3-and-resident-1.2.1.3.md) · 22 Jan 2026 · <mark style="background-color:green;">Patch</mark> · Platform module

Fixes to the Resident and ID Authentication automation scripts for Infra 0.1.0.
{% endhint %}

{% hint style="warning" icon="screwdriver-wrench" %}
[**API Test Commons v1.3.6**](api-test-commons-releases/v1.3.6.md) · 22 Jan 2026 · <mark style="background-color:green;">Patch</mark> · Tooling

Fixes a configuration issue found after v1.3.5.
{% endhint %}

</details>

<details>

<summary>Pre-releases (4)</summary>

{% hint style="info" icon="flask" %}
[**1.2.1.0-beta.1 Part 4**](1.2.1.0-beta.1-part-4/) · 10 Jul 2025 · Pre-release
{% endhint %}

{% hint style="info" icon="flask" %}
[**1.2.1.0-beta.1 Part 3**](1.2.1.0-beta.1-part-3.md) · 18 Mar 2025 · Pre-release
{% endhint %}

{% hint style="info" icon="flask" %}
[**1.2.1.0-beta.1 Part 2**](1.2.1.0-beta.1-part-2/) · 16 Dec 2024 · Pre-release
{% endhint %}

{% hint style="info" icon="flask" %}
[**1.2.1.0-beta.1 Part 1**](1.3.0-beta.1-mock-service-and-converters.md) · 26 Nov 2024 · Pre-release
{% endhint %}

</details>

