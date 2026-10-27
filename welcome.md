---
description: Authenticate users with trusted digital identities through open standards.
hidden: true
icon: hand-wave
cover: .gitbook/assets/es-docs-home-banner-2.jpg
coverY: 0
layout:
  width: default
  cover:
    visible: true
    size: full
    mask: none
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: false
  outline:
    visible: true
  pagination:
    visible: true
  metadata:
    visible: true
  tags:
    visible: true
  actions:
    visible: true
  anchors:
    visible: true
---

# Welcome

### What is eSignet?

eSignet is an open-source authentication platform from MOSIP. It lets any application log users in with a trusted digital identity over OpenID Connect, without tying the application to a single identity provider.

* **Standards-based**: Acts as an OpenID Connect (OIDC) provider, so applications log users in through a standard protocol.
* **Identity-system agnostic**: Works with any identity system that can verify a person and return their details.
* **Open source**: The code is public, so anyone can inspect it, audit it, and contribute to it.
* **Deployable independently**: Runs as a standalone identity layer for citizen portals, financial services, and other digital services.

<details>

<summary><i class="fa-video" style="color:$danger;">:video:</i> <mark style="color:$primary;"><strong>Watch the eSignet overview</strong></mark></summary>

{% embed url="https://youtu.be/ZfUPRv71s_0?si=cr_Q8mFmad93kFS6" %}

</details>

{% hint style="success" icon="sparkles" %}
**New in eSignet 2.x:** a new core engine written in Go, built for better performance. The OIDC, OAuth 2.0 and FAPI 2.0 APIs and the login UI work as before. Signup and wallet login are not included yet. See **Versions and migration** below.

<a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/versions/v2.0.0-beta.1" class="button primary">Latest release</a> <a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/versions" class="button secondary">Release notes</a> <a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/roadmap" class="button secondary">Roadmap</a>
{% endhint %}

### Versions & Releases

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td><h4>eSignet 2.x</h4></td><td>Recommended for new implementations. Built in Go.</td><td>Get started with eSignet 2.x</td><td><a href="https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/GLWCTe02ubJM6M7TcHlg/">Home eSignet-2.0.0</a></td><td><a href=".gitbook/assets/card-version-go.svg">card-version-go.svg</a></td></tr><tr><td><h4>eSignet 1.x</h4></td><td>For organizations operating an existing Java-based deployment. Review feature<br>availability and migration guidance before choosing this version.</td><td>View eSignet 1.x documentation</td><td><a href="https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/ylzvZHp30DQ3rNCClELV/">Home eSignet</a></td><td><a href=".gitbook/assets/card-version-java.svg">card-version-java.svg</a></td></tr><tr><td><h4>Migrating from eSignet 1.x?</h4></td><td>Compare capabilities, understand changes, and plan your transition to<br>eSignet 2.x.</td><td>Read the migration guide</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/features">Features</a></td><td><a href=".gitbook/assets/card-version-migration.svg">card-version-migration.svg</a></td></tr><tr><td><h4>Release notes and roadmap</h4></td><td>Every release so far, and what's coming next.</td><td></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases">Roadmap and Releases</a></td><td><a href=".gitbook/assets/card-version-roadmap.svg">card-version-roadmap.svg</a></td></tr></tbody></table>

{% hint style="info" %}
**Coming from eSignet Java?** eSignet 2.0.0 does not include the **Signup** product or **wallet-based login** yet. Wallet login is planned for a future release using OpenID4VP..

* [Signup documentation (eSignet 1.x)](https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/ylzvZHp30DQ3rNCClELV/)
* [Planned functionality](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/roadmap/roadmap-2026)
{% endhint %}

### Why eSignet?

