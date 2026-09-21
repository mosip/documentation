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

<table data-view="cards">
  <thead>
    <tr>
      <th></th>
      <th></th>
      <th data-hidden data-card-target data-type="content-ref"></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Relying Parties / Apps</strong></td>
      <td>Integrate your application via standard OpenID Connect (OIDC) client libraries. Configure login prompts, scopes, and claims.</td>
      <td><a href="esignet-authentication/develop/integration/relying-party/relying-party-onboarding.md">relying-party-onboarding.md</a></td>
    </tr>
    <tr>
      <td><strong>Identity Providers &#x26; Registries</strong></td>
      <td>Connect core identity systems or national registries to eSignet using standard runtime plugins.</td>
      <td><a href="esignet-authentication/develop/integration/authenticator.md">authenticator.md</a></td>
    </tr>
    <tr>
      <td><strong>System Operators</strong></td>
      <td>Deploy eSignet on Kubernetes, from a single mock-plugin sandbox up to a full MOSIP-integrated production cluster.</td>
      <td><a href="build-and-deploy/deployment-guide.md">deployment-guide.md</a></td>
    </tr>
  </tbody>
</table>

## Why eSignet

<table data-view="cards">
  <thead>
    <tr>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Low-Barrier Access</strong></td>
      <td>Built for progressive KYC, accommodating areas with restricted network infrastructure.</td>
    </tr>
    <tr>
      <td><strong>Device Agnostic</strong></td>
      <td>Supports feature-phone OTP verification alongside modern biometric workflows.</td>
    </tr>
    <tr>
      <td><strong>Zero Vendor Lock-In</strong></td>
      <td>Open-source, containerized codebase deployable on any host environment.</td>
    </tr>
  </tbody>
</table>

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

This documentation currently covers the eSignet 1.x line, with eSignet-Go (2.x) content being added progressively. See [Releases](roadmap-and-releases/versions/README.md) for the full version history.

<details>

<summary>eSignet 1.x (Stable)</summary>

The current stable line — OIDC Core, MOSIP/Sunbird RC/Mock identity plugins, and the deployment guide in this documentation set.

</details>

<details>

<summary>eSignet 2.x / eSignet-Go (In progress)</summary>

The next generation of eSignet, being rewritten in Go. Deployment-side documentation for the 2.x release line is being added under [Deployment Guide](build-and-deploy/deployment-guide.md) as it stabilizes — check there for the latest release-branch-specific instructions.

</details>
