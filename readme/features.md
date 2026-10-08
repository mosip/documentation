---
description: Explore eSignet’s powerful features for secure access.
---

# Features

### Capabilities at a Glance

| Area                      | What It Covers                                                                                               |
| ------------------------- | ------------------------------------------------------------------------------------------------------------ |
| **Authentication**        | Password, OTP, Knowledge-Based Identification (KBI), biometrics (SBI 2.0), etc. - selected per relying party |
| **Consent & Privacy**     | A built-in Consent Registry, configurable expiry, and three consent modes: mandatory, re-consent, and bypass |
| **Security & Compliance** | FAPI 2.0 Security Profile — Pushed Authorization Requests, DPoP, and issuer identity verification            |
| **Personalization**       | Branded, context-aware UI and out-of-the-box multi-language support                                          |

### Authentication: Choosing How a User Proves Their Identity

A banking transaction and a library sign-in don't need the same bar for proof — so instead of fixing one login method for every user, eSignet lets each relying party decide which authentication factors apply, dynamically, based on the user's context, the sensitivity of the service, or the assurance level the transaction requires.

**Password:** Traditional username-and-password login, for relying parties that prefer a familiar credential-based flow.

**OTP (One-Time Password):** One-time codes sent via SMS or email for time-bound access, well suited to situations where biometrics is not available to the user.

**Knowledge-Based Identification (KBI):** Authentication through answers to identity-based questions, aimed at low-connectivity or limited-device scenarios where OTP or biometric capture isn't practical.

{% hint style="warning" icon="question" %}
**FAQ Highlights for KBI:**

* [How to configure for KBI with Sunbird RC?](../general/faq.md#how-to-configure-knowledge-based-identification-kbi-with-sunbirdrc)
{% endhint %}

**Biometric authentication:** Authentication via biometric devices compliant with the IEEE P3167 [SBI 2.0 standard](standards.md#id-1.-security-standards). Modalities are selected on demand: a service provider can enable facial recognition, fingerprint, or iris scan independently, based on device capability, assurance need, or user preference.&#x20;

{% hint style="info" icon="wallet" %}
**Note:** Wallet-based authentication is not supported in eSignet v2.0.0. It will be added in an upcoming release to bring the Go version to feature parity with eSignet (Java).
{% endhint %}

### Consent & Privacy: Keeping Data Sharing Transparent and Reversible

Authentication only tells a relying party who a user is — what happens next, how their data is shared and for how long, is governed separately by eSignet's consent layer, so that consent is never a single yes/no gate a relying party can quietly bypass.

* **Consent storage**: Every user consent is recorded in a built-in Consent Registry, giving both users and service providers an auditable record of what was agreed to and when.
* **Consent expiry configuration**: Relying parties define how long a consent stays valid — per session, per time window, or indefinitely — rather than eSignet enforcing one fixed policy for everyone.
* **Configuring claims**: eSignet supports every [standard claims](../develop/configuration/#claims-what-personal-data-a-client-can-receive) defined by the OpenID Connect (OIDC) protocol, and custom claim configurations can be layered on top depending on a service's authentication requirements.
* **Configurable consent behavior**: Consent handling itself can be tuned per flow or per service, in one of three modes:
  * **Mandatory consent:** Collect it regardless of any prior decision.
  * **Re-consent:** Prompt again automatically when claim scopes change or existing consent has expired, useful after a policy update.
  * **Bypass consent:** Skip the step entirely where it isn't warranted.

### Security & Compliance: Meeting the FAPI 2.0 Bar

Identity transactions carry more risk than an average API call, which is why eSignet complies with the [FAPI (Financial-grade API) 2.0 Security Profile](standards.md#id-3.-supported-rfcs) — a set of standards built on OAuth 2.0 and OpenID Connect for high-assurance, interoperable, phishing-resistant flows, widely adopted in banking, government identity management, and digital public infrastructure, where confidentiality, integrity, and client assurance all have to be provable rather than assumed.

Adopting FAPI 2.0 raises eSignet's baseline security posture against real-world risks in front-channel flows, token misuse, and server impersonation — protecting sensitive claims and tokens, narrowing the attack surface of its authorization flows, and improving interoperability with partner systems that already follow financial-grade security practices.

eSignet implements three RFCs that together harden its authorization flows:

* **Pushed Authorization Requests (PAR):** Moves authorization requests from the browser front-channel to a secure server-to-server POST request, so authorization parameters (redirect URIs, scopes, claims) can't be exposed or tampered with in a browser URL, and the authorization server processes exactly what the client intended.
* **Demonstrating Proof-of-Possession (DPoP)-** Binds an access token to a client-held cryptographic key and requires a signed, per-request proof of possession, which makes a stolen token unusable by a third party and blocks replay of an intercepted one.
* **Authorization Server Issuer Identification:** Enforces verifiable issuer metadata so a client can confirm it's talking to the intended authorization server, preventing environment mix-ups and impersonation, such as sandbox-versus-production confusion or a malicious endpoint posing as the real one.

Together, these defend high-risk OAuth/OIDC flows against tampering, mix-up attacks, phishing, token theft and replay, and leakage through front-channel exposure.&#x20;

{% hint style="success" icon="openid" %}
**Attacker model and mitigations with FAPI 2.0**

FAPI 2.0 defends high-risk OAuth/OIDC flows against tampering, mix-up, phishing, token theft/replay, and leakage via front-channel exposure. To know more about this refer [here](https://openid.net/specs/fapi-2_0-attacker-model.html)
{% endhint %}

{% hint style="success" icon="openid" %}
FAPI 2.0 For a deeper understanding of FAPI 2.0 and the mechanisms implemented in eSignet, see the [FAPI 2.0 Security Profile specification](https://openid.net/specs/fapi-security-profile-2_0-final.html).
{% endhint %}

### Personalization: Adapting to Each Relying Party

An identity layer only feels native to a service if it looks and reads like part of that service — so eSignet's UI and language support are both built to be configured per relying party rather than shipped as one fixed screen.

**Customizable UI**

* **Multiple login ID options**: let users choose from different login identifiers, such as email, phone number, or username, improving accessibility across different user segments.
* **Theme and layout customization**: match a portal's branding, including colors, logos, fonts, and button styles.
* **Context-aware UI behavior**: adjust the flow based on user type, assurance level, or the authentication factor chosen — for example, showing or hiding biometric prompts or OTP inputs dynamically rather than displaying every option at once.

**Language support**

eSignet ships with multilingual UI support out of the box — Arabic, English, Hindi, Kannada, and Tamil — and additional languages can be integrated to meet country- or region-specific requirements.

{% hint style="warning" icon="question" %}
**Open questions:**

* [How to add a new language to eSignet?](../general/faq.md#how-to-add-a-new-language-in-esignet)
* [How to remove a language from the eSignet default setup?](../general/faq.md#how-to-remove-a-language-from-the-esignet-default-setup)
{% endhint %}
