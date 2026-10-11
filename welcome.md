---
description: Everything you need to build, deploy, and manage eSignet.
hidden: true
icon: hand-wave
---

---
coverY: 0
layout:
  width: wide
  cover:
    visible: true
    size: background
    mask: radial
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


































# Welcome

Welcome to the platform. These docs cover everything from your first project to advanced workflows — pick a starting point below or ask the Assistant to jump straight to what you need.

<button type="button" class="button primary" data-action="ask" data-icon="gitbook-assistant">Ask a question…</button>

<button type="button" class="button secondary" data-action="ask" data-query="How do I deploy my first project" data-icon="rocket-launch">Deploy your first project</button><button type="button" class="button secondary" data-action="ask" data-query="How do I set up a custom domain" data-icon="globe">Set up a custom domain</button><button type="button" class="button secondary" data-action="ask" data-query="How do I invite my team" data-icon="user-group">Invite your team</button>

***

{% hint style="success" icon="sparkles" %}
**New: scheduled deploys and team-level audit logs.** Schedule deploys for any future date and review every action taken in your workspace.

<a href="https://gitbook.com/docs/changelog" class="button secondary">See what's new</a>
{% endhint %}

## Where to start

<table data-card-size="large" data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><h4><i class="fa-rocket-launch" style="color:$primary;">:rocket-launch:</i></h4></td><td><h4>Getting started</h4></td><td>Set up your account and ship your first project in minutes.</td><td><a href="/broken/pages/PbYb0GukRhiS4qCHdRal">Broken link</a></td></tr><tr><td><h4><i class="fa-book" style="color:$primary;">:book:</i></h4></td><td><h4>Core concepts</h4></td><td>Understand workspaces, projects, and how permissions work.</td><td><a href="/broken/pages/EFXeLTHVDQLFgK0Iy51O">Broken link</a></td></tr><tr><td><h4><i class="fa-graduation-cap" style="color:$primary;">:graduation-cap:</i></h4></td><td><h4>Guides</h4></td><td>Walkthroughs for common tasks like custom domains and automations.</td><td><a href="/broken/pages/oUUNprjFZmH3rqDBvb9h">Broken link</a></td></tr><tr><td><h4><i class="fa-book-open" style="color:$primary;">:book-open:</i></h4></td><td><h4>Reference</h4></td><td>Detailed configuration options, limits, and terminology.</td><td><a href="/broken/pages/AYVJmAXbSHYSDodrPBYA">Broken link</a></td></tr></tbody></table>

## Popular tasks

<table data-view="cards"><thead><tr><th></th><th data-type="content-ref"></th><th data-type="content-ref"></th><th data-type="content-ref"></th></tr></thead><tbody><tr><td><h4>For builders</h4></td><td><a href="/broken/pages/416edc1381c20849bc41111b02e482a722a49b94">Broken link</a></td><td><a href="/broken/pages/c3101d8e098a6f696c75f6bda47d0ea5fdade1e5">Broken link</a></td><td><a href="/broken/pages/56a52747d54863f8df67ff3ce908938888c69b66">Broken link</a></td></tr><tr><td><h4>For admins</h4></td><td><a href="/broken/pages/fb922e107b31a3e9e9fcf81410029e993b0a9afc">Broken link</a></td><td><a href="/broken/pages/65332f63d0b6cedd6ac718136ba8d89ec6cc1a4d">Broken link</a></td><td><a href="/broken/pages/8d7897a648fcd91cdfe61c6055c3fc9a2774e089">Broken link</a></td></tr><tr><td><h4>For developers</h4></td><td><a href="/broken/pages/d9d593aeabc52a165190bf8c93720491a4eb9682">Broken link</a></td><td><a href="/broken/pages/6625e4a7113b37994c505597f0f9e2c62008a5c5">Broken link</a></td><td><a href="/broken/pages/65332f63d0b6cedd6ac718136ba8d89ec6cc1a4d">Broken link</a></td></tr></tbody></table>



### Use the AI insights as a homepage input

**Yes.** They show real reader intent and documentation gaps.

Treat them as a strong signal, not the only signal. One recent session generated many related questions. Avoid treating every repeated query as a separate user need.

### Current learning from the last 90 days

* **112 distinct questions** produced **202 AI answers**.
* **172 answers were relevant**. Yet **78 answers were partial or unanswered**.
* Most questions are **reference-oriented**. Readers need precise technical details.
* No answer received explicit positive or negative feedback yet.

### Highest-demand themes

1. **Client onboarding and keys**\
   Readers repeatedly ask about `ESIGNET_CLIENT_KID`, private-key PEM values, JWKS, JWK validity, and key generation.
2. **`private_key_jwt` integration**\
   Questions cover assertions, headers, claims, algorithms, `aud`, `kid`, `x5c`, and token endpoint behavior.
3. **Authentication flows and APIs**\
   Readers seek OTP steps, authentication endpoints, userinfo claims, token exchange, and debug guidance.
4. **Deployment and configuration**\
   Readers ask about Kubernetes, Docker Compose, Helm versions, compatibility, and initial deployment.
5. **Product capabilities**\
   Common discovery topics include authentication methods, biometrics, wallet login, OpenID4VCI, and MOSIP integration.

### Homepage recommendation

Make these visible as primary cards or entry points:

* **Get started with eSignet**
* **Integrate a relying party**
* **Configure client keys and `private_key_jwt`**
* **Authentication flows and API reference**
* **Deploy and operate eSignet**
* **Troubleshoot authentication**

Add a prominent link named **Client key setup**. This is the clearest immediate need.

### Documentation gaps to prioritize

Create or strengthen concise guides for:

* Generating keys and setting `ESIGNET_CLIENT_PRIVATE_KEY_PEM`
* Finding and configuring `ESIGNET_CLIENT_KID`
* Registering a relying-party public JWK
* Complete `private_key_jwt` assertion examples
* OTP request flow, errors, and debugging
* Compatibility and upgrade requirements

The insights support a homepage that routes readers by task. They do **not** support a generic product-marketing homepage alone.
