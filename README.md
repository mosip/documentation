---
cover: .gitbook/assets/es-docs-home-banner-1.jpg
coverY: 0
layout:
  width: wide
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
    visible: false
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

# eSignet

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

<a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/versions#version-v2.0.0" class="button primary">Latest release</a> <a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/versions" class="button secondary">Release notes</a> <a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/roadmap" class="button secondary">Roadmap</a>
{% endhint %}

### Versions & Releases

<table data-view="cards"><thead><tr><th></th><th></th><th data-type="content-ref"></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td><h4>eSignet 2.x</h4></td><td>Recommended for new implementations. Built in Go.</td><td><a href="https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/GLWCTe02ubJM6M7TcHlg/">Home eSignet-2.0.0</a></td><td><a href="https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/GLWCTe02ubJM6M7TcHlg/">Home eSignet-2.0.0</a></td><td><a href=".gitbook/assets/card-version-go.svg">card-version-go.svg</a></td></tr><tr><td><h4>eSignet 1.x</h4></td><td>For organizations operating an existing Java-based deployment. Review feature<br>availability and migration guidance before choosing this version.</td><td><a href="https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/ylzvZHp30DQ3rNCClELV/">Home eSignet</a></td><td><a href="https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/ylzvZHp30DQ3rNCClELV/">Home eSignet</a></td><td><a href=".gitbook/assets/card-version-java.svg">card-version-java.svg</a></td></tr><tr><td><h4>Migrating from eSignet 1.x?</h4></td><td>Compare capabilities, understand changes, and plan your transition to<br>eSignet 2.x.</td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/features">Features</a></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/readme/features">Features</a></td><td><a href=".gitbook/assets/card-version-migration.svg">card-version-migration.svg</a></td></tr><tr><td><h4>Release notes and roadmap</h4></td><td>Every release so far, and what's coming next.</td><td></td><td><a href="https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases">Roadmap and Releases</a></td><td><a href=".gitbook/assets/card-version-roadmap.svg">card-version-roadmap.svg</a></td></tr></tbody></table>

{% hint style="info" %}
**Coming from eSignet Java?** eSignet 2.0.0 does not include the **Signup** product or **wallet-based login** yet. Wallet login is planned for a future release using OpenID4VP..

* [Signup documentation (eSignet 1.x)](https://app.gitbook.com/o/-M1FyzBr-VmticWYm8QI/s/ylzvZHp30DQ3rNCClELV/)
* [Planned functionality](https://app.gitbook.com/s/GLWCTe02ubJM6M7TcHlg/roadmap-and-releases/roadmap/roadmap-2026)
{% endhint %}

### Why eSignet?

<table data-view="cards"><thead><tr><th></th><th></th><th data-hidden data-card-cover data-type="image">Cover image</th></tr></thead><tbody><tr><td><h4>Standards-based login</h4></td><td>Applications connect through OpenID Connect rather than a custom protocol, so teams can use existing OIDC libraries.</td><td><a href=".gitbook/assets/card-why-standards.svg">card-why-standards.svg</a></td></tr><tr><td><h4>Any identity system</h4></td><td>Connects to any identity system or registry that can verify a person and return their details.</td><td><a href=".gitbook/assets/card-why-any-identity.svg">card-why-any-identity.svg</a></td></tr><tr><td><h4>Works on basic phones</h4></td><td>OTP on feature phones means people without smartphones or reliable internet can still log in.</td><td><a href=".gitbook/assets/card-why-basic-phones.svg">card-why-basic-phones.svg</a></td></tr><tr><td><h4>Runs anywhere</h4></td><td>Deploy on any cloud or on-premises with containers. Free to use, with no vendor lock-in.</td><td><a href=".gitbook/assets/card-why-runs-anywhere.svg">card-why-runs-anywhere.svg</a></td></tr><tr><td><h4>Consent built in</h4></td><td>Users see which details an application asks for, and approve before anything is shared.</td><td><a href=".gitbook/assets/card-why-consent.svg">card-why-consent.svg</a></td></tr></tbody></table>

### Understand more about eSignet

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



