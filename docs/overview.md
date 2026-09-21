---
description: A Modern and Inclusive Digital Identity Authentication Solution
hidden: false
icon: house
---

# eSignet Documentation

A modern, standards-compliant identity gateway for building secure digital onboarding and authentication experiences — deployable against any identity system, and built to work even in low-connectivity environments.

{% hint style="info" %}
**New to eSignet?** Start with [Principles](readme/principles.md) and [Standards & Security](readme/standards.md) before diving into integration.
{% endhint %}

## Choose your integration track

{% content-ref url="esignet-authentication/develop/integration/relying-party/relying-party-onboarding.md" %}
[relying-party-onboarding.md](esignet-authentication/develop/integration/relying-party/relying-party-onboarding.md)
{% endcontent-ref %}

{% content-ref url="esignet-authentication/develop/integration/authenticator.md" %}
[authenticator.md](esignet-authentication/develop/integration/authenticator.md)
{% endcontent-ref %}

{% content-ref url="build-and-deploy/deployment-guide.md" %}
[deployment-guide.md](build-and-deploy/deployment-guide.md)
{% endcontent-ref %}

## Why eSignet

* **Low-barrier access** — built for progressive KYC, works in areas with restricted network infrastructure.
* **Device agnostic** — supports feature-phone OTP flows alongside modern biometric authentication.
* **Zero vendor lock-in** — open-source and containerized, deployable on any host environment.

## Protocol reference

{% hint style="info" %}
**OIDC compliance:** eSignet exposes a standard OIDC discovery document. Relying parties can resolve signing keys and endpoint URLs from it directly, rather than hardcoding them.
{% endhint %}

```http
GET /.well-known/openid-configuration
```

{% hint style="warning" %}
Swap in your environment's actual host — the path above is the standard OIDC discovery endpoint, shown illustratively, not verified against a specific live deployment.
{% endhint %}

## Versions

This documentation currently covers the eSignet 1.x line. See [Releases](roadmap-and-releases/versions/README.md) for the full version history.

{% hint style="warning" %}
The `home.html` draft models version switching as a same-page dropdown that hides/shows content with JavaScript — GitBook doesn't support that in published content. The native equivalent is separate Spaces or Variants per version, switched via GitBook's own UI, not a toggle inside one page. Once v2.x (eSignet-Go) documentation exists as its own page tree, this section should link out to it directly (or become a Variant switcher, if your plan supports Variants), rather than trying to hide/show content here.
{% endhint %}