<table data-view="cards"><thead><tr><th></th><th></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td><h4>Standards-based login</h4></td><td>Applications connect through OpenID Connect rather than a custom protocol, so teams can use existing OIDC libraries.</td><td><a href=".gitbook/assets/card-why-standards.svg">card-why-standards.svg</a></td></tr><tr><td><h4>Any identity system</h4></td><td>Connects to any identity system or registry that can verify a person and return their details.</td><td><a href=".gitbook/assets/card-why-any-identity.svg">card-why-any-identity.svg</a></td></tr><tr><td><h4>Works on basic phones</h4></td><td>OTP on feature phones means people without smartphones or reliable internet can still log in.</td><td><a href=".gitbook/assets/card-why-basic-phones.svg">card-why-basic-phones.svg</a></td></tr><tr><td><h4>Runs anywhere</h4></td><td>Deploy on any cloud or on-premises with containers. Free to use, with no vendor lock-in.</td><td><a href=".gitbook/assets/card-why-runs-anywhere.svg">card-why-runs-anywhere.svg</a></td></tr><tr><td><h4>Consent built in</h4></td><td>Users see which details an application asks for, and approve before anything is shared.</td><td><a href=".gitbook/assets/card-why-consent.svg">card-why-consent.svg</a></td></tr></tbody></table>

### Understand eSignet

<table data-view="cards"><thead><tr><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td><h4>About eSignet</h4></td><td>What eSignet is and who it is for.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/what-is-esignet">What is eSignet?</a></td><td><a href=".gitbook/assets/card-understand-about.svg">card-understand-about.svg</a></td></tr><tr><td><h4>Architecture</h4></td><td>How eSignet's components fit together.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/develop/architecture">Architecture</a></td><td><a href=".gitbook/assets/card-understand-architecture.svg">card-understand-architecture.svg</a></td></tr><tr><td><h4>Features</h4></td><td>What eSignet can do, feature by feature.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/features">Features</a></td><td><a href=".gitbook/assets/card-understand-features.svg">card-understand-features.svg</a></td></tr><tr><td><h4>Principles</h4></td><td>The design principles behind eSignet.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/principles">Principles</a></td><td><a href=".gitbook/assets/card-understand-principles.svg">card-understand-principles.svg</a></td></tr><tr><td><h4>Standards</h4></td><td>The specifications eSignet implements, such as OIDC and FAPI 2.0.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/standards">Standards</a></td><td><a href=".gitbook/assets/card-understand-standards.svg">card-understand-standards.svg</a></td></tr><tr><td><h4>Technology</h4></td><td>The technology stack eSignet is built on.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/technology">Technology</a></td><td><a href=".gitbook/assets/card-understand-technology.svg">card-understand-technology.svg</a></td></tr><tr><td><h4>Security</h4></td><td>How eSignet protects users and their data.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/standards#id-1.-security-standards">Standards #1. Security Standards</a></td><td><a href=".gitbook/assets/card-understand-security.svg">card-understand-security.svg</a></td></tr></tbody></table>



### Try eSignet

**No setup required.** Log in through a live eSignet flow with test data in about 5 minutes.

<table data-view="cards"><thead><tr><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td><h4>Try the live demo</h4></td><td>Log in through a live eSignet flow in the sandbox.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/local-deployment/try-it-out">Try It Out</a></td><td><a href=".gitbook/assets/card-try-demo.svg">card-try-demo.svg</a></td></tr><tr><td><h4>See what users see</h4></td><td>Walk through each login and consent step from the user's side.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/local-deployment/try-it-out/end-user-guide">End User Guides</a></td><td><a href=".gitbook/assets/card-try-user-view.svg">card-try-user-view.svg</a></td></tr><tr><td><h4>Pick a mock identity</h4></td><td>Choose a ready-made persona and its test identity number (UIN).</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/local-deployment/try-it-out/using-mock-data">Using Mock Data</a></td><td><a href=".gitbook/assets/card-try-test-identity.svg">card-try-test-identity.svg</a></td></tr></tbody></table>

