---
description: >-
  Explore seamless eSignet integration with guides on authentication, digital
  wallets, and more.
---

# Integration Guides - eSignet

## Integration Guides

eSignet is built as a core engine with a small number of deliberately pluggable extension points, rather than one monolithic system you have to fork to adapt. That separation — covered in [Architecture](../architecture/) — is what makes it possible to connect eSignet to a different identity backend, change how it logs activity, or let your own application use it for login, without touching the engine itself.

This section assumes you already know what eSignet is and how its pieces fit together. It's for when you're ready to extend or connect to eSignet for your own use case, and it points you to the exact extension point and reference implementation to start from.

There are three ways to integrate with eSignet:

### Connect eSignet to Your Identity System

eSignet doesn't hardcode how a person's identity gets verified — that's handled by a pluggable `authnprovider` interface. If you want eSignet to authenticate people against your own identity system (a national ID registry, a credential store, an existing user directory), you implement this interface rather than modifying eSignet itself, the fastest way to see a real, working `authnprovider` before you write your own.

<table data-view="cards"><thead><tr><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><a href="../../.gitbook/assets/Authnprovider.png">Authnprovider.png</a></td><td><a href="authenticator.md">authenticator.md</a></td></tr></tbody></table>

### Add or Customize Audit Logging

Every authentication and consent event eSignet handles can be captured for audit purposes — who logged in, when, and what was consented to. This is also implemented as a plugin, so you can route audit events wherever your organization needs them (a SIEM, a compliance data store, a log pipeline) instead of being limited to whatever eSignet logs by default.

<table data-view="cards"><thead><tr><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><a href="../../.gitbook/assets/Audit Plugin.png">Audit Plugin.png</a></td><td><a href="audit.md">audit.md</a></td></tr></tbody></table>

### Connect Your Application to eSignet

If you're building an application — a website, a mobile app, a backend service — that should let people log in with eSignet, this is your path. It covers registering your application as a relying party, exchanging the result of a login for tokens, and retrieving the user's shared details.

<table data-view="cards"><thead><tr><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td><a href="../../.gitbook/assets/Relying Party Integration.png">Relying Party Integration.png</a></td><td><a href="relying-party/">relying-party</a></td></tr></tbody></table>

### Which One Do I Need?

| If you want to...                                                                           | Go to                                       |
| ------------------------------------------------------------------------------------------- | ------------------------------------------- |
| Plug eSignet into your own identity backend (ID registry, credential store, user directory) | [Authnprovider](authenticator.md)           |
| Capture or export logs of authentication and consent activity                               | [Audit Plugin](audit.md)                    |
| Let users of your application log in with eSignet                                           | [Relying Party Integration](relying-party/) |

