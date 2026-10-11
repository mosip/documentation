---
description: Everything you need to build, deploy, and manage eSignet.
hidden: true
icon: hand-wave
---

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
