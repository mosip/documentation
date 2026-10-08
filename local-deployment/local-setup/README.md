# Local Setup

Getting eSignet running on your own machine is usually the first real interaction you have with the codebase, before writing any integration, most people just want to watch the OIDC flow work end to end. Docker Compose is how eSignet makes that possible without a lengthy manual setup.

### Why Docker Compose

eSignet's OIDC flow depends on more than the eSignet service itself, it needs a database and a source of identity data to authenticate against. Rather than asking you to install and configure each of these individually, matching versions and wiring configuration by hand, Docker Compose brings up the whole stack with a single command and tears it down just as easily. It also mirrors the way these services actually run in production - as separate containers behind well-defined ports, so what you learn locally carries over directly to how the pieces fit together in a real deployment.

### What's Included

A real government or enterprise identity system usually isn't something you have, or should have access to in a local development environment. So eSignet ships with a [Mock Identity System](mock-id-system.md): a stand-in identity backend that eSignet's [Authn Provider](../../develop/integration/authenticator.md) connects to, supporting the same authentication factors a real system would (PIN, OTP, and biometrics). This lets the full OIDC flow run end to end locally without any external dependency.

### Two Ways to Start It

There are two Docker Compose files, and which one you need depends on what you're doing:

| Compose file                                                | Services it brings up                                                                   | Use it when                                                                                                     |
| ----------------------------------------------------------- | --------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| **Full demo** -`docker-compose.yaml`                        | Database, Mock Identity System, the eSignet OIDC/OAuth2 service, and the OIDC login UI. | You want to evaluate or demo eSignet end to end without building anything from source.                          |
| **Dev dependencies only** - `dependent-docker-compose.yaml` | Database and Mock Identity System only                                                  | You're running the eSignet service itself from source and don't want a containerized copy running alongside it. |

### Get Started

{% hint style="info" icon="github" %}
**Docker Compose setup**: GitHub — [docker-compose](https://github.com/mosip/esignet/tree/master/docker-compose)
{% endhint %}

{% hint style="info" icon="github" %}
**Step-by-step setup guide**: [Local setup README](https://github.com/mosip/esignet/blob/master/docker-compose/README.md)&#x20;
{% endhint %}

### In This Section

<table data-view="cards"><thead><tr><th data-hidden data-type="content-ref">Cover image</th><th data-hidden data-card-cover data-type="image">Cover image</th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td></td><td><a href="../../.gitbook/assets/Mock Identity System.png">Mock Identity System.png</a></td><td><a href="mock-id-system.md">mock-id-system.md</a></td></tr><tr><td></td><td><a href="../../.gitbook/assets/Mock Relying Party.png">Mock Relying Party.png</a></td><td><a href="mock-client-application.md">mock-client-application.md</a></td></tr></tbody></table>