### Choose your path

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td><mark style="color:$primary;">For app developers</mark></td><td><h4>Integrate your application</h4></td><td>Connect your application to eSignet as an OIDC relying party.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/develop/integration/relying-party">Relying Party</a></td><td><a href=".gitbook/assets/card-integrate-application.svg">card-integrate-application.svg</a></td></tr><tr><td><mark style="color:$primary;">For ID system owners</mark></td><td><h4>Connect an identity system</h4></td><td>Connect a national ID system, civil registry, or other identity source.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/develop/integration">Integration Guides - eSignet</a></td><td><a href=".gitbook/assets/card-connect-identity-system.svg">card-connect-identity-system.svg</a></td></tr><tr><td><mark style="color:$primary;">For operators</mark></td><td><h4>Deploy eSignet</h4></td><td>Install, configure, and run eSignet in production.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/build-and-deploy">Deploy</a></td><td><a href=".gitbook/assets/card-deploy-esignet.svg">card-deploy-esignet.svg</a></td></tr></tbody></table>

### Get started locally

<table data-view="cards"><thead><tr><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td><h4>1. Run eSignet locally</h4></td><td>Set up eSignet on your machine.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/local-deployment/local-setup">Local Setup</a></td><td><a href=".gitbook/assets/card-local-run.svg">card-local-run.svg</a></td></tr><tr><td><h4>2. Set up the mock identity system</h4></td><td>Load test identities before connecting a real identity system.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/local-deployment/local-setup/mock-id-system">Mock Identity System</a></td><td><a href=".gitbook/assets/card-local-mock-id.svg">card-local-mock-id.svg</a></td></tr><tr><td><h4>4. Onboard your relying party</h4></td><td>Integrate a relying party application with your local eSignet.</td><td><a href="https://github.com/mosip/esignet/blob/master/docs/relying-party-integration.md">https://github.com/mosip/esignet/blob/master/docs/relying-party-integration.md</a></td><td><a href=".gitbook/assets/card-local-connect-app.svg">card-local-connect-app.svg</a></td></tr></tbody></table>

### Resources and support

[FAQ](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/general/faq) | [Glossary](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/general/glossary) | [Resources](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/general/resources) | [Contribute](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/contribution) | [GitHub](https://github.com/mosip/esignet) | [Contact and support](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/general/contact-us) |



***



## Older Home Page

### What is eSignet <a href="#versions" id="versions"></a>

eSignet is an open-source, vendor-neutral digital identity authentication platform developed by MOSIP that provides secure and standardized access to online services.

* **Standards-Based Authentication**: Built on OpenID Connect (OIDC) RFCs, functioning as both an authorization and resource server for high-assurance verification.
* **Flexible & Standalone**: Operates independently and integrates seamlessly with any identity system or repository that supports attribute retrieval, not just MOSIP ecosystems.
* **Open-Source & Transparent**: Features publicly inspectable code, compliance standards, and integration paths, ensuring complete freedom from vendor lock-in or proprietary pricing.
* **Universal Applicability**: Acts as a modular identity layer across various digital service ecosystems, including citizen portals and financial applications.

<details>

<summary><i class="fa-video" style="color:$danger;">:video:</i>  <mark style="color:$primary;"><strong>Watch it here!</strong></mark></summary>

{% embed url="https://youtu.be/ZfUPRv71s_0?si=cr_Q8mFmad93kFS6" %}

</details>



### Documentation Versions <a href="#versions" id="versions"></a>

Welcome to the 'eSignet Documentation Home'. Here you can choose either from [**eSignet (GO)**](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/) documentation or the earlier one i.e. [**eSignet (Java)**](https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/ylzvZHp30DQ3rNCClELV/). You can refer to [**Releases**](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases) for complete version history.

<table data-card-size="large" data-card-wrap="false" data-view="cards"><thead><tr><th align="center"></th><th align="center"></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td align="center"><h4>eSignet (GO)</h4></td><td align="center">eSignet - (GO) Documentation</td><td><a href="https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/GLWCTe02ubJM6M7TcHlg/">Home eSignet-2.0.0</a></td></tr><tr><td align="center"><h4>eSignet (JAVA)</h4></td><td align="center">eSignet - (JAVA) Documentation</td><td><a href="https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/ylzvZHp30DQ3rNCClELV/">Home eSignet</a></td></tr></tbody></table>



### Why eSignet <a href="#versions" id="versions"></a>

<table data-view="cards"><thead><tr><th></th><th></th></tr></thead><tbody><tr><td><h4><strong>Low-Barrier Access</strong></h4></td><td>Built for progressive KYC, accommodating areas with restricted network infrastructure.</td></tr><tr><td><h4><strong>Device Agnostic</strong></h4></td><td>Supports feature-phone OTP verification alongside modern biometric workflows.</td></tr><tr><td><h4><strong>Zero Vendor Lock-In</strong></h4></td><td>Open-source, containerized codebase deployable on any host environment.</td></tr></tbody></table>

### Try eSignet <a href="#versions" id="versions"></a>

<table data-view="cards"><thead><tr><th align="center"></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td align="center"><i class="fa-gamepad-modern" style="color:$warning;">:gamepad-modern:</i></td><td><h4>Try It Out</h4></td><td>Click through a live login flow with mock data - No setup required!</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/local-deployment/try-it-out">Try It Out</a></td></tr><tr><td align="center"><i class="fa-map-location" style="color:$warning;">:map-location:</i></td><td><h4>Local Setup</h4></td><td>Run eSignet on your machine</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/local-deployment/local-setup">Local Setup</a></td></tr><tr><td align="center"><i class="fa-user-group" style="color:$warning;">:user-group:</i></td><td><h4>Using Mock Data</h4></td><td>Understand the mock identity system before connecting a real one</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/local-deployment/try-it-out/using-mock-data">Using Mock Data</a></td></tr></tbody></table>

### Getting Started With eSignet <a href="#versions" id="versions"></a>



<table data-view="cards"><thead><tr><th align="center"></th><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td align="center"><h4><i class="fa-plug" style="color:$warning;">:plug:</i></h4></td><td><h4>Integrate Your Application</h4></td><td>Connect via OpenID Connect (OIDC) as a 'Relying Party'</td><td></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/develop/integration/relying-party">Relying Party</a></td></tr><tr><td align="center"><h4><i class="fa-id-card" style="color:$warning;">:id-card:</i></h4></td><td><h4>Connect an Identity System</h4></td><td>Plug in an 'Identity Provider' or registry as an 'Authn Provider' </td><td></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/develop/integration">Integration Guides - eSignet</a></td></tr><tr><td align="center"><h4><i class="fa-helicopter" style="color:$warning;">:helicopter:</i></h4></td><td><h4>Deploy &#x26; Operate eSignet</h4></td><td>Run eSignet locally or stand it up in production</td><td></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/build-and-deploy">Deploy</a></td></tr></tbody></table>

### What's New!

{% hint style="success" icon="sparkles" %}
**New:** The core engine is being rewritten with GOLang and with all the previous features such as OIDC/OAuth/FAPI 2.0 contracts, Same UI, same integrations already here, built for better performance.

<a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/versions" class="button secondary">See what's new</a>
{% endhint %}



### New to eSignet? Start here!

<table data-view="cards"><thead><tr><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><h4>About eSignet</h4></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/what-is-esignet">What is eSignet?</a></td></tr><tr><td><h4>Features</h4></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/features">Features</a></td></tr><tr><td><h4>Principles</h4></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/principles">Principles</a></td></tr><tr><td><h4>License</h4></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/license">License</a></td></tr><tr><td><h4>Standards</h4></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/standards">Standards</a></td></tr><tr><td><h4>Technology</h4></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/standards">Standards</a></td></tr></tbody></table>



### Resources & Support

[FAQ](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/general/faq) | [Glossary](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/general/glossary) | [Resources](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/general/resources) |  [Contribution](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/contribution) | [Contact Us](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/general/contact-us)



### Coming from eSignet JAVA?

{% hint style="success" %}
eSignet 2.0.0 does not include the **Signup** product or **wallet-based login** (wallet login is planned for a future release under OpenID4VP - see [Roadmap 2026](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/roadmap/roadmap-2026)). If you're looking for Signup documentation, switch to the [**eSignet JAVA** ](https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/ylzvZHp30DQ3rNCClELV/)docs using the version switcher above.
{% endhint %}







